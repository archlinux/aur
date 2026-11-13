# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# The .NET packages build against the packages of one .NET build, never a mix: they makedepend on
# dotnet-build-deps-10.0, which this package (the source-built .NET of Arch Linux) or
# dotnet-build-deps-10.0-bin (Microsoft's build) provides. The source-built artifacts, the reference
# packages and the native library of System.IO.Ports are built from the same sources (the VMR's) as
# Microsoft's packages on nuget.org, but by a different build, with different versions and RIDs.
# The name has the .NET version, as the packages build with that SDK. It depends on the versioned
# packages, which the unversioned ones of the current .NET (dotnet-build-deps) provide while it has this
# version.
_dotnetver=10.0
pkgname=dotnet-build-deps-$_dotnetver
# The version of the source-built .NET of Arch Linux (dotnet-sdk-10.0): the runtime version and the
# SDK's feature band and patch. The packages built from the VMR are pinned to exactly that release, so
# the build never mixes packages of two VMR releases.
pkgver=10.0.14.sdk114
pkgrel=2
_runtimever=${pkgver%.sdk*}
_sdkver=$_dotnetver.${pkgver##*.sdk}
pkgdesc="Build dependencies of the .NET packages from the source-built .NET $_dotnetver of Arch Linux (meta package)"
arch=(x86_64)
url='https://github.com/dotnet/dotnet'
license=(0BSD)
depends=(
  "dotnet-sdk-$_dotnetver=$pkgver"
  "dotnet-source-built-artifacts-$_dotnetver=$pkgver"
  # The packages the source-built artifacts lack, built from the same sources: the reference packages
  # are versioned like the SDK, the native library like the runtime
  "dotnet-source-build-reference-packages-$_dotnetver=$_sdkver"
  "dotnet-system-io-ports-native-$_dotnetver=$_runtimever"
)
# Microsoft's build, which provides dotnet-sdk-$_dotnetver and dotnet-runtime-$_dotnetver as well.
# The packages for older .NET versions have the version in the name.
conflicts=(
  dotnet-runtime-bin
  "dotnet-runtime-$_dotnetver-bin"
  dotnet-sdk-bin
  "dotnet-sdk-$_dotnetver-bin"
)
source=("LICENSE")
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
