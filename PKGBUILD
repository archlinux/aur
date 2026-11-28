# Maintainer: Cláudio Sampaio <patola at gmail dot com>
pkgname=x4vrmod
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial VR mod for native Linux X4: Foundations (not affiliated with Egosoft)"
arch=('x86_64')
url="https://github.com/Patola/X4VRMOD"
# The mod's own licence and its linking exception (LICENSE.exception), and the OpenXR loader it
# ships, built with its jsoncpp: all four install in /usr/share/licenses/x4vrmod.
license=('GPL-3.0-or-later' 'LicenseRef-x4vrmod-linking-exception' 'Apache-2.0' 'MIT')
depends=('bash' 'gamescope' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'openxr'
         'qt6-base' 'vulkan-icd-loader' 'zlib')
makedepends=('cmake' 'gettext' 'git' 'python' 'python-pillow' 'vulkan-headers')
optdepends=('gamemode: the launcher offers it, for a few more frames per second'
            "qt6-translations: Qt's own buttons in the launcher's language")
# A release candidate's pkgver is 1.0.0rc1, which pacman sorts before 1.0.0; its tag is v1.0.0-rc1.
# The OpenXR loader the mod ships, for X4 started from Steam (cmake/x4vr_openxr_loader.cmake):
# the same commit as X4VR_OPENXR_SDK_COMMIT there, release-1.1.60.
source=("x4vrmod::git+https://github.com/Patola/X4VRMOD.git#tag=v${pkgver/rc/-rc}"
        "OpenXR-SDK::git+https://github.com/KhronosGroup/OpenXR-SDK.git#commit=64f2b37c8c6da3d83c9b4d11865ba1fb752cb8ec"
        "x4vrmod-1.0.0-packaging.patch")
sha256sums=('SKIP'
            'SKIP'
            'abe1e2d5aad2ddace8d623a86fce6f590c733500c4aa18d75f898e72a4e96353')
# A debug package for a game mod nobody debugs from a package, 12 MB beside 7.
options=('!debug')

# 1.0.0 only: upstream's c08d2bc, after the tag (no build paths in the binaries; the shipped
# OpenXR loader keeps LDFLAGS). The next release has it, and this goes.
prepare() {
    patch -d x4vrmod -Np1 -i "$srcdir/x4vrmod-1.0.0-packaging.patch"
    # The build names itself with `git describe --dirty`; the patch is packaging only, so it
    # stays v1.0.0 in the logs and bug reports, not v1.0.0-dirty.
    git -C x4vrmod update-index --assume-unchanged \
        cmake/x4vr_openxr_loader.cmake launcher/CMakeLists.txt launcher/core/checks.cpp
}

build() {
    cmake -S x4vrmod -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DX4VR_BUILD_TESTS=OFF \
        -DX4VR_DEV_LAYOUT=OFF \
        -DX4VR_OPENXR_SDK_DIR="$srcdir/OpenXR-SDK"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
