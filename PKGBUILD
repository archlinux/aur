# Maintainer: r4v3n6101

pkgname=xash3d-fwgs-git
pkgver=r1662.f9d0fba0
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
md5sums=('SKIP' 'efe97fe57678fac6626109037750046d')

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
    cd $pkgname
    ./waf install --strip --destdir="${pkgdir}/usr/local/lib/xash3d/"
    install -Dm 755 "vgui-dev/lib/vgui.so" "${pkgdir}/usr/local/lib/xash3d/vgui.so"
}
