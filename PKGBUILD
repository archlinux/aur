# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-newtonsoft-json
_nugetid=Newtonsoft.Json
pkgver=13.0.4
pkgrel=1
pkgdesc="Popular high-performance JSON framework for .NET (NuGet package)"
arch=('any')
url='https://www.newtonsoft.com/json'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
# The release key isn't public, so the assemblies are public signed with the public key from .NET's
# source-build, giving them the same strong name as upstream's (see prereqs/keys/README.md there)
_vmrcommit="4099f83977f4d29604a9aeb971fb0a7bc1d5f699"
source=("git+https://github.com/JamesNK/Newtonsoft.Json.git#tag=$pkgver"
  "$_nugetid.snk::https://raw.githubusercontent.com/dotnet/dotnet/$_vmrcommit/prereqs/keys/$_nugetid.snk")
sha512sums=('6773243e2746c67f4e22d64bdc59d07a168e2796a641e9d97b8040be40d79c05e9b20c207eda37f88bbb7f0b1d1439857e7b2383d902afa74cf1891d432a4c84'
            '8f0c4e63db6fd02a07d1db79a33813f6790380273f9db5a6a3193054bca742d873a138bfc8e4ec1f5486ce143dd4aa5e2534d4ba3caa5cb1dfbca4be38450ef4')
b2sums=('c1807d526f5cad588137b145d83cf803e92b44d4fe46be0dee00d2b66d1ad4a027c7674caa1e49a47eb915f4c0b51814381df385b0f234e1cfa9ed25e8397b14'
        'a80f1e89f7e3728a308f74f080794fa5df388c818b8901aca0ccde825c21528fc19f04c20666315b5c26bf104dc64b75402dfc1b8487aaaf23705a3dfe221cbf')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Like upstream's Build/build.ps1 and .NET's source-build (src/source-build-assets), but only for
  # the frameworks .NET uses. The .NET Framework and netstandard1.x builds would need their prebuilt
  # reference assemblies, and the trim analyzers an old prebuilt ILLink.
  _build_arguments=(
    --configuration Release
    "-p:LibraryFrameworks=\"net6.0;netstandard2.0\""
    -p:VersionPrefix="$pkgver"
    -p:VersionSuffix=
    -p:AssemblyVersion="${pkgver%%.*}.0.0.0"
    -p:FileVersion="$pkgver.0"
    -p:SignAssembly=true
    -p:PublicSign=true
    -p:AssemblyOriginatorKeyFile="$srcdir/$_nugetid.snk"
    -p:AdditionalConstants=SIGNED
    -p:TreatWarningsAsErrors=false
    -p:ContinuousIntegrationBuild=true
    -p:EnableTrimAnalyzer=false
    -p:EnableAotAnalyzer=false
    -p:EnableSingleFileAnalyzer=false
  )
}

prepare() {
  cd Newtonsoft.Json || exit
  # Pins an SDK we don't have
  rm Src/global.json
  # Neither analyzers nor source link are needed for this build, and package validation would
  # compare against the prebuilt package from nuget.org
  sed -i -e '/Microsoft.CodeAnalysis.NetAnalyzers\|Microsoft.SourceLink.GitHub/d' \
    -e '/<CodeAnalysisRuleset>/d' \
    -e 's|<EnablePackageValidation>true|<EnablePackageValidation>false|' \
    Src/Newtonsoft.Json/Newtonsoft.Json.csproj
}

build() {
  _dotnet_env
  cd Newtonsoft.Json || exit
  dotnet pack Src/Newtonsoft.Json/Newtonsoft.Json.csproj "${_build_arguments[@]}" \
    -p:IncludeSymbols=false --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd Newtonsoft.Json || exit
  # The tests assume Windows, i.e. CRLF line endings (TraceWriter and BufferErroringWithInvalidSize),
  # c:\ being an absolute path (Issue1619) and Windows' culture data (NewZealandCulture)
  local _test _filter=()
  for _test in Documentation.TraceWriterTests.MemoryTraceWriterTest \
    Serialization.TraceWriterTests.MemoryTraceWriterDeserializeTest \
    Serialization.TraceWriterTests.MemoryTraceWriterSerializeTest \
    JsonTextWriterTest.BufferErroringWithInvalidSize \
    Issues.Issue1619.Test \
    Converters.IsoDateTimeConverterTests.SerializeFormattedDateTimeNewZealandCulture; do
    _filter+=("FullyQualifiedName!=Newtonsoft.Json.Tests.$_test")
  done
  # There's no test build for net10.0, run the one for net8.0 on the current runtime
  DOTNET_ROLL_FORWARD=Major dotnet test Src/Newtonsoft.Json.Tests/Newtonsoft.Json.Tests.csproj \
    "${_build_arguments[@]}" -p:LibraryFrameworks=net6.0 -p:TestFrameworks=net8.0 \
    --filter "$(IFS='&'; echo "${_filter[*]}")"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 Newtonsoft.Json/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
