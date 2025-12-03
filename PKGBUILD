# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=libemf2svg
pkgver=1.7.3
pkgrel=1
pkgdesc="EMF (Microsoft Enhanced Metafile) to SVG conversion library"
arch=('x86_64')
url="https://github.com/claricle/libemf2svg"
license=('GPL-2.0-or-later')
depends=('libpng' 'libiconv' 'fontconfig' 'freetype2')
makedepends=('cmake' 'git')
provides=("$pkgname.so=$pkgver")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "git+https://github.com/tamatebako/fmem#tag=bdce2760f0190253600f11984220fc0a007742c8")
sha512sums=('c3ecad89e9cde38b380ab43032ffd89d79722993dda3c7ed33734d6e7ba5208ff0ff2146e6fdba41958679146d46bfec22610a323bf4f894b5d449f0c605d8ca'
            'ef19214c170f44eb4ccacdd1364bb5e816fe67b9a5f6f224e886fe9ad9139075764427d05a87baafde3f72c95dd89c7bff0751e4ca67600ca3463b8af153d98c')

prepare() {
    # TODO: consider making fmem its own package and move this over there
    cd "$pkgname-$pkgver"
    sed -i \
        -e '85d' \
        -e "/GIT_REPOSITORY/c\SOURCE_DIR ${srcdir}/fmem" \
        -e '90a\-DCMAKE_POLICY_VERSION_MINIMUM=3.5' \
        CMakeLists.txt
}

build() {
    local cmake_options=(
        -B build
        -S "$pkgname-$pkgver"
        -Wno-dev
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
