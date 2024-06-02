# Maintainer:  Peter Mattern <pmattern at arcor dot de>
# Contributor: Koscheev "Ashen" Mikhail <fresh19991 at yandex dot ru>
# Contributor: Pascal "hardfalcon" Ernster <aur at hardfalcon dot net>
# Contributor: Marcel Dykstra <marcel dot dykstra at gmail dot com>

_pkgname=xf86-video-openchrome
pkgname=$_pkgname-git
pkgver=0.6.0.r808.g857d892
pkgrel=1
pkgdesc='Open Source X driver for VIA IGPs'
arch=('i686' 'x86_64')
url='http://www.freedesktop.org/wiki/Openchrome'
license=('MIT')
depends=('libdrm' 'libxvmc' 'xorg-server')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2')
provides=("$_pkgname")
conflicts=("$_pkgname" 'X-ABI-VIDEODRV_VERSION<25' 'X-ABI-VIDEODRV_VERSION>=26')
source=("git+https://anongit.freedesktop.org/git/openchrome/$_pkgname.git#branch=main")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/^xf86-video-openchrome-//;s/-/.r/;s/-/./"
}

build() {
    # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
    # With them, module fail to load with undefined symbol.
    # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
    export CFLAGS=${CFLAGS/-fno-plt}
    export CXXFLAGS=${CXXFLAGS/-fno-plt}
    export LDFLAGS=${LDFLAGS/-Wl,-z,now}
    cd $_pkgname
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
    install -D -m644 $srcdir/$_pkgname/COPYING \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
