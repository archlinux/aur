# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=xf86-input-cmt-git
pkgdesc="Chromium OS multitouch input driver for Xorg X server"
pkgver=1.0.r17.g6537abb
pkgrel=1
epoch=1
arch=(i686 x86_64)
url="https://github.com/GalliumOS/xf86-input-cmt"
license=('custom:chromiumos')
_gitname='xf86-input-cmt'
depends=('xf86-input-cmt-setup' 'xf86-input-evdev' 'libgestures' 'libevdev' 'libevdevc')
provides=("xf86-input-cmt=$pkgver")
conflicts=('xf86-input-synaptics')
makedepends=('autoconf' 'automake' 'dmidecode' 'git' 'xorg-util-macros' 'xorg-server-devel')
install=${pkgname}.install
source=("$_gitname::git+https://github.com/GalliumOS/xf86-input-cmt.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # cutting off 'release.' prefix that presents in the git tag
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  chmod +x autogen.sh
  ./autogen.sh
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
