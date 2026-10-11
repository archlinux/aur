# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-modules
pkgver=356
pkgrel=2
pkgdesc="a programming language to create games (Fenix successor) - modules"
arch=('x86_64')
url="http://sourceforge.net/projects/bennugd/"
license=('Zlib')
depends=('bennugd-core' 'lib32-glibc' 'lib32-libpng' 'lib32-libx11' 'lib32-sdl12-compat' 'lib32-sdl_mixer')
makedepends=('subversion' 'gcc-multilib')
source=("core::svn+https://svn.code.sf.net/p/bennugd/code/core#revision=${pkgver}"
        "modules::svn+https://svn.code.sf.net/p/bennugd/code/modules#revision=${pkgver}")
md5sums=('SKIP' 'SKIP')

prepare() {
    cd $srcdir/modules
    chmod +x ./configure
    sed -i -e 's/info_ptr->trans_values/info_ptr->trans_color/' -e 's/info_ptr->trans[^_]/info_ptr->trans_alpha/' mod_map/file_png.c
    sed -i -e '/fmul/s%^%// %' -e '/fdiv/s%^%// %' ../core/include/fmath.h
}

build() {
    cd $srcdir/modules
    CFLAGS+=" -std=gnu17 -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=int-conversion"
    ./configure --prefix=/usr --build=i686-pc-linux-gnu
    make
}

package() {
    make -C $srcdir/modules DESTDIR=${pkgdir} install
    install -Dm644 $srcdir/modules/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
