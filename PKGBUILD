# Contributor: Lex Black <autumn-wind@web.de>

pkgname=pg-gvm
pkgver=22.6.17
pkgrel=2
pkgdesc='Greenbone Library for helper functions in PostgreSQL'
arch=('x86_64')
url="https://github.com/greenbone/pg-gvm"
license=('GPL-3.0-only')
depends=('gvm-libs' 'glib2' 'libical3' 'postgresql')
makedepends=('cmake' 'doxygen' 'xmltoman' 'libxslt')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc
        0001_not-sbin.patch
        0002_libical3.patch)
sha512sums=('2ee7c0a964b96b71302cc1f9a93a0ff8a7d88c87e202801f57dd0475b38e6696e1ae897f1a2e59ae2674b4a821695b04a5dd3a1434168cf16b43460aec647fdc'
            'SKIP'
            '724ad7720f6ce75747b26478e27fad18b678af6361b4c1a5fe5bb6563265d7db78761b74995c04ea57ad78fb9fd0408d237440f04958bebc03bd6cddb2432481'
            'eadcff083bb237f254191e9fe7240be90c92c4bbedcb1853290e8fa6c45b562b05b520429bfd0827515389a5cda7ab4bdbcec1d433a7ed81ab6926f82c80581d')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np2 -i "${srcdir}/0001_not-sbin.patch"
  patch -Np2 -i "${srcdir}/0002_libical3.patch"
}

build() {
  export PKG_CONFIG_PATH="/usr/lib/libical3/pkgconfig:${PKG_CONFIG_PATH}"
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_DEV_PREFIX=/usr
  make -C build
}

package() {
  make DESTDIR="${pkgdir}/" -C build install
}
