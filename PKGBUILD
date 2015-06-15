# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=colord-git
pkgver=1.2.1.r14.g5a9987b
pkgrel=1
pkgdesc="System daemon for managing color devices"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/software/colord"
license=(GPL2)
depends=(lcms2 libgusb polkit sqlite systemd dconf dbus)
makedepends=(intltool gobject-introspection vala docbook2x sane bash-completion
perl-xml-libxml perl-file-which)
optdepends=('sane: scanner support')
replaces=('shared-color-profiles')
provides=(colord)
conflicts=(colord)
install=colord.install
source=('colord::git+git://github.com/hughsie/colord.git'
        'colord.install'
        'colord-git-docbook.patch'
        )
sha1sums=('SKIP'
          'e06950f0c75ffedd2977ff12945cfbf5a947899d'
          'ce6b0953a669abe228a309028ee9168c0f11f51c')
_gitname=colord

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 < $srcdir/colord-git-docbook.patch
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname --disable-static \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-vala --enable-sane --with-daemon-user=colord
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/_/./g;s/COLORD.//g'
}

# vim:set ts=2 sw=2 et:
