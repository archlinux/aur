# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-azure-identity
_nugetid=Azure.Identity
pkgver=1.21.0
pkgrel=2
pkgdesc="Microsoft Entra ID token authentication for the Azure SDK for .NET, Azure.Identity (NuGet package)"
arch=(any)
url='https://github.com/Azure/azure-sdk-for-net'
license=(MIT)
_dotnetsdkver="10.0"
makedepends=(
  dotnet-azure-core
  "dotnet-build-deps-$_dotnetsdkver"
  dotnet-microsoft-identity-client
  dotnet-system-clientmodel
  git
  jq
)
# Azure's test proxy, which the tests start, is an ASP.NET Core application
checkdepends=(
  "aspnet-runtime-$_dotnetsdkver"
  procps-ng # pkill, which stops the test proxy after the tests
)
# The commit the package was published from (tag Azure.Identity_1.21.0), and the official build of
# it, see the file version 1.2100.26.21009 of its assemblies (encoding the date and build number)
_commit="f7400e4471111bf7f2154834022786119acbdd77"
_officialbuildid="20260410.9"
# The recordings the tests play back, which upstream keeps in a separate repository, see
# sdk/identity/Azure.Identity/assets.json
_assetscommit="4e73ccefdeecad24e95641f3592a7da92c153bd3"
source=("azure-sdk-for-net-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "azure-sdk-assets-$_assetscommit.tar.gz::https://github.com/Azure/azure-sdk-assets/archive/$_assetscommit.tar.gz")
sha512sums=('b2f3bca7ea300de872f922146f4e81b3fe2f48a96fa8ed3d9bf5fcba23f5ff5cc1ea41456e44561d46837e06b4ae8de69fa13a5534b7b9e4f08b0a29cc07ebf9'
  '938722d2598e60f5631a883ec194c2e1c0bab08846f932ad109a27f5e6b4d41e9df677d69872af0481dc3727eca9c80aef2ad7d74ea3e6e10b7390f803c259b3')
b2sums=('78bd307dd5de35a5ab58b3246a3daab826331afab04a37e95209a5f5ae49a9412d06a7e05dd99a4d5f55fb7f020813d5b8a6dd7ea95de48eed18c9a90e6eb313'
  'c28c5251411ede98364add0955e5826a06c2d3bc84e461ec898852c45a004ab8d61a0fb8188d3b9680fd59db795db376b6e8825d42712c27a9431478cbf8fb68')

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
  Azure.Core
  Microsoft.Identity.Client
  Microsoft.Identity.Client.Extensions.Msal
  System.ClientModel
)

# Writes NuGet.config with the feed $1 (as key=url) for everything but the packages of the system
# feed and the runtime packages, which are taken from the source-built artifacts if prepare() found
# them there.
# The package patterns $2... come from nuget.org instead.
_nuget_config() {
  local _package
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-system" value="/usr/share/nuget/packages" />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="${1%%=*}" value="${1#*=}" />
EOF
    if (($# > 1)); then
      echo '    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />'
    fi
    cat <<EOF
  </packageSources>
  <packageSourceMapping>
    <clear />
EOF
    if (($# > 1)); then
      echo '    <packageSource key="nuget.org">'
      printf '      <package pattern="%s" />\n' "${@:2}"
      echo '    </packageSource>'
    fi
    cat <<EOF
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
  # The runtime packages come from the .NET dotnet-build-deps-10.0 chooses, so the build never mixes
  # two builds of .NET: the source-built artifacts of Arch Linux (dotnet-source-built-artifacts)
  # with dotnet-build-deps-10.0, Microsoft's build from nuget.org with dotnet-build-deps-10.0-bin.
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

  # The test proxy would get the recordings with git, from the git repository it finds above the
  # sources, so it gets them from the sources instead, in their own repository
  cp -r "$srcdir/azure-sdk-assets-$_assetscommit/net/sdk/identity/$_nugetid/tests/SessionRecords" "sdk/identity/$_nugetid/tests/"
  rm "sdk/identity/$_nugetid/assets.json"
  git init --quiet .
}

build() {
  _dotnet_env
  cd "azure-sdk-for-net-$_commit" || exit
  # Version as in the official build. On Linux, it builds for all frameworks but the .NET Framework.
  # The assemblies are public signed with Microsoft's key, giving them the same strong names as
  # upstream's.
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
  # The changelog verification (eng/Directory.Build.Common.targets) runs pwsh on Verify-ChangeLog.ps1
  # during pack. pwsh isn't there when powershell isn't installed, e.g. a clean chroot, and it can't be
  # a checkdepend: powershell builds against this package. The check doesn't affect the built assembly,
  # so PowerShellExe is pointed at true to skip it.
  dotnet pack "sdk/identity/$_nugetid/src/$_nugetid.csproj" "${_build_arguments[@]}" \
    -p:OfficialBuildId="$_officialbuildid" -p:PowerShellExe=/usr/bin/true --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "azure-sdk-for-net-$_commit" || exit
  # A temp folder of their own, so files with fixed names that another user's build left in /tmp
  # can't get in the way. It stays in /tmp rather than $srcdir, as .NET's named pipes are sockets in
  # it, whose paths can't be longer than 108 bytes.
  local _test_tmp
  _test_tmp=$(mktemp -d)
  export TMPDIR="$_test_tmp"
  # The tests need packages from the feed upstream uses, which mirrors nuget.org
  local _feed
  _feed=$(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' NuGet.Config.upstream)
  # Microsoft's packages from nuget.org, as upstream's feed only has the versions upstream's builds
  # saved there, not e.g. the ones of the installed runtime (see below)
  _nuget_config "$_feed" 'Microsoft.AspNetCore.*' 'Microsoft.Bcl.*' 'Microsoft.Extensions.*' 'Microsoft.Net.Http.Headers' 'System.*'
  # The tests take Microsoft's runtime packages in the version of its installed runtime, as the
  # source-built ones come in the version of the artifacts, instead of the servicing version of .NET
  # upstream pins them to at this commit (as the version of System.Text.Json, and of others in
  # properties). It differs between the Azure packages: System.ClientModel needs newer ones than the
  # tests of Azure.Identity pin. The package itself is built on upstream's pins, like with the
  # artifacts.
  if [[ ! -f "$srcdir/runtime-packages" ]]; then
    local _runtimever _pinned
    _runtimever=$(dotnet --list-runtimes |
      sed -n -E 's/^Microsoft\.NETCore\.App ('"${_dotnetsdkver//./\\.}"'\.[^ ]+) .*/\1/p' | sort -V | tail -1)
    _pinned=$(sed -n -E 's/.*<PackageVersion Include="System\.Text\.Json" Version="('"${_dotnetsdkver//./\\.}"'\.[0-9]+)".*/\1/p' \
      eng/centralpackagemanagement/Directory.Packages.props)
    [[ -z "$_pinned" ]] || sed -i -E 's/([">])'"${_pinned//./\\.}"'(["<])/\1'"$_runtimever"'\2/g' eng/centralpackagemanagement/*.props
  fi
  # The test framework's ASP.NET Core 2.3 brings Microsoft.AspNetCore.WebUtilities 2.3.0, which has a
  # known vulnerability (CVE-2026-118750, GHSA-6527-9fp8-r4x6), and the audit's warning fails the
  # restore: the fixed 2.3.14 instead, which no package of ASP.NET Core 2.3 depends on yet
  # (Microsoft.AspNetCore.Http 2.3.14 still takes 2.3.13), so as a direct reference of the test
  # framework, its version raised in the test framework's own overrides; drop once upstream updates them
  if ! grep -q 'Microsoft.AspNetCore.WebUtilities' sdk/core/Azure.Core.TestFramework/src/Azure.Core.TestFramework.csproj; then
    sed -i 's|<PackageReference Include="Microsoft.AspNetCore.Http" />|&\n    <PackageReference Include="Microsoft.AspNetCore.WebUtilities" />|' \
      sdk/core/Azure.Core.TestFramework/src/Azure.Core.TestFramework.csproj
    sed -i '0,/<ItemGroup>/s||&\n    <PackageVersion Update="Microsoft.AspNetCore.WebUtilities" Version="2.3.14" />|' \
      eng/centralpackagemanagement/overrides/Azure.Core.TestFramework.Packages.props
  fi
  # Like upstream's CI (eng/pipelines/templates/jobs/ci.tests.yml), without the tests that need user
  # interaction or Azure. Only on the .NET runtime that's installed, the tests target older ones, too.
  # Without a display and browser, so a test that would sign in interactively can't open sign-in
  # pages, and failing instead of waiting for the sign-in.
  local _result=0
  env -u DISPLAY -u WAYLAND_DISPLAY BROWSER=false \
    dotnet test "sdk/identity/$_nugetid/tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}" --framework net10.0 \
    --filter 'TestCategory!=Manually&TestCategory!=Live' --blame-hang-timeout 10m --blame-hang-dump-type none ||
    _result=$?
  # The test framework only stops the test proxy it starts on Windows
  pkill -f "^/usr/bin/dotnet $srcdir/nuget/azure.sdk.tools.testproxy/" || true
  rm -rf "${_test_tmp:?}"
  return "$_result"
}

# Fails if a binary in $pkgdir, also inside the .nupkg files there, is identical to one of the packages
# restored from a remote feed like nuget.org into $1, so no prebuilt binary slips in instead of one built
# from source
_check_prebuilt() {
  local _extracted="$srcdir/check-prebuilt" _metadata _file _hash _found=0
  local _binaries=(-type f '(' -name '*.dll' -o -name '*.exe' -o -name '*.so' -o -name '*.so.*' -o -name '*.dylib' ')')
  local -A _prebuilt=()
  while IFS= read -r -d '' _metadata; do
    grep -qE '"source": *"https?://' "$_metadata" || continue
    while IFS= read -r -d '' _file; do
      _prebuilt[$(sha256sum <"$_file")]="${_file#"$1"/}"
    done < <(find "${_metadata%/*}" "${_binaries[@]}" -print0)
  done < <(find "$1" -name .nupkg.metadata -print0)

  rm -rf "$_extracted"
  mkdir -p "$_extracted"
  while IFS= read -r -d '' _file; do
    mkdir -p "$_extracted/${_file#"$pkgdir"/}"
    bsdtar -xf "$_file" -C "$_extracted/${_file#"$pkgdir"/}"
  done < <(find "$pkgdir" -type f -name '*.nupkg' -print0)
  while IFS= read -r -d '' _file; do
    _hash=$(sha256sum <"$_file")
    if [[ -v "_prebuilt[$_hash]" ]]; then
      echo "Prebuilt binary: ${_file#"$_extracted"/} is ${_prebuilt[$_hash]}" >&2
      _found=1
    fi
  done < <(find "$pkgdir" "$_extracted" "${_binaries[@]}" -print0)
  rm -rf "$_extracted"
  return "$_found"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/nuget/packages/"
  install -Dm644 "azure-sdk-for-net-$_commit/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"

  _check_prebuilt "$srcdir/nuget"
}
