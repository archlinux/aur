# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
pkgver=3.2.0
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('nemo>=3.2' 'engrampa')
makedepends=()
conflicts=('nemo-fileroller')
options=('!libtool' '!emptydirs')

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('1536fd828b2ee0a8f194155a9e13b8cce937b403b5c87d8e579d7b1ced8d6d14')

build() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"

#  sed -i "s|AM_CONFIG_HEADER|AC_CONFIG_HEADERS|g" configure.in

  cd src
  for file in *fileroller* ; do
    mv "${file}" "${file/fileroller/engrampa}"
  done
  cd ..
  find . -type f -exec sed -i -e 's:fileroller:engrampa:g' -e 's:file-roller:engrampa:g' '{}' \;

  autoreconf -fi

  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
