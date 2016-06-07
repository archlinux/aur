# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=networkmanager-sstp
pkgver=1.2
pkgrel=2
pkgdesc="SSTP support for NetworkManager"
arch=('i686' 'x86_64')
url="http://sstp-client.sourceforge.net/#Network_Manager_Plugin"
license=('GPL2')
depends=('sstp-client' 'nm-connection-editor' 'libsecret')
optdepends=('ppp>=2.4.6')
options=()
makedepends=('git' 'intltool' 'ppp>=2.4.6' 'gawk' 'python')
provides=('networkmanager-sstp')
source=("git://github.com/enaess/network-manager-sstp.git#branch=release-1.2")
sha512sums=('SKIP')

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd "${srcdir}/network-manager-sstp"

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
  cd "${srcdir}/network-manager-sstp"

  make DESTDIR="${pkgdir}/" install
}
