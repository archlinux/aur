# Maintainer: r4v3n6101

pkgname=xash3d-fwgs-git
pkgver=r5065.b7150c32
pkgrel=1
pkgdesc="A custom GoldSrc engine implementation"
arch=('x86_64')
url="http://xash.su/"
license=('GPL3')
depends_i686=('freetype2' 'fontconfig' 'libpulse' 'sdl2')
depends_x86_64=('lib32-freetype2' 'lib32-fontconfig' 'lib32-libpulse' 'lib32-sdl2')
makedepends=('make' 'binutils' 'python')
makedepends_i686=('gcc' 'gcc-libs')
makedepends_x86_64=('gcc-multilib' 'lib32-gcc-libs')
provides=('xash3d')
conflicts=('xash3d-hlsdk' 'xash3d-git')
source=("$pkgname::git+https://github.com/FWGS/xash3d-fwgs" xash3d)
md5sums=('SKIP' '841343b918060f86389afcbbf3672cc2')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    git submodule update --init --recursive
    ./waf configure -T release --enable-lto --enable-poly-opt --enable-bundled-deps
}

build() {
    cd $srcdir/$pkgname
    ./waf build
}

package() {
    cd $srcdir
    install -Dm 755 "xash3d" "${pkgdir}/usr/bin/xash3d"
    cd $pkgname
    ./waf install --strip --destdir="${pkgdir}/opt/xash3d/"
    install -Dm 755 "3rdparty/vgui_support/vgui-dev/lib/vgui.so" "${pkgdir}/opt/xash3d/vgui.so"
}
