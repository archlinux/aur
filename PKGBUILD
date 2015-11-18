pkgname=xf86-input-cmt-git
pkgdesc="Chromium OS multitouch input driver for Xorg X server"
pkgver=2.0.6
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/hugegreenbug/xf86-input-cmt"
license=('custom:chromiumos')
_gitname='xf86-input-cmt'
depends=('xf86-input-evdev' 'libgestures' 'libevdev' 'libevdevc-git')
provides=("xf86-input-cmt-git=$pkgver")
conflicts=('xf86-input-synaptics')
makedepends=('autoconf' 'automake' 'dmidecode' 'git' 'xorg-util-macros' 'xorg-server-devel')
install=${pkgname}.install

source=("$_gitname::git+https://github.com/hugegreenbug/xf86-input-cmt.git")

md5sums=('SKIP')

prepare() {
      cd "$srcdir/$_gitname"
}

build() {
     cd "$srcdir/$_gitname"

    sh autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make -C "$srcdir/$_gitname" DESTDIR="$pkgdir/" install

    mkdir -p $pkgdir/usr/share/xf86-input-cmt/
    cp -R $srcdir/$_gitname/xorg-conf/*  $pkgdir/usr/share/xf86-input-cmt/
    cp -R $srcdir/$_gitname/README.md $pkgdir/usr/share/xf86-input-cmt/README

    install -Dm644 ${srcdir}/${_gitname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    libtool --finish /usr/lib/xorg/modules/input
}
