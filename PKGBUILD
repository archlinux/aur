# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Martchus <martchus@gmx.net>

_realname=network-manager-sstp
pkgname=networkmanager-sstp
pkgver=1.2.6
pkgrel=2
pkgdesc="SSTP support for NetworkManager"
arch=('i686' 'x86_64')
url="http://sstp-client.sourceforge.net/#Network_Manager_Plugin"
license=('GPL2')
depends=('gtk3' 'sstp-client' 'libnma' 'libsecret')
optdepends=('ppp')
makedepends=('intltool' 'ppp' 'python')
provides=("${_realname}")
conflicts=("${_realname}")
source=("https://github.com/enaess/${_realname}/archive/release-${pkgver}.tar.gz")
sha1sums=('2e3654c5293a7513c5365553ca0df1f98b9820d8')

build() {
  pppd_version=$(pppd --version 2>&1 | awk '{print $3}')
  cd "${srcdir}/${_realname}-release-${pkgver}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pppd-plugin-dir=/usr/lib/pppd/${pppd_version} \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --enable-more-warnings=no \
    --with-libnm-glib=no
  # libnm-glib disabled due to missing libnm-gtk package

  make
}

package() {
  cd "${srcdir}/${_realname}-release-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
