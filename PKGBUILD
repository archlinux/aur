# Maintainer: r4v3n6101

pkgname=xash3d-fwgs-git
pkgver=r1354.3b192ca
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
source=("$pkgname::git+https://github.com/FWGS/xash3d-fwgs" xash3d xash3d.conf)
backup=('etc/conf.d/xash3d')
md5sums=('SKIP' '0c88bd258675e48990e14b2a60cbac5c' 'fe2b8c7e787544f382176cde5013824f')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    git submodule update --init --recursive
    ./waf configure -T release --enable-lto --enable-poly-opt
}

build() {
    cd $srcdir/$pkgname
    ./waf build
}

package() {
    cd $srcdir
    install -Dm 755 "xash3d" "${pkgdir}/usr/bin/xash3d"
    install -Dm 644 "xash3d.conf" "${pkgdir}/etc/conf.d/xash3d"
    cd $pkgname
    ./waf install --strip --destdir="${pkgdir}"
    install -Dm 755 "vgui-dev/lib/vgui.so" "${pkgdir}/usr/local/lib/xash3d/vgui.so"
}

