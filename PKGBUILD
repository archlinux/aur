# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis-git
pkgver=0.7.0.r38.g9c5b485d
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('x86_64')
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('python')
conflicts=('blis')
provides=('blis')
url='https://github.com/flame/blis'
options=('!buildflags' '!emptydirs')
source=("git+https://github.com/flame/blis.git" blis_profile.sh)
sha512sums=('SKIP'
            'cb53fa1f8c540062d4d55b4b91c787a821c563ea0bdb4e37f1db08869c320132a493e6b55f5d876418d56ad5b4f1dc5553f871862418393614e160dd1329ec9e')

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
