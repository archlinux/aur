# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-system-reactive
_nugetid=System.Reactive
pkgver=7.0.0
pkgrel=1
pkgdesc="Reactive Extensions (Rx) for .NET, System.Reactive (NuGet package)"
arch=('any')
url='https://github.com/dotnet/reactive'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  perl
)
# The commit the package was published from (tag rxnet-v7.0.0)
_commit="cf59bed2247fdd8f8c3c6fe05c328934518c0c96"
source=("reactive-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('29b580b595c63a0c5ba54cc54d89651b99328d199fb3488b0c865e8a98689176229ca1d1af38eb74e0ecb0d27a40fd5d3045314ed716005b27cd06d8b9bbfd22')
b2sums=('5da8b0350cbf0f26a95ca300b7d6011bf1e9c1a966f9e88bf5b1a0b210546478fbfb85b295e8abb887c4dd8a94cc6c1a979e82f99cbcb8254612159d5b1832b7')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Versions as in the official build, which Nerdbank.GitVersioning computes from git. The file
  # version ends in the first two bytes of the commit. The SDK would add the commit of the repository
  # this PKGBUILD is in to the informational version. Package validation would need the previous
  # release from nuget.org.
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:FileVersion="$pkgver.$((16#${_commit:0:4}))"
    -p:InformationalVersion="$pkgver+${_commit:0:10}"
    -p:IncludeSourceRevisionInInformationalVersion=false
    -p:EnableSourceControlManagerQueries=false
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:EnablePackageValidation=false
    -p:IncludeSymbols=false
  )
}

prepare() {
  cd "reactive-$_commit/Rx.NET/Source" || exit
  # Upstream builds on Windows, where MSBuild also finds Directory.build.props and .targets
  local _file
  for _file in Directory.build.{props,targets} {src,tests}/Directory.build.{props,targets}; do
    mv "$_file" "${_file/Directory.build/Directory.Build}"
  done
  sed -i 's/Directory\.build\./Directory.Build./g' {src,tests}/Directory.Build.{props,targets}
  # Nerdbank.GitVersioning and Source Link need git, see _dotnet_env for the versions
  perl -0pi -e 's/\s*<PackageReference\s+Include="(Microsoft\.SourceLink\.GitHub|Nerdbank\.GitVersioning)".*?\/>//gs' \
    Directory.Build.props

  # The .NET Framework, UWP and Windows builds need Windows SDKs, so leave them out of the projects
  # and of upstream's hand-written nuspec
  sed -i 's|<TargetFrameworks>netstandard2.0;net472;uap10.0.18362;net8.0;net8.0-windows10.0.19041</TargetFrameworks>|<TargetFrameworks>netstandard2.0;net8.0</TargetFrameworks>|' \
    src/System.Reactive/System.Reactive.csproj \
    src/System.Reactive.MakeRefAssemblies/System.Reactive.MakeRefAssemblies.csproj
  sed -i -E \
    -e '/<group targetFramework="(net472|net8\.0-windows10\.0\.19041|uap10\.0\.18362|\.NETFramework4\.7\.2|UAP10\.0\.18362)">/,/<\/group>/d' \
    -e '/<group targetFramework="(net8\.0-windows10\.0\.19041|\.NETFramework4\.7\.2|UAP10\.0\.18362)" \/>/d' \
    -e '/<frameworkAssemblies>/,/<\/frameworkAssemblies>/d' \
    -e '/(net472|uap10\.0\.18362|net8\.0-windows10\.0\.19041)\\System\.Reactive\.dll|\.pdb"/d' \
    src/System.Reactive/System.Reactive.nuspec
  # Only test on the .NET runtime that's installed
  sed -i -E 's|<TargetFrameworks>[^<]*</TargetFrameworks>|<TargetFrameworks>net10.0</TargetFrameworks>|' \
    tests/Tests.System.Reactive/Tests.System.Reactive.csproj
}

build() {
  _dotnet_env
  cd "reactive-$_commit/Rx.NET/Source" || exit
  # The nuspec takes the analyzer from its build output. The assemblies are signed with the key in
  # the repository, giving them the same strong names as upstream's.
  dotnet build src/System.Reactive.Analyzers/System.Reactive.Analyzers.csproj "${_build_arguments[@]}"
  dotnet pack "src/$_nugetid/$_nugetid.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "reactive-$_commit/Rx.NET/Source" || exit
  dotnet test tests/Tests.System.Reactive/Tests.System.Reactive.csproj "${_build_arguments[@]}"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "reactive-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
