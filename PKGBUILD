# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=kim-api
pkgver=2.2.1
pkgrel=1
pkgdesc="Online framework for reliable, reproducible and portable molecular simulations"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(xxd)
optdepends=('doxygen: build OpenKIM documentation')
makedepends=(cmake gcc-fortran)
install=$pkgname.install
source=(https://s3.openkim.org/kim-api/kim-api-${pkgver}.txz)
sha512sums=('b2625dc41474849f281f266a1fa8a2b1738d2433031d2181bde36ac5ec050fcdec3925cb588b287a46c80c01c730be04352ca88a9ba71fc3b37c2da1c84ae650')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../$pkgname-$pkgver" \
  	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
	-DBASH_COMPLETION_COMPLETIONSDIR="/usr/share/bash-completion/completions" \
	-DZSH_COMPLETION_COMPLETIONSDIR="/usr/share/zsh/site-functions" \
	-DKIM_API_BUILD_EXAMPLES=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"/usr/share/emacs/site-lisp
  mv kim-api/*.el .
  rmdir kim-api
  cd ../../..
}
