# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-system-io-ports-native
pkgver=10.0.13
pkgrel=1
pkgdesc="Native library of System.IO.Ports for .NET on Linux, runtime.linux-*.runtime.native.System.IO.Ports (NuGet package)"
arch=('x86_64' 'aarch64')
url='https://github.com/dotnet/runtime'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  clang
  cmake
  lld
)
checkdepends=(python)
options=('!debug')
# The runtime commit of the .NET release, from src/source-manifest.json of the dotnet/dotnet commit the
# 10.0.13 packages were published from (4099f83977f4d29604a9aeb971fb0a7bc1d5f699). The library isn't
# part of the source-built .NET of Arch Linux, so it's built for its version here.
_commit="6aa72daa24f66c01c3d7b6a32519e9d21396deec"
# The tarball of the commit, only the native sources are used
source=("runtime-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "check-serial.py")
sha512sums=('58c92aaa08d3f8ff4af9eb2c75b0d1559d62c23b6043d534e8bcb5cfb371446e5ceb0dd49dc9d11bfb3a8adfc4e66d78bd79c7af84661cffa2d51909fdda5e82'
  '3adc51044f248b82d2a67fa2c791d665bffcb3ff01d89ba48473609d82c74524c2cad11db2114b585503ae03b728855a859a1a0bbe41db669d76ef43d65d18b0')
b2sums=('993176a52c72dd0ba44d76c08ee72ff926e688c8bb9b9121c4fbbbbfe92286ae51516ec6d4ac37ebc4f09670fb7d027719012c6b513251c1166434c260cee914'
  '7ceceec33d6581bb88c4b08f596aacf16ce7d7e25e036cdd81e217c978ad8ce66fc1003c86a302b26e11ccc088fc66c2594952573b0431c7d51b4f7c42013da5')

# The runtime's name of the architecture, and the portable RID the NuGet package is for
_arch() {
  case "$CARCH" in
    x86_64) echo x64 ;;
    aarch64) echo arm64 ;;
  esac
}

prepare() {
  local _nugetid
  _nugetid="runtime.linux-$(_arch).runtime.native.System.IO.Ports"
  mkdir -p nupkg-src
  cat >nupkg-src/pack.csproj <<EOF
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net$_dotnetsdkver</TargetFramework>
    <IncludeBuildOutput>false</IncludeBuildOutput>
    <NuspecFile>$_nugetid.nuspec</NuspecFile>
  </PropertyGroup>
</Project>
EOF
  # Like upstream's package, minus the empty placeholders for the other platforms
  cat >"nupkg-src/$_nugetid.nuspec" <<EOF
<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://schemas.microsoft.com/packaging/2013/05/nuspec.xsd">
  <metadata>
    <id>$_nugetid</id>
    <version>$pkgver</version>
    <authors>Microsoft</authors>
    <license type="expression">MIT</license>
    <projectUrl>https://dot.net/</projectUrl>
    <description>Internal implementation package not meant for direct consumption. Please do not reference directly.</description>
    <repository type="git" url="$url" commit="$_commit" />
  </metadata>
  <files>
    <file src="libSystem.IO.Ports.Native.so" target="runtimes/linux-$(_arch)/native" />
  </files>
</package>
EOF
}

build() {
  cd "runtime-$_commit" || exit
  # Configure the runtime's native libraries like upstream, but only build this one
  local _outconfig
  _outconfig="net$_dotnetsdkver-linux-Release-$(_arch)"
  ./src/native/libs/build-native.sh -release -arch "$(_arch)" -outconfig "$_outconfig" -configureonly
  cmake --build "artifacts/obj/native/$_outconfig" --target System.IO.Ports.Native
  install -Dm755 "artifacts/obj/native/$_outconfig/System.IO.Ports.Native/libSystem.IO.Ports.Native.so" \
    -t "$srcdir/nupkg-src/"
  # makepkg doesn't strip what ends up in the NuGet package
  strip --strip-unneeded "$srcdir/nupkg-src/libSystem.IO.Ports.Native.so"

  cd "$srcdir/nupkg-src" || exit
  DOTNET_CLI_HOME="$srcdir/dotnet-home" DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1 NUGET_PACKAGES="$srcdir/nuget" \
    dotnet pack pack.csproj --output "$srcdir/nupkg"
}

check() {
  # The tests of System.IO.Ports need serial ports, drive a pseudo-terminal with the library instead
  python -I check-serial.py "$srcdir/nupkg-src/libSystem.IO.Ports.Native.so"
}

package() {
  install -Dm644 "$srcdir/nupkg/runtime.linux-$(_arch).runtime.native.System.IO.Ports.$pkgver.nupkg" \
    -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "runtime-$_commit/LICENSE.TXT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
