# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-system-clientmodel
_nugetid=System.ClientModel
pkgver=1.16.0
pkgrel=1
pkgdesc="Building blocks for .NET clients that call cloud services, System.ClientModel (NuGet package)"
arch=('any')
url='https://github.com/Azure/azure-sdk-for-net'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  jq
)
# The commit the package was published from (tag System.ClientModel_1.16.0), and the official build
# of it, see the file version 1.1600.26.46705 of its assemblies (encoding the date and build number)
_commit="dcd5b3aadd7fe3ebc73a22408cb514bd18ec3e6f"
_officialbuildid="20260917.5"
source=("azure-sdk-for-net-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('fe251bbbd7ad8e7cf41388d0e86df322fe9bd97db021e1ee125fa53cf0a7cc062c80ab9dd91d0a376321d678d8959d76743a5d024feec178de64cb7dae51290d')
b2sums=('3be2e64c9e9f7c110447a2eda26a2140fd24536255185fc145212897a544ddbfad83479a6c4c33205346ea3d12a1afd1d130a1f98ca5d38ca9db16cd25d7ab7c')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The checks of the API listing, the analyzers and API compatibility with the previous release
  # (from nuget.org) don't change the build. Source Link needs git, so the repository information is
  # passed in. The runtime packages from the source-built artifacts are newer than the versions
  # referenced (NU1603).
  _build_arguments=(
    --configuration Release
    -p:GenerateAPIListing=false
    -p:EnableClientSdkAnalyzers=false
    -p:EnableMicrosoftCodeAnalysisNetAnalyzers=false
    -p:EnableBannedApiAnalyzers=false
    -p:EnableStyleCopAnalyzers=false
    -p:RunApiCompat=false
    -p:ValidateRunApiCompat=false
    -p:ApiCompatVersion=
    -p:EnableSourceLink=false
    -p:SourceRevisionId="$_commit"
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:SkipDevBuildNumber=true
    -p:WarningsNotAsErrors=NU1603
  )
}

# .NET runtime packages System.ClientModel is built against
_runtimepackages=(
  Microsoft.Bcl.AsyncInterfaces
  Microsoft.Extensions.Configuration.Abstractions
  Microsoft.Extensions.DependencyInjection.Abstractions
  Microsoft.Extensions.Diagnostics.Abstractions
  Microsoft.Extensions.FileProviders.Abstractions
  Microsoft.Extensions.Hosting.Abstractions
  Microsoft.Extensions.Logging.Abstractions
  Microsoft.Extensions.Options
  Microsoft.Extensions.Primitives
  System.Diagnostics.DiagnosticSource
  System.IO.Pipelines
  System.Memory.Data
  System.Net.ServerSentEvents
  System.Text.Encodings.Web
  System.Text.Json
)

# Writes NuGet.config with the feed $1 (as key=url) for everything but the runtime packages, which
# are taken from the source-built artifacts if prepare() found them there
_nuget_config() {
  local _package
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="${1%%=*}" value="${1#*=}" />
  </packageSources>
  <packageSourceMapping>
    <clear />
EOF
    if [[ -f "$srcdir/runtime-packages" ]]; then
      echo '    <packageSource key="dotnet-source-built">'
      for _package in "${_runtimepackages[@]}"; do
        echo "      <package pattern=\"$_package\" />"
      done
      echo '    </packageSource>'
    fi
    cat <<EOF
    <packageSource key="${1%%=*}">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  } >NuGet.Config
}

prepare() {
  # The runtime packages are part of the source-built .NET of Arch Linux
  # (dotnet-source-built-artifacts), which Arch Linux ARM doesn't have. It can't be a makedepends of
  # an arch=any package, so it's used when it's installed, and they come from nuget.org otherwise.
  mkdir -p nuget-local
  local _artifacts
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "${_runtimepackages[@]/%/.*.nupkg}"
    touch runtime-packages
  done

  # Upstream builds with a newer feature band of the .NET SDK, which isn't needed. dotnet only works
  # outside the repository until its global.json is updated.
  local _sdkver
  _sdkver=$(dotnet --version)

  cd "azure-sdk-for-net-$_commit" || exit
  # Upstream's NuGet.Config, which has the feed the tests need
  mv NuGet.Config NuGet.Config.upstream
  jq --arg sdk "$_sdkver" '.sdk.version = $sdk | .sdk.rollForward = "latestPatch"' global.json >global.json.new
  mv global.json.new global.json
  # Release builds have to check the API listing, which is turned off above
  sed -i '/<Target Name="_CheckGenerateAPIListingValue"/,/<\/Target>/d' eng/ApiListing.targets
}

build() {
  _dotnet_env
  cd "azure-sdk-for-net-$_commit" || exit
  # Version as in the official build. On Linux, it builds for all frameworks but the .NET Framework.
  # The assemblies are public signed with Microsoft's key, giving them the same strong names as
  # upstream's.
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
  dotnet pack "sdk/core/$_nugetid/src/$_nugetid.csproj" "${_build_arguments[@]}" \
    -p:OfficialBuildId="$_officialbuildid" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "azure-sdk-for-net-$_commit" || exit
  # The tests need packages from the feed upstream uses, which mirrors nuget.org
  local _feed
  _feed=$(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' NuGet.Config.upstream)
  _nuget_config "$_feed"
  # Only on the .NET runtime that's installed, the tests target older ones, too
  dotnet test "sdk/core/$_nugetid/tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}" --framework net10.0
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "azure-sdk-for-net-$_commit/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
