# Maintainer: Christopher Draper <christopherwdraper@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=cockpit-git
pkgver=194.r102.gfea9847af
pkgrel=1
pkgdesc='A systemd web based user interface for Linux servers'
arch=(i686 x86_64)
url='http://www.cockpit-project.org/'
license=(GPL2)
backup=(etc/pam.d/cockpit)
provides=(cockpit)
depends=(libssh krb5 pam-krb5 sshpass accountsservice perl-json perl-locale-po json-glib pcp glib-networking)
makedepends=(git intltool python2-pyscss gtk-doc perl-javascript-minifier-xs gobject-introspection networkmanager libgsystem xmlto npm)
optdepends=(storaged udisks2 networkmanager)
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

  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

check() {
  cd cockpit
  make check
}

package() {
  cd cockpit
  make DESTDIR="$pkgdir" install

  # Overwrite cockpit pam file with ArchLinux supported pam file
  install -Dm644 "$srcdir"/cockpit.pam "$pkgdir"/etc/pam.d/cockpit
}
