# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5
_baseversion=6.12
_patchlevel=0
#pkgver=${_baseversion}.${_patchlevel}
pkgver=${_baseversion}
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml.'
conflicts=('camlp5-transitional')
url='http://pauillac.inria.fr/~ddr/camlp5/'
license=('BSD')
depends=('ocaml')
sha1sums=('d78d89dbd33725d7589181c38cc67180502da2f8')
source=("http://pauillac.inria.fr/~ddr/camlp5/distrib/src/camlp5-${_baseversion}.tgz")
# upstream likes to release occasional patches instead of releasing new versions
for i in $(seq ${_patchlevel}); do
  source+=("http://pauillac.inria.fr/~ddr/camlp5/distrib/src/patch-${_baseversion}-${i}")
done
options=('staticlibs')

build() {
  cd camlp5-${_baseversion}

  for i in $(seq ${_patchlevel}); do
    patch -Np0 -i ${srcdir}/patch-${_baseversion}-${i}
  done

  cd ${srcdir}/camlp5-${_baseversion}

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -strict

  make world.opt
}

package() {
  cd camlp5-${_baseversion}

  make DESTDIR=${pkgdir} install

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/camlp5/LICENSE
}

