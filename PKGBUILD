# Maintainer: Tiago Silva <tiagolsilva14 at gmail dot com>
#
# Before each release:
#  - tag v$pkgver upstream and push the tag
#  - run `updpkgsums` to fill sha256sums
#  - regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO
pkgname=mcu-studio
pkgver=1.2.0
pkgrel=2
pkgdesc="Repair damaged JPEGs by editing their DCT coefficients directly, with an MCU-level editor"
arch=('x86_64')
_repo_url="https://github.com/TheGameratorT/mcu-studio"
url="$_repo_url"
license=('GPL-3.0-only')
# jpegrepair is vendored and built into the app, so it is not a runtime
# dependency; libjpeg-turbo provides the system libjpeg the app links.
depends=('qt6-base' 'libjpeg-turbo')
# Only the ONNX Runtime headers are used to build; the library is opened at
# run time if it is there. This needs a release after 1.2.0, which linked it.
makedepends=('cmake' 'qt6-tools' 'onnxruntime')
optdepends=('onnxruntime: AI fill on this computer (the LaMa model)')
source=("$pkgname-$pkgver.tar.gz::$_repo_url/archive/v$pkgver.tar.gz")
sha256sums=('567aae0357a33a1e504a5fef74c65f283e9d33adee82e14cce63a23b15d5b2a6')
_srcdir="$pkgname-$pkgver"

build() {
    cmake -B build -S "$_srcdir" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMCU_STUDIO_ONNX=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
