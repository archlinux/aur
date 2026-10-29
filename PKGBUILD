# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-wcf
pkgver=10.1.0
pkgrel=2
pkgdesc="WCF client libraries for .NET, System.ServiceModel.* and System.Web.Services.Description (NuGet packages)"
arch=('any')
url='https://github.com/dotnet/wcf'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  jq
)
# The commit the packages were published from, and the official build of them, see the file version
# 10.100.26.51601 of their assemblies (Arcade encodes the date and build number in it)
_commit="12702d51d9758687726bc4056729aeb58fbbf717"
_officialbuildid="20261016.1"
_packages=(
  System.ServiceModel.Primitives
  System.ServiceModel.NetFramingBase
  System.ServiceModel.Http
  System.ServiceModel.NetTcp
  System.Web.Services.Description
)
source=("wcf-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('6d9f45dc7ae2495c34256ca91528761e55ae30a671c801608041ce007365a4772b71002739929c7f181a8ed7209a2fab16ac4d8bf35f8f8d7212697434f5aaec')
b2sums=('d9f8df046cdc539b77b82ef8c16293ca4eaa50fcc949411c38895eed8e909e7bf525bd0e69eb2bd6150b6c8d4317528414a1d49e645666049d58f26356146385')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # Arcade looks for a .NET installed into the repository otherwise, e.g. for the test host
  DOTNET_INSTALL_DIR="$(dirname "$(readlink -f /usr/bin/dotnet)")"
  export DOTNET_INSTALL_DIR

  # The .NET Framework builds would need prebuilt reference assemblies, and package validation the
  # previous release from nuget.org. The repository information usually comes from
  # git, which would find the repository this PKGBUILD is in instead.
  _build_arguments=(
    --configuration Release
    -p:NetFrameworkVersion=
    -p:EnablePackageValidation=false
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
  )
  if [[ -f "$srcdir/syndication-version" ]]; then
    _build_arguments+=(-p:SystemServiceModelSyndicationPackageVersion="$(<"$srcdir/syndication-version")")
  fi
}

# Writes NuGet.config with the given feeds ($@, as key=url) for everything but Arcade, the build SDK
# of the repository, and the .NET runtime packages. They're taken from the source-built artifacts if
# prepare() found them there, otherwise from Microsoft's dotnet-eng feed and nuget.org like upstream.
_nuget_config() {
  local _arcade=(Microsoft.DotNet.Arcade.Sdk Microsoft.DotNet.XliffTasks) _local=() _feed
  local _dotneteng="dotnet-eng=https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-eng/nuget/v3/index.json"
  # dotnet-eng is among the given feeds for everything, or only used for Arcade
  if [[ " $* " == *" dotnet-eng="* ]]; then
    _dotneteng=
    _arcade=()
  fi
  if [[ -f "$srcdir/arcade-version" ]]; then
    _local+=("${_arcade[@]}")
    _arcade=()
  fi
  [[ -f "$srcdir/syndication-version" ]] && _local+=("${_runtimepackages[@]}")
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
EOF
    for _feed in $_dotneteng "$@"; do
      echo "    <add key=\"${_feed%%=*}\" value=\"${_feed#*=}\" />"
    done
    echo '  </packageSources>'
    echo '  <packageSourceMapping>'
    echo '    <clear />'
    _nuget_mapping dotnet-source-built "${_local[@]}"
    _nuget_mapping dotnet-eng "${_arcade[@]}"
    for _feed in "$@"; do
      _nuget_mapping "${_feed%%=*}" '*'
    done
    echo '  </packageSourceMapping>'
    echo '</configuration>'
  } >NuGet.config
}

# Prints the package source mapping of the feed $1 for the package patterns $2..., if there are any
_nuget_mapping() {
  (($# > 1)) || return 0
  echo "    <packageSource key=\"$1\">"
  shift
  printf '      <package pattern="%s" />\n' "$@"
  echo '    </packageSource>'
}

# .NET runtime packages the WCF packages are built against
_runtimepackages=(
  Microsoft.Extensions.ObjectPool
  System.Security.Cryptography.Pkcs
  System.Security.Cryptography.Xml
  System.ServiceModel.Syndication
)

prepare() {
  # Arcade and the runtime packages are part of the source-built .NET of Arch Linux
  # (dotnet-source-built-artifacts), which Arch Linux ARM doesn't have. It can't be a makedepends of an
  # arch=any package, so it's used when it's installed, and they come from upstream's feeds otherwise.
  mkdir -p nuget-local
  local _artifacts _nupkg _package
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local 'Microsoft.DotNet.Arcade.Sdk.*.nupkg' 'Microsoft.DotNet.XliffTasks.*.nupkg' \
      "${_runtimepackages[@]/%/.*.nupkg}"
  done
  for _nupkg in nuget-local/Microsoft.DotNet.Arcade.Sdk.*.nupkg; do
    [[ -f "$_nupkg" ]] || continue
    _package="${_nupkg##*/Microsoft.DotNet.Arcade.Sdk.}"
    echo "${_package%.nupkg}" >arcade-version
  done
  for _nupkg in nuget-local/System.ServiceModel.Syndication.*.nupkg; do
    [[ -f "$_nupkg" ]] || continue
    _package="${_nupkg##*/System.ServiceModel.Syndication.}"
    echo "${_package%.nupkg}" >syndication-version
  done

  # Upstream builds with a preview of the next .NET SDK, the libraries target .NET 10 though.
  # dotnet only works outside the repository until its global.json is updated.
  local _sdkver _arcadever
  _sdkver=$(dotnet --version)

  cd "wcf-$_commit" || exit
  # Upstream's NuGet.config, which has the feeds the tests need
  mv NuGet.config NuGet.config.upstream
  _arcadever=$(jq -r '."msbuild-sdks"."Microsoft.DotNet.Arcade.Sdk"' global.json)
  [[ -f "$srcdir/arcade-version" ]] && _arcadever=$(<"$srcdir/arcade-version")
  jq --arg sdk "$_sdkver" --arg arcade "$_arcadever" \
    '.sdk.version = $sdk | .tools.dotnet = $sdk | ."msbuild-sdks"."Microsoft.DotNet.Arcade.Sdk" = $arcade' \
    global.json >global.json.new
  mv global.json.new global.json
  # GenAPI regenerates the reference sources (ref/*.cs), which are part of the repository already
  sed -i '/<PackageReference Include="Microsoft.DotNet.GenAPI"/,/\/>/d' eng/GenRefAssembly.targets
}

build() {
  _dotnet_env
  cd "wcf-$_commit" || exit
  # Versions as in the official build, see eng/Versions.props. The assemblies are public signed with
  # Microsoft's keys, giving them the same strong names as upstream's.
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
  local _package
  for _package in "${_packages[@]}"; do
    dotnet pack "src/$_package/src/$_package.csproj" "${_build_arguments[@]}" \
      -p:OfficialBuildId="$_officialbuildid" -p:DotNetFinalVersionKind=release --output "$srcdir/nupkg"
  done
}

check() {
  _dotnet_env
  cd "wcf-$_commit" || exit
  # The tests need packages from the feeds upstream uses
  local _feeds=()
  mapfile -t _feeds < <(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' NuGet.config.upstream)
  _nuget_config "${_feeds[@]}" "nuget.org=https://api.nuget.org/v3/index.json"
  # The unit tests. The scenario tests need WCF's test service running, which upstream starts with
  # Windows scripts.
  local _package
  for _package in System.ServiceModel.Primitives System.ServiceModel.Http System.ServiceModel.NetTcp; do
    dotnet test "src/$_package/tests/$_package.Tests.csproj" "${_build_arguments[@]}"
  done
}

package() {
  local _package
  for _package in "${_packages[@]}"; do
    install -Dm644 "$srcdir/nupkg/$_package.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  done
  install -Dm644 "wcf-$_commit/LICENSE.TXT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
