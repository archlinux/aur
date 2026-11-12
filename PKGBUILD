# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-system-clientmodel
_nugetid=System.ClientModel
pkgver=1.17.0
pkgrel=1
pkgdesc="Building blocks for .NET clients that call cloud services, System.ClientModel (NuGet package)"
arch=(any)
url='https://github.com/Azure/azure-sdk-for-net'
license=(MIT)
_dotnetsdkver="10.0"
makedepends=(
  "dotnet-build-deps-$_dotnetsdkver"
  jq
)
# The commit the package was published from (tag System.ClientModel_1.16.0), and the official build
# of it, see the file version 1.1600.26.46705 of its assemblies (encoding the date and build number)
_commit="589eb9e6a05aec55b5fed98d9465e28b1e85739d"
_officialbuildid="20260917.5"
source=("azure-sdk-for-net-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('dfc9d287cc3ca884753f9bb85b3a39eff14680e56dea9a234df480d004ef373765048b6f627e723a5e982535c548596069fcff5942284d55b6502cfb103f294e')
b2sums=('6966a0b7d5e8df629b0adf3e1244ea02d8ae89d621f9da0ef614ae305e73af916c8f7c841335f91400073f343caf3f7df0f70286d92ffe2860384c84faacb9e3')

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
# are taken from the source-built artifacts if prepare() found them there.
# The package patterns $2... come from nuget.org instead.
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
  dotnet pack "sdk/core/$_nugetid/src/$_nugetid.csproj" "${_build_arguments[@]}" \
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
  # Only on the .NET runtime that's installed, the tests target older ones, too
  dotnet test "sdk/core/$_nugetid/tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}" --framework net10.0
  rm -rf "${_test_tmp:?}"
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
