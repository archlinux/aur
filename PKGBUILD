# Maintainer: Caleb Fontenot foley2431 (at) gmail.com
pkgname=pcsx-rearmed-git
pkgver=r23.r98.g8987ee2
pkgrel=1
pkgdesc="Playstation 1 Emulator. Optimized for ARM."
arch=('x86_64' 'aarch64')
license=('GPL-2.0')
makedepends=()
#depends=('perl')
source=("git+https://github.com/notaz/pcsx_rearmed.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pcsx_rearmed"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
        cd "$srcdir/pcsx_rearmed"
        #export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
        git submodule init
        git submodule update
}


build() {
        cd "$srcdir/pcsx_rearmed"
        ./configure
        make rel $MAKEFLAGS
}

package() {
        cd "$srcdir/"
        rm -v pcsx_rearmed/*.zip
        #mkdir -p $srcdir/pcsx
        mv -v pcsx_rearmed/pcsx_rearmed_* $srcdir/PCSX
        mkdir -p $pkgdir/opt
        mkdir -p $pkgdir/usr/bin
        cp -rv PCSX $pkgdir/opt/PCSX
        ln -sf /opt/PCSX/pcsx pcsx
        mv -v pcsx $pkgdir/usr/bin/pcsx
        #make DESTDIR="" install
}
