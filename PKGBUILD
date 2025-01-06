# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=nemo-engrampa
pkgver=6.4.0
pkgrel=1
pkgdesc="Archive management plugin for Nemo using engrampa"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('nemo' 'engrampa')
makedepends=('meson' 'samurai' 'glib2-devel')
options=('!libtool' '!emptydirs')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('55e8fb43edde09c3ceba197a4359c1e79b1f0ea7007543d26f32532957aabd49')

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
