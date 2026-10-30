# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-azure-core
_nugetid=Azure.Core
pkgver=1.64.0
pkgrel=1
pkgdesc="Shared primitives, abstractions and helpers for .NET Azure SDK client libraries, Azure.Core (NuGet package)"
arch=('any')
url='https://github.com/Azure/azure-sdk-for-net'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-microsoft-identity-client
  dotnet-sdk-"$_dotnetsdkver"
  dotnet-system-clientmodel
  git
  jq
)
# The commit the package was published from (tag Azure.Core_1.64.0), and the official build of it,
# see the file version 1.6400.26.52605 of its assemblies (encoding the date and build number)
_commit="254a1b693af968afee40958e77d0762b44a1b13c"
_officialbuildid="20261026.5"
# The recordings the tests play back, which upstream keeps in a separate repository, see
# sdk/core/Azure.Core/assets.json
_assetscommit="3adf93d405a7f3fcb2f99fe9dd519fa4d86eb480"
source=("azure-sdk-for-net-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "azure-sdk-assets-$_assetscommit.tar.gz::https://github.com/Azure/azure-sdk-assets/archive/$_assetscommit.tar.gz"
  "azure-core-tests-no-broker.patch")
sha512sums=('8392aaf82ef21544a9eae17501eaff12085fbd5f3d70bb3d4854b01a30cbaf66340e64eb83819b19cce5256638459075f7b650cc33e07887d3561d123edc4abe'
            '05c66fd5fd5ec24b7dee5642c9ec7aaaf871d7ff92c6790ad997bac591c1526b173623fe125a0188c221c53ee947e6881036d3bae63fc551f0ad2f8e0cd21485'
            '9821a7e046bbf11c4bc1e2e065d26a23c45fa946902efa0b3b046f861e05b1aa0463f8b0ea721d39ce15bb90627bd6d00e858bff4a26b414a77d86646a4648d3')
b2sums=('1045e4f6a071a58fd858cb44212bd25c308fcdc391667f25e9b68f51b62b3ceec13411fb6957c3f9c37127f2b7d60cc23d6dae0d7f547eabe2896dea8e3cbeba'
        'ed564f1dc84dfbdd2b47b51b428d9a23115fd052cd64eb42a0211543da022b568dae2359cf6b755f9d35987a4d58a3a63570b1a7231a68996c92302c66618eae'
        'b4c5b6b0e9ea0b8c58b876875a8a54c78a0bb628bcc756580b3eaf583870c4c0030e13d686e453ceefb09e17c11448a4db97e2c71352e995ad94b23a65539099')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The checks of the API listing, the analyzers and API compatibility with the previous release
  # (from nuget.org) don't change the build. Source Link needs git, so the repository information is
  # passed in. The packages from the source-built artifacts and the system feed are newer than the
  # versions referenced (NU1603).
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

# .NET runtime packages Azure.Core is built against
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
  Microsoft.IdentityModel.Abstractions
  System.Diagnostics.DiagnosticSource
  System.IO.Pipelines
  System.Memory.Data
  System.Net.ServerSentEvents
  System.Text.Encodings.Web
  System.Text.Json
)

# Packages built from source by other packages (makedepends), in the system feed
_systempackages=(
  Microsoft.Identity.Client
  Microsoft.Identity.Client.Extensions.Msal
  System.ClientModel
)

# Writes NuGet.config with the feed $1 (as key=url) for everything but the packages of the system
# feed and the runtime packages, which are taken from the source-built artifacts if prepare() found
# them there
_nuget_config() {
  local _package
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-system" value="/usr/share/dotnet/nuget-packages" />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="${1%%=*}" value="${1#*=}" />
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="dotnet-system">
EOF
    for _package in "${_systempackages[@]}"; do
      echo "      <package pattern=\"$_package\" />"
    done
    echo '    </packageSource>'
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

  # The test framework references Azure.Identity.Broker since upstream's PR #57407, so tests that
  # expect no broker sign in through the browser and wait for it, see
  # https://github.com/Azure/azure-sdk-for-net/issues/58160. It references Azure.Core like before.
  patch -Np1 -i "$srcdir/azure-core-tests-no-broker.patch"
  # The test proxy would get the recordings with git, from the git repository it finds above the
  # sources, so it gets them from the sources instead, in their own repository
  cp -r "$srcdir/azure-sdk-assets-$_assetscommit/net/sdk/core/$_nugetid/tests/SessionRecords" "sdk/core/$_nugetid/tests/"
  rm "sdk/core/$_nugetid/assets.json"
  git init --quiet .
}

build() {
  _dotnet_env
  cd "azure-sdk-for-net-$_commit" || exit
  # Version and frameworks as in the official build, the .NET Framework ones against the reference
  # assemblies from nuget.org. The assemblies are public signed with Microsoft's key, giving them the
  # same strong names as upstream's.
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
  # Like upstream's CI (eng/pipelines/templates/jobs/ci.tests.yml), without the tests that need user
  # interaction or Azure. Only on the .NET runtime that's installed, the tests target older ones, too.
  # Without a display and browser, so a test that would sign in interactively can't open sign-in
  # pages, and failing instead of waiting for the sign-in.
  local _result=0
  env -u DISPLAY -u WAYLAND_DISPLAY BROWSER=false \
    dotnet test "sdk/core/$_nugetid/tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}" --framework net10.0 \
    --filter 'TestCategory!=Manually&TestCategory!=Live' --blame-hang-timeout 10m --blame-hang-dump-type none ||
    _result=$?
  # The test framework only stops the test proxy it starts on Windows
  pkill -f "^/usr/bin/dotnet $srcdir/nuget/azure.sdk.tools.testproxy/" || true
  return "$_result"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "azure-sdk-for-net-$_commit/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
