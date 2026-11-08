# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
pkgver=6.8.0
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL-2.0-or-later')
depends=('nemo' 'engrampa')
makedepends=('meson' 'samurai' 'glib2-devel')
options=('!libtool' '!emptydirs')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('5ea1fcc3d1561d361b328cdb9acfa3a226177f326b1febd40b028f1fb212ee2d')

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
  meson setup --prefix=/usr \
        --libexecdir=lib/${pkgname} \
        --buildtype=plain \
        ..
  samu
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"/builddir
  DESTDIR="${pkgdir}" samu install
}
