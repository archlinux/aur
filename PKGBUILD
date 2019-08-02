# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
pkgver=4.2.0
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('nemo>=3.2' 'engrampa')
options=('!libtool' '!emptydirs')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('8ee8698c6058762965635d8233c18a4019437f73752e2085087d812aa46c0fe5')

build() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"

  cd src
  for file in *fileroller* ; do
    mv "${file}" "${file/fileroller/engrampa}"
  done
  cd ..
  find . -type f -exec sed -i -E \
    -e 's:file[\ \-]?roller:engrampa:g' \
    -e 's:File[\ \-]?[rR]oller:Engrampa:g' '{}' \;

  autoreconf -fi

  PYTHON=python ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
