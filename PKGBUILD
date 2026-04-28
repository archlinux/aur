# Maintainer: sixiao
# Based on: kwin-effects-better-blur-dx by Nico <d3sox at protonmail dot com>

pkgname=kwin-effects-better-blur-dx-patched
_srcname=kwin-effects-better-blur-dx
pkgver=2.3.0
pkgrel=1
pkgdesc="KWin Better Blur DX — patched to fix force blur covering entire opaque windows"
arch=('x86_64')
url="https://github.com/xarblu/kwin-effects-better-blur-dx"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin)
makedepends=(cmake extra-cmake-modules qt6-tools kwin)
provides=("kwin-effects-better-blur-dx=$pkgver")
conflicts=('kwin-effects-better-blur-dx' 'kwin-effects-forceblur')
replaces=('kwin-effects-forceblur')
install="$pkgname.install"
source=(
    "$_srcname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "fix-force-blur-rendering.patch"
)
sha256sums=(
    '4f9945a05e0e6fffc9cc5f0bb012046e2b0fe6f848af07a8b5b3f94b7b4a2fca'
    'SKIP'
)

prepare() {
    cd "$_srcname-$pkgver"
    patch -p1 -i "$srcdir/fix-force-blur-rendering.patch"
}

build() {
    local _cmake_args=(
        -B build
        -S "$_srcname-$pkgver"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BETTERBLUR_X11=OFF
    )

    cmake "${_cmake_args[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
