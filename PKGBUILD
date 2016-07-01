# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=networkmanager-sstp
pkgver=1.2
pkgrel=4
pkgdesc="SSTP support for NetworkManager"
arch=('i686' 'x86_64')
url="http://sstp-client.sourceforge.net/#Network_Manager_Plugin"
license=('GPL2')
depends=('sstp-client' 'nm-connection-editor' 'libsecret')
optdepends=('ppp>=2.4.6')
options=()
makedepends=('git' 'intltool' 'ppp>=2.4.6' 'gawk' 'python')
provides=('networkmanager-sstp')
source=("https://github.com/enaess/network-manager-sstp/archive/release-${pkgver}.tar.gz")
sha1sums=('2d27f07a94f1c9dd66faa2503b653bea28a8a368')

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd "${srcdir}/network-manager-sstp-release-${pkgver}"

  autoreconf --install &&
  intltoolize --force &&
  autoreconf &&
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/networkmanager \
    --with-pppd-plugin-dir=/usr/lib/pppd/${pppd_version} \
    --libdir=/usr/lib \
    --enable-maintainer-mode

  make
}

package() {
  cd "${srcdir}/network-manager-sstp-release-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
