# Maintainer: Mark Constable <markc@renta.net>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=cockpit-git
pkgver=0.38.r33.g27888f6
pkgrel=1
pkgdesc='A systemd web based user interface for Linux servers'
arch=(i686 x86_64)
url='http://www.cockpit-project.org/'
license=(GPL2)
depends=(libssh krb5 sshpass accountsservice perl-json udisks2 json-glib libgsystem perl-locale-po networkmanager pcp)
makedepends=(jsl git intltool python2-pyscss gtk-doc perl-javascript-minifier-xs gobject-introspection storaged xmlto nodejs)
source=(git://github.com/cockpit-project/cockpit
        cockpit.pam)
sha1sums=('SKIP'
          '9d1268e4e9ad6aca14d2afd5e64176f497cc027d')

pkgver() {
  cd cockpit
  git describe --long --tags | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd cockpit
  sed 's|#!/usr/bin/python|#!/usr/bin/python2|g' -i tools/tap-*
}

build() {
  cd cockpit

  # Build failed with --as-needed
  export LDFLAGS="${LDFLAGS//,--as-needed}"

  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

check() {
  cd cockpit

#  some D-Bus related failures
#  make check
}

package() {
  cd cockpit
  make DESTDIR="$pkgdir" install

  # Overwrite cockpit pam file with ArchLinux supported pam file
  cp "$srcdir"/cockpit.pam "$pkgdir"/etc/pam
}
