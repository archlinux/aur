# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-system-data-sqlclient
_nugetid=System.Data.SqlClient
pkgver=4.9.1
pkgrel=2
pkgdesc="The legacy SQL Server data provider for .NET, System.Data.SqlClient (NuGet package)"
arch=('any')
url='https://github.com/dotnet/maintenance-packages'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  jq
)
# The commit the package was published from, and the official build of it, see the file version
# 4.900.126.11103 of its assemblies (Arcade encodes the date and build number in it)
_commit="84b081710c66cc560b77d4de38cee493c3a38e9d"
_officialbuildid="20260211.3"
source=("maintenance-packages-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('1aaf6686b04a0ef15dc6228bfa0d8026065bc6a2bffcaac0d26754b6e27b029c1d895d84891e896545c9d6460e71f0b760cbd609f4fb54bc66b350cb2a98eb30')
b2sums=('4aed705ecd4cad427cd7d1fd7ff1bbebcfa14cdf34d9a4ec1c9b90a1b92ed042dd244216b1599c45d92db9cee7753c7bfc73d784505dbc6e8340c42a49a4e580')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # Arcade looks for a .NET installed into the repository otherwise, e.g. for the test host
  DOTNET_INSTALL_DIR="$(dirname "$(readlink -f /usr/bin/dotnet)")"
  export DOTNET_INSTALL_DIR

  # Package validation would need the previous release from nuget.org. The repository information
  # usually comes from git, which would find the repository this PKGBUILD is in instead.
  _build_arguments=(
    --configuration Release
    -p:EnablePackageValidation=false
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
  )
  # The source-built Arcade is a newer version than upstream's (8.x), keep its frameworks and use its
  # build tasks
  if [[ -f "$srcdir/arcade-version" ]]; then
    _build_arguments+=(
      -p:NetCurrent=net8.0
      -p:NetMinimum=net6.0
      -p:MicrosoftDotNetBuildTasksTargetFrameworkVersion="$(<"$srcdir/arcade-version")"
    )
  fi
}

# Arcade's packages, the build SDK of the repository
_arcadepackages=(
  Microsoft.DotNet.Arcade.Sdk
  Microsoft.DotNet.Build.Tasks.TargetFramework
  Microsoft.DotNet.XliffTasks
)

# Writes NuGet.config with the given feeds ($@, as key=url) for everything but Arcade, which is taken
# from the source-built artifacts if prepare() found it there, otherwise from Microsoft's dotnet-eng
# feed like upstream does
_nuget_config() {
  local _arcade=("${_arcadepackages[@]}") _local=() _feed
  local _dotneteng=("dotnet-eng=https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-eng/nuget/v3/index.json")
  # dotnet-eng is among the given feeds for everything, or only used for Arcade
  if [[ " $* " == *" dotnet-eng="* ]]; then
    _dotneteng=()
    _arcade=()
  fi
  if [[ -f "$srcdir/arcade-version" ]]; then
    _local=("${_arcadepackages[@]}")
    _arcade=()
  fi
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
EOF
    for _feed in "${_dotneteng[@]}" "$@"; do
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

prepare() {
  # Arcade is part of the source-built .NET of Arch Linux (dotnet-source-built-artifacts), which
  # Arch Linux ARM doesn't have. It can't be a makedepends of an arch=any package, so it's used when
  # it's installed, and comes from upstream's feeds otherwise.
  mkdir -p nuget-local
  local _artifacts _nupkg _version
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "${_arcadepackages[@]/%/.*.nupkg}"
  done
  for _nupkg in nuget-local/Microsoft.DotNet.Arcade.Sdk.*.nupkg; do
    [[ -f "$_nupkg" ]] || continue
    _version="${_nupkg##*/Microsoft.DotNet.Arcade.Sdk.}"
    echo "${_version%.nupkg}" >arcade-version
  done

  # Upstream builds with the .NET 8 SDK. dotnet only works outside the repository until its
  # global.json is updated.
  local _sdkver _arcadever
  _sdkver=$(dotnet --version)

  cd "maintenance-packages-$_commit" || exit
  # Upstream's NuGet.config, which has the feeds the tests need
  mv NuGet.config NuGet.config.upstream
  _arcadever=$(jq -r '."msbuild-sdks"."Microsoft.DotNet.Arcade.Sdk"' global.json)
  [[ -f "$srcdir/arcade-version" ]] && _arcadever=$(<"$srcdir/arcade-version")
  jq --arg sdk "$_sdkver" --arg arcade "$_arcadever" \
    '.sdk.version = $sdk | .tools.dotnet = $sdk | ."msbuild-sdks"."Microsoft.DotNet.Arcade.Sdk" = $arcade' \
    global.json >global.json.new
  mv global.json.new global.json
  # ApiCompat is only needed for package validation
  sed -i '/<GlobalPackageReference Include="Microsoft.DotNet.ApiCompat.Task"/d' Directory.Packages.props
}

build() {
  _dotnet_env
  cd "maintenance-packages-$_commit" || exit
  # Versions as in the official build. The assemblies are public signed with Microsoft's key, giving
  # them the same strong name as upstream's.
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
  dotnet pack "src/$_nugetid/src/$_nugetid.csproj" "${_build_arguments[@]}" \
    -p:OfficialBuildId="$_officialbuildid" -p:DotNetFinalVersionKind=release --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "maintenance-packages-$_commit" || exit
  # The tests need packages from the feeds upstream uses
  local _feeds=()
  mapfile -t _feeds < <(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' NuGet.config.upstream)
  _nuget_config "${_feeds[@]}" "nuget.org=https://api.nuget.org/v3/index.json"
  # The ExecuteXmlReader tests need a SQL Server (TEST_TCP_CONN_STR), but aren't skipped without one
  local _test _filter=()
  for _test in ExecuteXmlReaderTest ExecuteXmlReaderAsyncTest; do
    _filter+=("FullyQualifiedName!=System.Data.SqlClient.Tests.DiagnosticTest.$_test")
  done
  # Only the build for Unix and the newest .NET, the test runner doesn't support .NET 6 anymore. The
  # newer analyzers of the .NET 10 SDK warn about the test tools, which is an error upstream.
  DOTNET_ROLL_FORWARD=Major dotnet test "src/$_nugetid/tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}" \
    -p:TargetFrameworks=net8.0-unix -p:TreatWarningsAsErrors=false --filter "$(IFS='&'; echo "${_filter[*]}")"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "maintenance-packages-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
