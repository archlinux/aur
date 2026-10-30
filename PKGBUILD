# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-source-build-reference-packages
# The version of the source-built .NET SDK whose sources (the VMR) the commit is taken from
pkgver=10.0.113
pkgrel=1
pkgdesc="Reference, targeting and text-only NuGet packages of .NET's source build (SBRP), e.g. NETStandard.Library"
arch=('any')
url='https://github.com/dotnet/source-build-assets'
license=('MIT')
_dotnetsdkver="10.0"
# Arcade, the MSBuild SDKs and ILAsm come from the source-built .NET
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  dotnet-source-built-artifacts-"$_dotnetsdkver"
)
# The commit of src/source-build-assets in the VMR (dotnet/dotnet, src/source-manifest.json) of the
# tag v$pkgver. The repository was renamed from source-build-reference-packages.
_commit="a13f85878bf40ed4c57f997b82cbdade521826d3"
source=("source-build-assets-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('e0401152c8710f551d33865e0126172bd1a9f508e8b5f32536eaf190bc0f6bb9a182ccc5f431e1b9efc685ae7073a6015d97471a3bd70404bb5a3aab68fca129')
b2sums=('c8fbe8aa05b9a6b6721b61c2e091e3017296c92e4e6344a6afb1cc4d171bf5b3a6617d8835acb6c044dbf884de96b6eeaf45eb4b298010906e0e6aa41d1f924b')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # Arcade uses the installed SDK instead of downloading the one global.json names
  export DOTNET_INSTALL_DIR=/usr/share/dotnet
  # RID of the .NET SDK: arch-x64 for the source-built .NET of Arch Linux
  _rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
}

# Writes NuGet.config with the packages from the source-built artifacts, and the given feeds ($@, as
# key=url) for everything else
_nuget_config() {
  local _feed
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
EOF
    for _feed in "$@"; do
      echo "    <add key=\"${_feed%%=*}\" value=\"${_feed#*=}\" />"
    done
    cat <<EOF
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="dotnet-source-built">
      <package pattern="*" />
    </packageSource>
EOF
    for _feed in "$@"; do
      printf '    <packageSource key="%s">\n      <package pattern="*" />\n    </packageSource>\n' "${_feed%%=*}"
    done
    cat <<EOF
  </packageSourceMapping>
</configuration>
EOF
  } >NuGet.config
}

prepare() {
  # Besides Arcade and the tools, some reference packages restore their dependencies from there, like
  # in the VMR (e.g. Newtonsoft.Json for NuGet.Packaging)
  mkdir -p nuget-local
  bsdtar -xf /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz -C nuget-local '*.nupkg'

  cd "source-build-assets-$_commit" || exit
  # The installed SDK and the Arcade of the source-built .NET, instead of the versions upstream pins
  local _sdkver _arcadever
  _sdkver=$(dotnet --version)
  _arcadever=$(find "$srcdir/nuget-local" -name 'Microsoft.DotNet.Arcade.Sdk.*.nupkg' -printf '%f\n' |
    sed -E 's/^Microsoft\.DotNet\.Arcade\.Sdk\.(.*)\.nupkg$/\1/')
  sed -i -E \
    -e "s|(\"version\": \")[^\"]*\"|\1$_sdkver\"|" \
    -e "s|(\"dotnet\": \")[^\"]*\"|\1$_sdkver\"|" \
    -e "s|(\"Microsoft.DotNet.Arcade.Sdk\": \")[^\"]*\"|\1$_arcadever\"|" \
    global.json
  # The external packages are other projects' sources as git submodules (e.g. Newtonsoft.Json), which
  # are packaged on their own
  sed -i '/externalPackages.proj/d' eng/Build.props
}

build() {
  _dotnet_env
  cd "source-build-assets-$_commit" || exit
  # Only from the source-built artifacts, nothing is downloaded. ILAsm builds the targeting packs, in
  # the version and for the RID of the source-built .NET.
  _nuget_config
  local _ilasmver
  _ilasmver=$(find "$srcdir/nuget-local" -name "runtime.$_rid.Microsoft.NETCore.ILAsm.*.nupkg" -printf '%f\n' |
    sed -E "s/^runtime\.$_rid\.Microsoft\.NETCore\.ILAsm\.(.*)\.nupkg$/\1/")
  ./build.sh --ci --configuration Release \
    -p:MicrosoftNetCoreIlasmPackageRuntimeId="$_rid" \
    -p:MicrosoftNETCoreILAsmVersion="$_ilasmver"
}

check() {
  _dotnet_env
  cd "source-build-assets-$_commit" || exit
  # The test framework comes from nuget.org
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
  # The validation tests check the built packages: the reference assemblies are marked as built by
  # SBRP, and no package is signed. The tests of generate.sh download the packages from nuget.org to
  # generate their sources again, which isn't needed for building them.
  dotnet test tests/SbrpTests/Sbrp.Tests.csproj --configuration Release \
    --filter 'FullyQualifiedName~ValidationTests'
}

package() {
  cd "source-build-assets-$_commit" || exit
  # In a feed of their own: some reference packages have their reference assemblies in lib/ (e.g.
  # System.Collections.Immutable), which must not end up in applications, so consumers map only the
  # packages they compile against to this feed
  install -Dm644 artifacts/packages/Release/{ReferenceOnly,Shipping}/*.nupkg \
    -t "$pkgdir/usr/share/dotnet/source-build-reference-packages/"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
