# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-json-more-net-2
_nugetid=Json.More.Net
pkgver=2.2.0
pkgrel=1
pkgdesc="Extended functionality for System.Text.Json, 2.x (NuGet package)"
arch=('any')
url='https://github.com/json-everything/json-everything'
license=('MIT')
provides=("dotnet-json-more-net=$pkgver")
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
# 2.x is the last version line published under the MIT license alone, later releases on nuget.org come
# with the Open Source Maintenance Fee EULA (OSMFEULA.txt in the repository). It's what JsonPointer.Net
# 5.x and JsonSchema.Net 7.x (dotnet-jsonpointer-net-5, dotnet-jsonschema-net-7) need, the versions
# PowerShell uses. 2.2.0 wasn't tagged, this is the commit it was published from.
_commit="f53d4d27eeed6a73d377bf4188175f0b8a46f856"
source=("json-everything::git+$url.git#commit=$_commit")
sha512sums=('b7ec594e732d53e73beb3f957abab14ed0e2a6866bc08d682c00c8de6b3cb508cc43051fb91191fa09365e85f6b511fd75715ec72ec622268316bdf6321010b5')
b2sums=('533f4c089f938eb943c38c6bbe60e3fad78b0830c069aab2903c078e6646af41a3a204215574c919cdeaf0dfd683b9f25b9ebf52bd790f96e5d93b357d3e7c09')

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
}

build() {
  _dotnet_env
  cd json-everything || exit
  # Build first like upstream's publish workflow, the project sets GeneratePackageOnBuild, which
  # conflicts with dotnet pack building it
  dotnet build src/Json.More/Json.More.csproj --configuration Release -p:ContinuousIntegrationBuild=true
  dotnet pack src/Json.More/Json.More.csproj --configuration Release --no-build -p:IncludeSymbols=false --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd json-everything || exit
  # There's no test build for net10.0, run the one for net9.0 on the current runtime
  DOTNET_ROLL_FORWARD=Major dotnet test src/Json.More.Tests/Json.More.Tests.csproj --configuration Release \
    --framework net9.0
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 json-everything/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
