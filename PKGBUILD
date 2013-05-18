# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=udisks2-nosystemd
pkgver=2.1.0
pkgrel=2
pkgdesc="Disk Management Service, version 2"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
depends=('glib2' 'udev' 'polkit-consolekit' 'libatasmart' 'eject')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'python')
optdepends=('parted: partition management'
            'gptfdisk: GUID partition table support')
provides=("udisks2=${pkgver}")
conflicts=('udisks2')
replaces=('udisks2')
options=(!libtool)
source=(http://udisks.freedesktop.org/releases/udisks-$pkgver.tar.bz2)
sha256sums=('310208e5a10335dae4b52a0125c24d31cf292cce3d15cf65da4cd308e38d15a8')

build() {
  cd "udisks-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make

  # fix mdadm location
  sed -i -e 's#/sbin/mdadm#/usr/bin/mdadm#g' \
	  "${srcdir}/udisks-${pkgver}"/data/80-udisks2.rules
}

package() {
  cd "udisks-$pkgver"
  make DESTDIR="$pkgdir" install \
    bash_completiondir=/usr/share/bash-completion/completions
}
