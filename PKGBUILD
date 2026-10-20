# Maintainer: ShortArrow <bamboogeneral@shortarrow.jp>

# Built from the published linux-x64 self-contained release asset rather than
# from source or from the NuGet tool package. The `dotnet tool install` route
# needs the ASP.NET Core runtime (the CLI's runtimeconfig references
# Microsoft.AspNetCore.App), so an Arch user carrying only `dotnet-runtime`
# gets "No frameworks were found". A self-contained publish carries its own
# runtime and needs no .NET on the system at all.

pkgname=ivi-cli-bin
# The release version as tagged upstream. pacman refuses a `-` in pkgver, and
# without one vercmp still orders 0.5.0beta.1 after 0.4.0 and before
# 0.5.0beta.2 and 0.5.0, so a stable release upgrades a beta without an epoch.
_pkgver=0.5.0-beta.1
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Integrated CLI for managing, diagnosing, and operating VISA/IVI instruments (prebuilt binary)"
arch=('x86_64')
url="https://github.com/ShortArrow/ivi-cli"
license=('MIT' 'Apache-2.0')
# ldd on the shipped binary resolves libc/libdl/libm/libpthread/librt from
# glibc, libgcc_s.so.1 from libgcc and libstdc++.so.6 from libstdc++ — the two
# split packages rather than the gcc-libs metapackage, which would drag in ten
# more runtimes nothing here touches.
#
# The rest of the list is invisible to ldd because .NET dlopen()s it, so the
# entry was established by removing the package and running the CLI. ICU is
# not on it: the CLI runs with invariant globalization and starts without it.
#
#   openssl  — `ivicli visa scan` and `ivicli api start --tls-self-signed`
#              load libssl.so.3 / libcrypto.so.3; with openssl removed,
#              `visa scan` dies on "No usable version of libssl was found".
#
# zlib is loaded too, but by libssl rather than by the CLI, so openssl
# carries it and namcap reports an explicit entry as already satisfied.
depends=('glibc' 'libgcc' 'libstdc++' 'openssl')
provides=('ivi-cli')
conflicts=('ivi-cli')
# The single-file bundle appends its payload after the ELF image; stripping
# rewrites the file and destroys it. Without symbols to split out there is no
# debug package either, and leaving it on ships an empty /usr/src/debug dir.
options=('!strip' '!debug')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$_pkgver/ivicli-$_pkgver-linux-x64.zip")
sha256sums=('9ed6a68cf920a23f10f2b8b2f483f8da86885b38c4bb925f0a82f86ee091cd10')

build() {
  chmod +x "$srcdir/ivicli"

  # `ivicli completion` supports bash, zsh and powershell only — there is no
  # fish emitter upstream, so no fish completion is shipped.
  "$srcdir/ivicli" completion bash > "$srcdir/ivicli.bash"

  # The zsh emitter produces an eval-style snippet (defines _ivicli, then
  # compdef). Two lines of packaging glue turn it into an autoloadable
  # site-function: the #compdef tag so compinit binds it to `ivicli`, and the
  # trailing call so the first Tab completes instead of only registering.
  {
    echo '#compdef ivicli'
    "$srcdir/ivicli" completion zsh
    echo '_ivicli "$@"'
  } > "$srcdir/_ivicli"
}

package() {
  install -Dm755 "$srcdir/ivicli" "$pkgdir/usr/bin/ivicli"

  install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "$srcdir/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"

  # The .pdb and .xml files in the release zip are debug symbols and XML doc
  # comments for library consumers; neither belongs in a system package.

  install -Dm644 "$srcdir/ivicli.bash" "$pkgdir/usr/share/bash-completion/completions/ivicli"
  install -Dm644 "$srcdir/_ivicli" "$pkgdir/usr/share/zsh/site-functions/_ivicli"
}
