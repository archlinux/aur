# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
pkgver=6.0.1
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('nemo>=3.2' 'engrampa')
makedepends=('meson' 'samurai')
options=('!libtool' '!emptydirs')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('d7d0e78df10dc4240623a1daa7cd457cc4c31969c8a6ff1cdeca4b3ce66b5cdb')

prepare() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"

  cd src
  for file in *fileroller* ; do
    mv "${file}" "${file/fileroller/engrampa}"
  done
  cd ..
  find . -type f -exec sed -i -E \
    -e 's:file[\ \-]?roller:engrampa:g' \
    -e 's:File[\ \-]?[rR]oller:Engrampa:g' '{}' \;
}

build() {
  mkdir -p "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"/builddir
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"/builddir
  meson --prefix=/usr \
        --libexecdir=lib/${pkgname} \
        --buildtype=plain \
        ..
  samu
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"/builddir
  DESTDIR="${pkgdir}" samu install
}
