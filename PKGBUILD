# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-microsoft-identity-client
pkgver=4.92.0
pkgrel=1
pkgdesc="Microsoft Authentication Library for .NET (MSAL.NET), Microsoft.Identity.Client and its extensions (NuGet packages)"
arch=('any')
url='https://github.com/AzureAD/microsoft-authentication-library-for-dotnet'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
)
# The commit the packages were published from
_commit="2465fc31fa2b481b68660670e2becfd3fba7c631"
_packages=(
  Microsoft.Identity.Client
  Microsoft.Identity.Client.Extensions.Msal
)
source=("microsoft-authentication-library-for-dotnet-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('36916817a43a48932081f2758ebc792f0604cbc7f1cf73ca3f7b1517d8b72fb4c1fd6e3ae642daca4fc6ddc055b225cad00102026c3a8b959a6a219b8f723913')
b2sums=('a07b231b4684edc8f4622c21110da681973d31f40d235475255f198aa791c4c5e69e9170343909d1c55e70ff2e716783e0632ff300fbbcd8d242c727b5a17697')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The version is passed in by the official build. The repository information usually comes from
  # git, which would find the repository this PKGBUILD is in instead.
  # Microsoft.IdentityModel.Abstractions from the source-built artifacts is newer than the version
  # referenced (NU1603).
  _build_arguments=(
    --configuration Release
    -p:MicrosoftIdentityClientVersion="$pkgver"
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
    -p:WarningsNotAsErrors=NU1603
  )
}

# .NET runtime packages MSAL is built against
_runtimepackages=(
  Microsoft.IdentityModel.Abstractions
)

# Writes NuGet.config, taking the runtime packages from the source-built artifacts if prepare() found
# them there, and everything else from nuget.org like upstream
_nuget_config() {
  local _package
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
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
    <packageSource key="nuget.org">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  } >NuGet.config
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

  cd "microsoft-authentication-library-for-dotnet-$_commit" || exit
  # Upstream pins the .NET 8 SDK, the libraries build with newer ones just as well
  rm global.json
  # Upstream runs the unit tests on Windows only. They also target .NET Framework 4.8, which pulls in
  # the Windows-only desktop projects, and deploy their resources with Windows paths.
  # shellcheck disable=SC2016 # MSBuild properties, not shell expansions
  sed -i 's|<TargetFrameworks>$(TargetFrameworkNetDesktop48);$(TargetFrameworkNet)</TargetFrameworks>|<TargetFrameworks>$(TargetFrameworkNet)</TargetFrameworks>|' \
    tests/Microsoft.Identity.Test.Unit/Microsoft.Identity.Test.Unit.csproj
  grep -rl --include='*.cs' 'DeploymentItem(' tests/Microsoft.Identity.Test.Unit |
    xargs sed -i -E 's/DeploymentItem\((@?)"Resources\\\\?/DeploymentItem(\1"Resources\//'
  _nuget_config
}

build() {
  _dotnet_env
  cd "microsoft-authentication-library-for-dotnet-$_commit" || exit
  # On Linux, upstream's projects build for .NET Standard 2.0 and .NET 8, not the .NET Framework,
  # Android and iOS builds. The assemblies are signed with the key in the repository, giving them the
  # same strong names as upstream's.
  local _package
  for _package in "${_packages[@]}"; do
    dotnet pack "src/client/$_package/$_package.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
  done
}

check() {
  _dotnet_env
  cd "microsoft-authentication-library-for-dotnet-$_commit" || exit
  # Tests of features and behaviour that only exist on Windows, which upstream doesn't run elsewhere:
  local _filter=(
    # Managed identity with mTLS proof of possession, which needs Windows CNG keys (KeyGuard), see
    # https://github.com/AzureAD/microsoft-authentication-library-for-dotnet/pull/5807
    'FullyQualifiedName!~ManagedIdentityTests.ImdsV2Tests.'
    'FullyQualifiedName!~ManagedIdentityTests.ManagedIdentityTests.GetManagedIdentityCapabilities_ImdsV2KeyGuard_ReportsKeyGuardAsync'
    # The key provider for it uses CNG on .NET 8 regardless of the platform (#if NET8_0)
    'FullyQualifiedName!~ManagedIdentityTests.InMemoryManagedIdentityKeyProviderTests.Cancellation_AfterCache_ReturnsCachedKey_IgnoringCancellation'
    'FullyQualifiedName!~ManagedIdentityTests.InMemoryManagedIdentityKeyProviderTests.Cancellation_BeforeCreation_Throws_And_SubsequentCallSucceeds'
    'FullyQualifiedName!~ManagedIdentityTests.InMemoryManagedIdentityKeyProviderTests.ReturnsRsa2048_AndCaches_Success'
    'FullyQualifiedName!~ManagedIdentityTests.InMemoryManagedIdentityKeyProviderTests.Rsa_SignsAndVerifies'
    # The broker is the Web Account Manager of Windows
    'FullyQualifiedName!~BrokerTests.RuntimeBrokerTests.'
    'FullyQualifiedName!~BrokerTests.BrokerTests.BrokerGetAccountsWithBrokerInstalledTestAsync'
    # They expect Windows line endings in the serialized JSON
    'FullyQualifiedName!~CacheSerializationTests.TestAppMetadata_Supports_AdditionalFields'
    'FullyQualifiedName!~CacheSerializationTests.TestMsalNet2XCacheSerializationInterop'
    'FullyQualifiedName!~CacheSerializationTests.TestSerializeMsalAccessTokenCacheItemWithAdditionalFields'
    'FullyQualifiedName!~CacheSerializationTests.TestSerializeMsalAccountCacheItemWithAdditionalFields'
    'FullyQualifiedName!~CacheSerializationTests.TestSerializeMsalIdTokenCacheItemWithAdditionalFields'
    'FullyQualifiedName!~CacheSerializationTests.TestSerializeMsalRefreshTokenCacheItemWithAdditionalFields'
    # It expects "Windows" as the OS in the telemetry headers
    'FullyQualifiedName!~TelemetryTests.MsalIdHelperTests.IdHelperAsync'
    # Setting an environment variable to an empty string only removes it on Windows
    'FullyQualifiedName!~CoreTests.EnvVariableContextTests.EnvVariableContextTest'
    # The file watcher raises two change events for touching a file on Linux (inotify)
    'FullyQualifiedName!~CacheExtension.FileIOWithRetriesTests.Touch_FiresEvent_Async'
  )
  # The test runner targets .NET 8. The tests parse timestamps in the current culture and time zone,
  # and expect the invariant culture and UTC like on upstream's CI.
  TZ=UTC LC_ALL=C.UTF-8 DOTNET_ROLL_FORWARD=Major \
    dotnet test tests/Microsoft.Identity.Test.Unit/Microsoft.Identity.Test.Unit.csproj \
    "${_build_arguments[@]}" --filter "$(IFS='&'; echo "${_filter[*]}")"
}

package() {
  local _package
  for _package in "${_packages[@]}"; do
    install -Dm644 "$srcdir/nupkg/$_package.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  done
  install -Dm644 "microsoft-authentication-library-for-dotnet-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
