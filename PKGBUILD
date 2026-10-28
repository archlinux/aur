# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-jsonpointer-net-5
_nugetid=JsonPointer.Net
pkgver=5.3.1
pkgrel=1
pkgdesc="JSON Pointer built on System.Text.Json, 5.x (NuGet package)"
arch=('any')
url='https://github.com/json-everything/json-everything'
license=('MIT')
provides=("dotnet-jsonpointer-net=$pkgver")
# Dependencies of the NuGet package
depends=(
  dotnet-humanizer-core-2
  dotnet-json-more-net-2
)
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
# 5.x is the last version line published under the MIT license alone, later releases on nuget.org come
# with the Open Source Maintenance Fee EULA (OSMFEULA.txt in the repository). It's what JsonSchema.Net 7.x
# (dotnet-jsonschema-net-7) needs, the version PowerShell uses. 5.3.1 wasn't tagged, this is the commit
# it was published from. Json.More.Net is built from this commit as well, like upstream does.
_commit="af4b9eaf34b783cdb51e2607ae7fddedb0664b41"
source=("json-everything::git+$url.git#commit=$_commit")
sha512sums=('2efbd8bc89545fd23c6b5710880c99ab7e46fb7e3ac348bac34ffcb6a7bcea5454c6f4fdb85bdc3ea14240e880202d843935d7712693fbc9783ed6d4c8bbef40')
b2sums=('3435dc951551c84ba276c65288e96618a0321beccfb5c4a42f09e28131976a6b876e535885c9817c865eb1e090d729ddef79c192e83cdd092a994320ed64dff3')

# Restores Humanizer.Core from the system feed, everything else from nuget.org
_nuget_config() {
  cat >nuget.config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-packages" value="/usr/share/dotnet/nuget-packages" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="dotnet-packages">
      <package pattern="Humanizer.Core" />
    </packageSource>
    <packageSource key="nuget.org">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
}

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
}

prepare() {
  cd json-everything || exit
  # Source link isn't needed for this build
  find src -name '*.csproj' -exec sed -i '/Microsoft.SourceLink.GitHub/d' {} +
  _nuget_config
}

build() {
  _dotnet_env
  cd json-everything || exit
  # Build first like upstream's publish workflow, the project sets GeneratePackageOnBuild, which
  # conflicts with dotnet pack building it
  dotnet build src/JsonPointer/JsonPointer.csproj --configuration Release -p:ContinuousIntegrationBuild=true
  dotnet pack src/JsonPointer/JsonPointer.csproj --configuration Release --no-build -p:IncludeSymbols=false --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd json-everything || exit
  # There's no test build for net10.0, run the one for net9.0 on the current runtime
  DOTNET_ROLL_FORWARD=Major dotnet test src/JsonPointer.Tests/JsonPointer.Tests.csproj --configuration Release \
    --framework net9.0
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 json-everything/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
