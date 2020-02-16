# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=kim-api
pkgver=2.1.3
pkgrel=2
pkgdesc="Online framework for reliable, reproducible and portable molecular simulations"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(xxd)
optdepends=('doxygen: build OpenKIM documentation')
makedepends=(cmake gcc-fortran)
install=$pkgname.install
source=(https://s3.openkim.org/kim-api/kim-api-${pkgver}.txz
	Fix-Doxygen-command-error.patch)
sha512sums=('efbc0214234b43a65ed40d23d8faa5264ac1dbd056e9e340548ea7ee5dc530f9cfb2d85a1d9d47fba9dfc7aa660a8ec20374daf4aa8ee605e7c097ae2a12512d'
            '0063cb18884a19d15261e910cc9877ff319f9c1b428023d736e34b5271f254a7eaca9b90033f80af560199e1fe363523da6afb4ee35a05af76b2760039a94cbd')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../Fix-Doxygen-command-error.patch
  cd ..
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
	-DZSH_COMPLETION_COMPLETIONSDIR="/usr/share/zsh/functions/Completion/Unix" \
	-DKIM_API_BUILD_EXAMPLES=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
