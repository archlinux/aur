# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis-git
pkgver=0.9.0.r2.g69fa9154
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('x86_64')
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('python')
conflicts=('blis' 'blas')
provides=('blis' 'blas')
url='https://github.com/flame/blis'
options=('!lto' '!emptydirs')
source=("git+https://github.com/flame/blis.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" $(git describe --tags|sed 's+-+.r+'|tr - .) 
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -fPIC" ./configure --prefix=/usr \
	 --enable-static \
	 --enable-shared \
	 --enable-threading=openmp auto
  make BLIS_ENABLE_DYNAMIC_BUILD:=yes
}

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
