# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-humanizer-core-2
_nugetid=Humanizer.Core
pkgver=2.14.1
pkgrel=1
pkgdesc="Turns strings, type names, enum fields and dates into a human friendly format, 2.x (NuGet package)"
arch=('any')
url='https://github.com/Humanizr/Humanizer'
license=('MIT')
provides=("dotnet-humanizer-core=$pkgver")
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
# 2.x is what JsonPointer.Net 5.x (dotnet-jsonpointer-net-5) needs
_commit="3ebc38de585fc641a04b0e78ed69468453b0f8a1"
source=("git+$url.git#commit=$_commit")
sha512sums=('1862b1d133f47bc4fdc28d00783d388853468e733c06aa2cf5c5a7dd2c4e4cbb5d8421901dc33037b2c8bcdcd4b87f1359dd9999a041a5b4f5594219cd66e640')
b2sums=('5f1d710303399d3d1196f8ad30df6fdc89b1c111305e82663e22dab4a2cd54227aad0da722777ffd1681981038f8c1eba6a1a4dbd1c2de1998deeb1e6556306f')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The versions Nerdbank.GitVersioning derives from version.json
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:AssemblyVersion="${pkgver%.*}.0.0"
    -p:FileVersion="$pkgver.0"
    -p:ContinuousIntegrationBuild=true
  )
}

prepare() {
  cd Humanizer || exit
  # Nerdbank.GitVersioning is a prebuilt tool that derives the version from git, it's passed in build()
  # instead. Source link isn't needed either.
  sed -i -e '/Nerdbank.GitVersioning/d' -e '/Microsoft.SourceLink.GitHub/d' src/Directory.build.props
  # The netstandard1.0 build would need its prebuilt reference assemblies
  sed -i 's|<TargetFrameworks>netstandard1.0;|<TargetFrameworks>|' src/Humanizer/Humanizer.csproj
  sed -i -e '/<group targetFramework="netstandard1.0">/,/<\/group>/d' -e '/bin\\Release\\netstandard1.0/d' \
    NuSpecs/Humanizer.Core.nuspec
}

build() {
  _dotnet_env
  cd Humanizer || exit
  # Humanizer.Core is packed from its nuspec like upstream's CI does, it only has the neutral (English)
  # resources. The other languages are in packages of their own.
  dotnet pack src/Humanizer/Humanizer.csproj "${_build_arguments[@]}" \
    -p:NuspecFile="$PWD/NuSpecs/$_nugetid.nuspec" -p:NuspecBasePath="$PWD/src" \
    "-p:NuspecProperties=\"version=$pkgver;RepositoryType=git;RepositoryCommit=$_commit;RepositoryUrl=$url\"" \
    --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd Humanizer || exit
  # Approve_Public_Api crashes in ApiApprover on current .NET, and the French byte sizes expect Windows'
  # culture data, ICU uses a narrow no-break space as group separator
  local _filter=(
    'FullyQualifiedName!=Humanizer.Tests.ApiApprover.PublicApiApprovalTest.Approve_Public_Api'
    'FullyQualifiedName!=Humanizer.Tests.Localisation.fr.Bytes.ByteSizeExtensionsTests.HumanizesBytes'
  )
  # There's no test build for net10.0, run the one for net6.0 on the current runtime.
  # Tests change global configuration (EnumHumanizeWithCustomDescriptionPropertyNamesTests), which
  # makes others fail randomly when run in parallel.
  DOTNET_ROLL_FORWARD=Major dotnet test src/Humanizer.Tests/Humanizer.Tests.csproj "${_build_arguments[@]}" \
    --framework net6.0 --filter "$(
      IFS='&'
      echo "${_filter[*]}"
    )" -- xUnit.ParallelizeTestCollections=false
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 Humanizer/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
