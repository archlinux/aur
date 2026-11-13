# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# The build dependencies of the current .NET of Arch Linux (dotnet-sdk), like dotnet-build-deps-10.0 has
# the ones of a .NET version, on the unversioned packages: dotnet-sdk, dotnet-source-built-artifacts,
# and the unversioned dotnet-source-build-reference-packages and dotnet-system-io-ports-native. Like
# them, it stands in for the versioned package while the current .NET has its version, and moves on with
# the next .NET. A PKGBUILD of its own, as makepkg installs the depends of all packages of a split
# PKGBUILD, and the unversioned and versioned ones conflict.
_dotnetver=10.0
pkgname=dotnet-build-deps
# The version of the current source-built .NET of Arch Linux (dotnet-sdk): the runtime version and the
# SDK's feature band and patch. The packages built from the VMR are pinned to exactly that release, so
# the build never mixes packages of two VMR releases.
pkgver=10.0.14.sdk114
pkgrel=1
_runtimever=${pkgver%.sdk*}
_sdkver=$_dotnetver.${pkgver##*.sdk}
pkgdesc="Build dependencies of the .NET packages from the current source-built .NET of Arch Linux (meta package)"
arch=(x86_64)
url='https://github.com/dotnet/dotnet'
license=(0BSD)
depends=(
  "dotnet-sdk=$pkgver"
  "dotnet-source-built-artifacts=$pkgver"
  # The packages the source-built artifacts lack, built from the same sources: the reference packages
  # are versioned like the SDK, the native library like the runtime
  "dotnet-source-build-reference-packages=$_sdkver"
  "dotnet-system-io-ports-native=$_runtimever"
)
provides=("dotnet-build-deps-$_dotnetver=$pkgver")
# Microsoft's build (see dotnet-build-deps-10.0), and the versioned package of the same .NET
conflicts=(
  dotnet-runtime-bin
  "dotnet-runtime-$_dotnetver-bin"
  dotnet-sdk-bin
  "dotnet-sdk-$_dotnetver-bin"
  "dotnet-build-deps-$_dotnetver"
)
source=("LICENSE")
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
