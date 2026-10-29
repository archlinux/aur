# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-mediatr-12
pkgver=12.5.0
_contractsver=2.0.1
pkgrel=1
pkgdesc="Simple mediator implementation in .NET, MediatR 12 and MediatR.Contracts (NuGet packages)"
arch=('any')
url='https://github.com/jbogard/MediatR'
license=('Apache-2.0')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
)
# MediatR 13 and later come under the Reciprocal Public License or a commercial license instead of
# Apache 2.0, so this packages the last release of MediatR 12.
# The commit it was published from (tag v12.5.0). MediatR.Contracts 2.0.1 was published from an
# earlier commit, only its project file changed since.
_commit="8a64581e2570e7410c5f44835d9ea112beccbe6b"
source=("MediatR-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('9923173eb9f1225c0535294cd4eff087440acdde2861c3a68182d9badc9e4c2312d69e0981404d31c97df652dc6cca1116f87cc5f8d8a6defe5ea1c116270809')
b2sums=('7b4b97f6bf51ab9d32c48b624be2a26f3a000b6a6ef49df83dd46e7ea31a591bd45afc88f5f3d32daeb8fed7175014035feec70afa35d5318a5633a805dd9420')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The repository information usually comes from git, which would find the repository this PKGBUILD
  # is in instead. The runtime packages from the source-built artifacts are newer than the versions
  # referenced (NU1603).
  _build_arguments=(
    --configuration Release
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
    -p:RepositoryType=git
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:IncludeSymbols=false
    -p:WarningsNotAsErrors=NU1603
  )
  # MinVer computes the version of MediatR from the git tag
  _mediatr_arguments=(
    -p:MinVerSkip=true
    -p:Version="$pkgver"
    -p:AssemblyVersion="${pkgver%%.*}.0.0.0"
    -p:FileVersion="$pkgver.0"
  )
}

# .NET runtime packages MediatR is built against
_runtimepackages=(
  Microsoft.Bcl.AsyncInterfaces
  Microsoft.Extensions.DependencyInjection.Abstractions
)

# Writes NuGet.Config with the feed $1 (as key=url) for everything but MediatR.Contracts, which is
# built first, and the runtime packages, which are taken from the source-built artifacts if prepare()
# found them there and $2 isn't "tests"
_nuget_config() {
  local _package
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="mediatr" value="$srcdir/nupkg" />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="${1%%=*}" value="${1#*=}" />
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="mediatr">
      <package pattern="MediatR.Contracts" />
    </packageSource>
EOF
    if [[ -f "$srcdir/runtime-packages" && "${2-}" != tests ]]; then
      echo '    <packageSource key="dotnet-source-built">'
      for _package in "${_runtimepackages[@]}"; do
        echo "      <package pattern=\"$_package\" />"
      done
      echo '    </packageSource>'
    fi
    cat <<EOF
    <packageSource key="${1%%=*}">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  } >NuGet.Config
}

prepare() {
  # The runtime packages are part of the source-built .NET of Arch Linux
  # (dotnet-source-built-artifacts), which Arch Linux ARM doesn't have. It can't be a makedepends of
  # an arch=any package, so it's used when it's installed, and they come from nuget.org otherwise.
  mkdir -p nuget-local nupkg
  local _artifacts
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "${_runtimepackages[@]/%/.*.nupkg}"
    touch runtime-packages
  done

  cd "MediatR-$_commit" || exit
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
}

build() {
  _dotnet_env
  cd "MediatR-$_commit" || exit
  # The assemblies are signed with the key in the repository, giving them the same strong names as
  # upstream's
  dotnet pack src/MediatR.Contracts/MediatR.Contracts.csproj "${_build_arguments[@]}" --output "$srcdir/nupkg"
  dotnet pack src/MediatR/MediatR.csproj "${_build_arguments[@]}" "${_mediatr_arguments[@]}" \
    --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "MediatR-$_commit" || exit
  # Lamar, which the tests use, needs the runtime packages of .NET 8 from nuget.org, so MediatR is
  # restored (NuGet doesn't notice the changed package source mapping) and built again against them
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json" tests
  dotnet build test/MediatR.Tests/MediatR.Tests.csproj "${_build_arguments[@]}" "${_mediatr_arguments[@]}" \
    --force --no-incremental
  # The test runner targets .NET 8
  DOTNET_ROLL_FORWARD=Major dotnet test test/MediatR.Tests/MediatR.Tests.csproj "${_build_arguments[@]}" \
    "${_mediatr_arguments[@]}" --no-build
}

package() {
  install -Dm644 "$srcdir/nupkg/MediatR.$pkgver.nupkg" "$srcdir/nupkg/MediatR.Contracts.$_contractsver.nupkg" \
    -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "MediatR-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
