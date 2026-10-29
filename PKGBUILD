# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-omnisharp-extensions
pkgver=0.19.11
pkgrel=1
pkgdesc="Language Server Protocol and Debug Adapter Protocol for .NET, OmniSharp.Extensions.* (NuGet packages)"
arch=('any')
url='https://github.com/OmniSharp/csharp-language-server-protocol'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-mediatr-12
  dotnet-nerdbank-streams
  dotnet-newtonsoft-json
  dotnet-sdk-"$_dotnetsdkver"
  dotnet-system-reactive
  dotnet-vs-threading
  dotnet-vs-validation
  jq
)
# The commit the packages were published from (tag v0.19.11). OmniSharp.Extensions.JsonRpc.Generators
# 0.19.11 was published from an earlier commit, only CI and dependency versions changed since.
_commit="a601a66c59e570d297e83987aff79038c5449724"
source=("csharp-language-server-protocol-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('cc3e223c5dc2e0096495722e485a296c790cd88a5e55b6990e8e0ab5acfef14ae13ae499616a2e8ccc488f81ac9efaaa5e21961bd5c464d28ba11fc0e5faacfc')
b2sums=('bc564390c993b2cd14c38c909ae485846214569130d604c6242b5e28af9c62c7954496156373fde793e4cfbfbdd0737c013deab0ba464d0f1bfbbe686246e30e')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Versions as in the official build, which GitVersion computes from git. The repository information
  # usually comes from git, which would find the repository this PKGBUILD is in instead. The upstream
  # build downloads the package icon. The packages from the source-built artifacts and the system feed
  # are newer than the versions referenced (NU1603).
  _build_arguments=(
    --configuration Release
    -p:GitVersion_SemVer="$pkgver"
    -p:GitVersion_AssemblySemVer="$pkgver.0"
    -p:GitVersion_Major="${pkgver%%.*}"
    -p:GitVersion_Minor="$(cut -d. -f2 <<<"$pkgver")"
    -p:GitVersion_InformationalVersion="$pkgver+Branch.master.Sha.$_commit"
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
    -p:RepositoryType=git
    -p:RepositoryBranch=refs/heads/master
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:IncludeSymbols=false
    -p:PackageIcon=
    -p:WarningsNotAsErrors=NU1603
  )
}

# .NET runtime packages the libraries are built against
_runtimepackages=(
  Microsoft.Bcl.AsyncInterfaces
  Microsoft.Extensions.Configuration
  Microsoft.Extensions.Configuration.Abstractions
  Microsoft.Extensions.Configuration.Binder
  Microsoft.Extensions.DependencyInjection
  Microsoft.Extensions.DependencyInjection.Abstractions
  Microsoft.Extensions.Logging
  Microsoft.Extensions.Logging.Abstractions
  Microsoft.Extensions.Options
  Microsoft.Extensions.Options.ConfigurationExtensions
  Microsoft.Extensions.Primitives
  System.Collections.Immutable
  System.Diagnostics.DiagnosticSource
  System.IO.Pipelines
  System.Threading.Channels
)

# Packages built from source by other packages (makedepends), in the system feed
_systempackages=(
  MediatR
  MediatR.Contracts
  Microsoft.VisualStudio.Threading.Only
  Microsoft.VisualStudio.Validation
  Nerdbank.Streams
  Newtonsoft.Json
  System.Reactive
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

  cd "csharp-language-server-protocol-$_commit" || exit
  # Upstream pins a newer feature band of the .NET SDK, which isn't needed
  jq 'del(.sdk)' global.json >global.json.new
  mv global.json.new global.json
  # With the newer runtime packages, NuGet would pick System.Threading.Tasks.Extensions 4.6.0, which
  # Roslyn asks for, for the source generator, and fail as System.IO.Pipelines needs 4.6.3 (NU1605)
  sed -i '0,/<PackageReference /s|\( *\)<PackageReference |\1<PackageReference Include="System.Threading.Tasks.Extensions" VersionOverride="4.6.3" PrivateAssets="all" />\n\1<PackageReference |' \
    src/JsonRpc.Generators/JsonRpc.Generators.csproj
  # MediatR 12.5 passes a CancellationToken to RequestHandlerDelegate, which some tests don't take
  sed -i 's/, () => Task\.FromResult(/, _ => Task.FromResult(/' test/Lsp.Tests/Matchers/ResolveCommandMatcherTests.cs
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
}

build() {
  _dotnet_env
  cd "csharp-language-server-protocol-$_commit" || exit
  # The assemblies are signed with the key in the repository, giving them the same strong names as
  # upstream's
  local _project
  for _project in src/*/*.csproj; do
    dotnet pack "$_project" "${_build_arguments[@]}" --output "$srcdir/nupkg"
  done
}

check() {
  _dotnet_env
  cd "csharp-language-server-protocol-$_commit" || exit
  local _project
  for _project in test/*/*.csproj; do
    dotnet test "$_project" "${_build_arguments[@]}"
  done
}

package() {
  install -Dm644 "$srcdir/nupkg/"*".$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "csharp-language-server-protocol-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
