# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=opensc-opendnie-git
pkgver=0.13.0.119.gf77a629
pkgrel=1
pkgdesc="Access smart cards that support cryptographic operations. with OpenDNIe driver (Spanish ID card). (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/OpenSC/OpenSC/wiki"
license=("LGPL")
depends=('pinentry' 'ccid' 'openssl')
makedepends=('git' 'docbook-xsl' 'nasm')
provides=('opensc' 'opensc-opendnie')
conflicts=('opensc')
backup=('etc/opensc.conf')
source=('opensc-opendnie::git+https://github.com/OpenDNIe/OpenSC.git#branch=opendnie'
        'opensc.conf.in-dnie.diff')
sha1sums=('SKIP'
          '55ea882b19cf20ec43095b61d94851ddabac56d3')

pkgver() {
  cd opensc-opendnie
  echo "$(git describe --long --tags | tr - .)"
}

prepare () {
  patch -d opensc-opendnie -p0 -i ../opensc.conf.in-dnie.diff

  cd opensc-opendnie
  ./bootstrap
}

build() {
  cd opensc-opendnie
  _sheetdir=(/usr/share/xml/docbook/xsl-stylesheets-*)
  ./configure --prefix=/usr --sysconfdir=/etc --enable-doc \
              --enable-sm --enable-dnie-ui --with-xsl-stylesheetsdir="${_sheetdir}"
  make
}

package() {
  make -C opensc-opendnie DESTDIR="${pkgdir}" install
}
