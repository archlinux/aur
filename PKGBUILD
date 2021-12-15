# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Maato <maato softwarebakery com>
pkgname=volumeicon-gtk2
_pkgname=volumeicon
pkgver=0.5.1
pkgrel=5
pkgdesc='Volume control for the system tray (gtk2)'
arch=(x86_64 i686)
url='https://softwarebakery.com/maato/volumeicon.html'
license=(GPL3)
depends=(alsa-lib gtk2 libnotify)
makedepends=(git intltool)
install=volumeicon.install
source=("$pkgname::git+https://github.com/Maato/volumeicon.git#tag=$pkgver"
        "volumeicon-notify.patch::https://github.com/Maato/volumeicon/commit/78a9c23775ebe12d3f3be93c0798144a6e732d90.patch"
        gtk2.patch
        volumeicon.desktop)
sha256sums=('SKIP'
            'f9d7d14e302f760815bb0da2af7f00ae3f2ef34da69e84863ae3e97e7302b8db'
            '7980d0eadfeea474b51d4e43aecde9c28c5c91729b8601acf9472300fb1bdc2a'
            '3f989bce3a080b2446af6d7ed7e8a22dfd3019f888a7b11a0759bf7cf704f975')

provides=($_pkgname=$pkgver-$pkgrel)
conflicts=($_pkgname)

prepare() {
  cd $pkgname
  patch -Np1 -i ../volumeicon-notify.patch
  patch -Np2 -b -z .orig -i ../gtk2.patch
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --enable-notify
  make
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" install
  install -Dm644 volumeicon.desktop "$pkgdir/usr/share/applications/volumeicon.desktop"
  rm -f "$pkgdir/usr/share/volumeicon/gui/*.orig"
}

# vim: ts=2 sw=2 et:
