# Maintainer: kozec <kozec at kozec.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit-consolekit
pkgver=0.113
pkgrel=3
pkgdesc="PolicyKit with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.freedesktop.org/wiki/Software/polkit"
depends=('glib2' 'pam' 'expat' 'js')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
provides=("polkit=$pkgver")
conflicts=('polkit')
options=('!libtool')
install=polkit.install
source=(http://www.freedesktop.org/software/polkit/releases/polkit-$pkgver.tar.gz
        polkit.pam)

build() {
  cd "$srcdir/polkit-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/polkit-1 \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-libsystemd-login=no \
      --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/polkit-$pkgver"
  make DESTDIR="$pkgdir" install

  chown 102 "$pkgdir/etc/polkit-1/rules.d"
  chown 102 "$pkgdir/usr/share/polkit-1/rules.d"

  install -m644 "$srcdir/polkit.pam" "$pkgdir/etc/pam.d/polkit-1"
}

md5sums=('4b77776c9e4f897dcfe03b2c34198edf'
         '6564f95878297b954f0572bc1610dd15')
