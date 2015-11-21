# Maintainer: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Mark Constable <markc@renta.net>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=cockpit
pkgver=0.84
pkgrel=2
pkgdesc='A systemd web based user interface for Linux servers'
arch=(i686 x86_64 armv6h armv7h)
url='http://www.cockpit-project.org/'
license=(LGPL2.1)
conflicts=(cockpit-git)
depends=(libssh krb5 sshpass accountsservice perl-json perl-locale-po json-glib pcp glib-networking)
makedepends=(git intltool python2-pyscss gtk-doc perl-javascript-minifier-xs gobject-introspection networkmanager libgsystem xmlto npm)
optdepends=(storaged udisks2 networkmanager)
source=(https://github.com/cockpit-project/cockpit/archive/${pkgver}.tar.gz
        remotectl-with-empty-selinux.patch)
sha1sums=('55ab248fa174f1bd16c8d77cf704e33ebc4b1e5d'
          'c18aae424cd724178bbd0502b9aae17e15f861f8')

prepare() {
 cd "${srcdir}"/${pkgname}-${pkgver}
 patch -Np1 -i ../remotectl-with-empty-selinux.patch
}

build() {
  cd cockpit-${pkgver}

  # Build failed with --as-needed
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  mkdir -p build
  cd build
  
  ../autogen.sh
  ../configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd cockpit-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
