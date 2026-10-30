# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-vs-validation
_nugetid=Microsoft.VisualStudio.Validation
pkgver=17.13.22
pkgrel=1
pkgdesc="Common input validation and state verification utility methods, Microsoft.VisualStudio.Validation (NuGet package)"
arch=('any')
url='https://github.com/microsoft/vs-validation'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  jq
  python
)
# The commit the package was published from (tag v17.13.22)
_commit="fd7027e236db97b472614237b1453022e24ef146"
# Microsoft's internal build signs the assemblies, so they're public signed with the public key from
# Arcade, giving them the same strong name as upstream's
_arcadecommit="94f797268292122de4b6344d6265fad658c53703"
source=("vs-validation-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "MSFT.snk::https://raw.githubusercontent.com/dotnet/arcade/$_arcadecommit/src/Microsoft.DotNet.Arcade.Sdk/tools/snk/MSFT.snk"
  "lcl-to-resx.py")
sha512sums=('c3927f30bfa58d8ff777cc3b4fab257cf42c71782ed6fb0e3de850b643d5591a9def41ba7800da90af8b382f3a9ce94cf10ffd3f4b9c775c9ef5a2ce305f42e9'
  '98c02c09b9fed2ad77d8403efa5788053abb66a9c6c2cb8dd5d15ce49daf25e3a128b9b281fa2bc79e7cfc33adfbbfff6901b63fc9b882a890c13737892e71e1'
  'ca10f8c7baf1539c0caed487474b5d2d9f44e6b148aff5cbb4188a9ec1499c6eb114e47d3a2b290fd284114536743029d434118f8cfc3b3141cff0bde2325fea')
b2sums=('3b5a3a05e017349eccf30484d1422c84a260f3e4ff7a6308dea96c86f6a911dd6bef78027aaceb96650744fab692b58ad9911d6ed376c565ab61b9d7c60097ae'
  'df52cdab9f311499106f30869455797a02345bf43fd01e942fbb0312228660c88122fba00188484cb03616dfa4b234a83e73f132377c94169f2a26da175ff2ee'
  '7fc316c06dd01bf38ff9142892147201f59fc70226775e8b04479d64c2a96dca91a5bbc56d29a147867abb5f70c8adbed3a2710489b5a8f609a447e52f2adee8')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Versions as in the official build, which Nerdbank.GitVersioning computes from git. The file
  # version ends in the first two bytes of the commit. The repository information usually comes from
  # git, which would find the repository this PKGBUILD is in instead.
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:AssemblyVersion="${pkgver%.*}.0.0"
    -p:FileVersion="$pkgver.$((16#${_commit:0:4}))"
    -p:InformationalVersion="$pkgver+${_commit:0:10}"
    -p:IncludeSourceRevisionInInformationalVersion=false
    -p:EnableSourceControlManagerQueries=false
    -p:RepositoryType=git
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:SignAssembly=true
    -p:PublicSign=true
    -p:AssemblyOriginatorKeyFile="$srcdir/MSFT.snk"
  )
}

prepare() {
  cd "vs-validation-$_commit" || exit
  # Upstream pins the .NET 9 SDK, the libraries build with newer ones just as well
  jq 'del(.sdk)' global.json >global.json.new
  mv global.json.new global.json
  # Nerdbank.GitVersioning needs git (see _dotnet_env for the versions), and MicroBuild is Microsoft's
  # internal signing and localization
  sed -i -E '/GlobalPackageReference Include="(Nerdbank.GitVersioning|Microsoft.VisualStudio.Internal.MicroBuild.VisualStudio)"/d' \
    Directory.Packages.props
  sed -i 's/ DependsOnTargets="GetBuildVersion"//' Directory.Build.props
  # The translations, which MicroBuild applies to the assemblies
  python -I "$srcdir/lcl-to-resx.py" loc/lcl "$_nugetid" "src/$_nugetid"

  # Upstream's NuGet.config, which has the feed the tests need
  mv nuget.config nuget.config.upstream
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
}

# Writes nuget.config with the feed $1 (as key=url)
_nuget_config() {
  cat >nuget.config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="${1%%=*}" value="${1#*=}" />
  </packageSources>
</configuration>
EOF
}

build() {
  _dotnet_env
  cd "vs-validation-$_commit" || exit
  dotnet pack "src/$_nugetid/$_nugetid.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "vs-validation-$_commit" || exit
  # The tests need packages from the feed upstream uses, which mirrors nuget.org
  _nuget_config "$(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' nuget.config.upstream)"
  # The test runner targets .NET 8
  DOTNET_ROLL_FORWARD=Major dotnet test "test/$_nugetid.Tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "vs-validation-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
