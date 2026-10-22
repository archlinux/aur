# Maintainer: ShortArrow <bamboogeneral@shortarrow.jp>

# Built from source against the system .NET, as the counterpart to
# ivi-cli-bin. The two exist for different reasons rather than as a default
# and an alternative:
#
#   ivi-cli      links the system runtime, so .NET security fixes arrive
#                through pacman and the install is a few MB.
#   ivi-cli-bin  carries its own runtime, so it needs no .NET at all.
#
# Size is not the distinction. On a machine with no .NET, pulling in
# aspnet-runtime costs ~97 MiB of dotnet-runtime + aspnet-runtime +
# dotnet-host + libunwind, against ~102 MiB for the self-contained build —
# close enough to a wash. This package is the better choice when the
# runtime is already present or shared with other .NET software.
#
# aspnet-runtime rather than dotnet-runtime: the CLI references
# Microsoft.AspNetCore.App (ivicli api start embeds an ASP.NET Core
# listener), so the base runtime alone leaves it refusing to start with
# "No frameworks were found".

pkgname=ivi-cli
# The release version as tagged upstream. pacman refuses a `-` in pkgver, and
# without one vercmp still orders 0.5.0beta.1 after 0.4.0 and before
# 0.5.0beta.2 and 0.5.0, so a stable release upgrades a beta without an epoch.
_pkgver=0.5.0
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Integrated CLI for VISA/IVI instruments: SCPI over HiSLIP, VXI-11, raw socket, USBTMC and serial"
arch=('x86_64')
url="https://github.com/ShortArrow/ivi-cli"
license=('MIT' 'Apache-2.0')
depends=('aspnet-runtime')
makedepends=('dotnet-sdk')
conflicts=('ivi-cli-bin')
# The publish output is managed assemblies next to a generated apphost;
# there are no sources to split out, so a debug package would carry an
# empty /usr/src/debug and a build-id symlink pointing at nothing.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('1acdcd3f5370b895f08ae939d265af70903847311e5e034403b849ecef985a9e')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"

  # global.json pins the SDK to 10.0.204 with rollForward=latestFeature,
  # which cannot roll down to the 10.0.1xx band Arch ships — the build
  # aborts with "A compatible .NET SDK was not found". The pin exists so
  # upstream CI builds on one known SDK; a distribution package builds on
  # the SDK the distribution has, and both produce the same net10.0 output.
  rm -f global.json
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  # Keep the SDK's writes inside the build directory: NuGet and the CLI
  # otherwise populate $HOME, which makepkg does not own.
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export NUGET_PACKAGES="$srcdir/nuget"

  # RestoreLockedMode=false because the committed lock files are written for
  # the SDK patch band the project's CI uses, and the Arch dotnet-sdk moves
  # independently of it; locked restore would fail on lock files that are
  # correct upstream.
  # AllowMissingPrunePackageData because Arch's dotnet-sdk ships without the
  # PrunePackageData folder, and without the flag the ASP.NET Core reference
  # fails the build outright (NETSDK1226). Pruning only trims package
  # references the framework already provides, so its absence costs nothing
  # here beyond a slightly larger intermediate set.
  dotnet publish src/IviCli.Cli/IviCli.Cli.csproj \
    --configuration Release \
    --self-contained false \
    -p:RestoreLockedMode=false \
    -p:AllowMissingPrunePackageData=true \
    -p:Version="$_pkgver" \
    --output "$srcdir/publish"

  # The binary emits its own completions. bash and zsh are what it supports
  # (plus powershell, which has no Arch filesystem convention); there is no
  # fish emitter upstream, so no fish completion is shipped.
  "$srcdir/publish/ivicli" completion bash > "$srcdir/ivicli.bash"

  # The zsh emitter returns an eval-style snippet that defines _ivicli and
  # then calls compdef. As a site-function file it would never bind, because
  # compinit only registers files carrying a #compdef tag, so two lines of
  # packaging glue wrap it: the tag, and a trailing call so the first Tab
  # completes rather than merely registering.
  {
    echo '#compdef ivicli'
    "$srcdir/publish/ivicli" completion zsh
    echo '_ivicli "$@"'
  } > "$srcdir/_ivicli"
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  # A framework-dependent publish is an apphost next to its managed
  # assemblies, which have to stay together; /usr/lib/$pkgname holds the set
  # and /usr/bin carries the entry point.
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  find "$srcdir/publish" -maxdepth 1 -type f \
    ! -name '*.pdb' ! -name '*.xml' \
    -exec install -Dm644 -t "$pkgdir/usr/lib/$pkgname" {} +
  chmod 755 "$pkgdir/usr/lib/$pkgname/ivicli"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/ivicli" "$pkgdir/usr/bin/ivicli"

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 THIRD-PARTY-NOTICES.md \
    "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"

  install -Dm644 "$srcdir/ivicli.bash" \
    "$pkgdir/usr/share/bash-completion/completions/ivicli"
  install -Dm644 "$srcdir/_ivicli" "$pkgdir/usr/share/zsh/site-functions/_ivicli"
}
