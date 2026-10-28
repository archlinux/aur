# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-markdig
pkgver=1.5.0
pkgrel=1
pkgdesc="Fast, powerful, CommonMark compliant, extensible Markdown processor for .NET (NuGet packages)"
arch=('any')
url='https://github.com/xoofx/markdig'
license=('BSD-2-Clause')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
source=("git+$url.git#tag=$pkgver")
sha512sums=('25a1e3b7985b0bc8246bd325e8945af9ccfce63a9e7d79c2dc4d11f4f619e52848637a71b6a0b57dce2ebaebc52333af6fe1240ddbb6a38223af9100a517f63c')
b2sums=('4b065e921c8f9fc29e0a3fa64dea863fa4ba9b6d6ce6138e565a8d949a30b9fea1569c0571d1a6af53fb74cc779ddc60366342ec47bc7c4f36b181af2eb59d7d')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The version is set like upstream's MinVer setup (src/Markdig/Markdig.targets) does it
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:AssemblyVersion="${pkgver%.*}.0.0"
    -p:FileVersion="$pkgver.0"
    -p:ContinuousIntegrationBuild=true
  )
}

prepare() {
  cd markdig || exit
  # Pins an SDK we don't have
  rm src/global.json
  # MinVer is a prebuilt tool that derives the version from git, it's passed in build() instead.
  # The .NET Framework build would need prebuilt reference assemblies.
  sed -i -e '/<PackageReference Include="MinVer">/,/<\/PackageReference>/d' \
    -e '/<Target Name="PatchVersion"/,/<\/Target>/d' \
    -e 's|<TargetFrameworks>net462;|<TargetFrameworks>|' \
    src/Markdig/Markdig.targets
}

build() {
  _dotnet_env
  cd markdig || exit
  # Markdig.Signed is the same library, strong named with the key in its folder
  local _project
  for _project in Markdig Markdig.Signed; do
    dotnet pack "src/$_project/$_project.csproj" "${_build_arguments[@]}" \
      -p:IncludeSymbols=false --output "$srcdir/nupkg"
  done
}

check() {
  _dotnet_env
  cd markdig || exit
  dotnet test src/Markdig.Tests/Markdig.Tests.csproj "${_build_arguments[@]}" --framework "net$_dotnetsdkver"
}

package() {
  install -Dm644 "$srcdir"/nupkg/{Markdig,Markdig.Signed}."$pkgver".nupkg \
    -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 markdig/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
