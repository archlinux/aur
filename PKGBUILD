# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
_mintrel='betsy'
pkgver=4.0.0
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('nemo>=3.2' 'engrampa')
options=('!libtool' '!emptydirs')
#source=("${_pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${_pkgname:0:1}/${_pkgname}/${_pkgname}_${pkgver}+${_mintrel}.tar.gz")
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('4bee7336554fd3c6e87371bc4683e5bee989a67030582b89a050aad5874a04de')

build() {
  #cd ${_pkgname}-${pkgver}+${_mintrel}
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
  #cd ${_pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
