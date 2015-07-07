# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: onestep_ua <onestep@ukr.net>

pkgname=consolekit-git
pkgver=395.af75e10
pkgrel=1
epoch=1
pkgdesc="A framework for defining and tracking users, login sessions, and seats"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/ConsoleKit"
license=('GPL')
depends=('polkit' 'zlib' 'libx11' 'dbus-glib')
makedepends=('git' 'pkgconfig' 'xmlto' 'docbook-xsl')
replaces=('consolekit')
provides=('consolekit')
conflicts=('consolekit')
options=(!libtool)
source=(git+git://anongit.freedesktop.org/ConsoleKit \
		pam-foreground-compat.ck consolekit.logrotate consolekit.tmpfiles.conf)
md5sums=('SKIP'
         'a8a4de71d9b0549b8143e5f6c2a36fc7'
         '6fefa451d9fe2fc6d6269629d3529793'
         '8c5a8059db515d40fae1379daf084094')

pkgver() {
  cd "$srcdir/ConsoleKit"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/ConsoleKit"

  ./autogen.sh --prefix=/usr \
      --sbindir=/usr/bin \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/ConsoleKit \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-pam-module \
      --with-pam-module-dir=/usr/lib/security \
      --enable-docbook-docs \
      --enable-udev-acl
  make
}

package() {
  cd "$srcdir/ConsoleKit"
  make DESTDIR="$pkgdir" install
  install -m755 "$srcdir/pam-foreground-compat.ck" "$pkgdir/usr/lib/ConsoleKit/run-session.d/"

  # install the logrotate config
  install -D -m644 "$srcdir/consolekit.logrotate" "$pkgdir/etc/logrotate.d/consolekit"

  install -D -m644 "$srcdir/consolekit.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/consolekit.conf"

  rm -rf "$pkgdir/var/run"
}
