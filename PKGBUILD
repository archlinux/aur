# Maintainer: Florent Thiéry <fthiery@gmail.com>

pkgname=cockpit-minimal
pkgver=163
pkgrel=1
pkgdesc='A systemd web based user interface for Linux servers (minimal setup with system graphs, journalctl, storage, network, user accounts, systemd services and terminal)'
arch=(i686 x86_64 armv6h armv7h)
url='http://www.cockpit-project.org/'
license=(LGPL2.1)
conflicts=(cockpit-git cockpit)
depends=(libssh krb5 sshpass accountsservice perl-json perl-locale-po json-glib glib-networking networkmanager)
# udisks support disables some features
#http://cockpit-project.org/guide/latest/feature-storaged.html
optdepends=('udisks2: disk stats support')
makedepends=(git intltool python2-pyscss gtk-doc perl-javascript-minifier-xs gobject-introspection networkmanager libgsystem xmlto npm tar)
source=(https://github.com/cockpit-project/cockpit/releases/download/${pkgver}/cockpit-${pkgver}.tar.xz
	https://github.com/cockpit-project/cockpit/releases/download/${pkgver}/cockpit-cache-${pkgver}.tar.xz)
noextract=(cockpit-${pkgver}.tar.xz)
sha1sums=('e452e104c7eddf590911298a95d4d43108c97a39'
          '1a00807afe8aab0c46efce3586d30ddb0d7de47e')

prepare() {
  cd $srcdir

  #bsdtar can't extract cockpit
  tar -xf cockpit-${pkgver}.tar.xz
}

build() {
  cd cockpit-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --disable-pcp --disable-doc
  make
}

package() {
  cd cockpit-${pkgver}
  make DESTDIR="$pkgdir" install
  cd $pkgdir
  for d in docker kdump kubernetes machines ostree ovirt packagekit pcp playground realmd selinux sosreport subscriptions tuned; do
      rm -r usr/share/cockpit/$d;
      rm -rf usr/src/debug/usr/share/cockpit/$d;
  done
}
