# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-jsonschema-net-7
_nugetid=JsonSchema.Net
pkgver=7.4.0
pkgrel=1
pkgdesc="JSON Schema built on System.Text.Json, 7.x (NuGet package)"
arch=('any')
url='https://github.com/json-everything/json-everything'
license=('MIT')
provides=("dotnet-jsonschema-net=$pkgver")
# Dependencies of the NuGet package
depends=(dotnet-jsonpointer-net-5)
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
# 7.x is the last version line published under the MIT license alone, later releases on nuget.org come
# with the Open Source Maintenance Fee EULA (OSMFEULA.txt in the repository). It's also what PowerShell
# uses, its Test-Json doesn't build with the API of 8.x and later. 7.4.0 wasn't tagged, this is the
# commit it was published from. JsonPointer.Net and Json.More.Net are built from this commit as well,
# like upstream does.
_commit="a3c4e63e075f595e4039d6424a77765a6761f7d0"
source=("json-everything::git+$url.git#commit=$_commit"
  # The official test suite, a submodule
  "git+https://github.com/json-schema-org/JSON-Schema-Test-Suite.git")
sha512sums=('fe263e1a8bd8c2b0ce93755ed0799082477d0dc5846ecc0bed639511b8dcafd84e763e95fdb915d8529a04ecdc69cf22b89965bc198cf1da733dff6dabaf5e1b'
            'SKIP')
b2sums=('decbc256fbb5e6c5d4acdbadeb6b333dceb0d121c69d2834bed75749b29f75b71046dd8b8d102cb66e901b2da5a8a5c955c8eec4a42ce0ecfb8e7cedc71d3c0a'
        'SKIP')

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
  git submodule init ref-repos/JSON-Schema-Test-Suite
  git config submodule.ref-repos/JSON-Schema-Test-Suite.url "$srcdir/JSON-Schema-Test-Suite"
  git -c protocol.file.allow=always submodule update ref-repos/JSON-Schema-Test-Suite

  # Source link isn't needed for this build
  find src -name '*.csproj' -exec sed -i '/Microsoft.SourceLink.GitHub/d' {} +
  _nuget_config
}

build() {
  _dotnet_env
  cd json-everything || exit
  # Like upstream's publish-schema workflow: build, then pack the files the project lists for the
  # base package. The language packs (other ResourceLanguage values) aren't built.
  dotnet build src/JsonSchema/JsonSchema.csproj --configuration Release -p:ContinuousIntegrationBuild=true
  dotnet pack src/JsonSchema/JsonSchema.csproj --configuration Release --no-build -p:ResourceLanguage=base \
    -p:IncludeSymbols=false --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd json-everything || exit
  # There's no test build for net10.0, run the one for net9.0 on the current runtime
  DOTNET_ROLL_FORWARD=Major dotnet test src/JsonSchema.Tests/JsonSchema.Tests.csproj --configuration Release \
    --framework net9.0
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 json-everything/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
