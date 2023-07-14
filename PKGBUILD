# Maintainer: necklace <ns@nsz.no>
# Contributor: Max Beikirch <max.beikirch (at) unitybox (dot) de>

pkgname=tor-shadow
pkgver=3.0.0
pkgrel=1
pkgdesc="An open-source network simulator/emulator hybrid (e.g. for Tor and Bitcoin)"
arch=('any')
url="https://shadow.github.io/"
license=('custom')
depends=('glib2>=2.32.0' 'python>=3.6')
makedepends=('gcc' 'cmake>=3.2' 'make' 'cargo' 'pkgconf' 'xz' 'util-linux' )
optdepends=('python-numpy' 'python-lxml' 'python-matplotlib' 'python-networkx' 'python-scipy' 'python-yaml')
source=("https://github.com/shadow/shadow/archive/v$pkgver.tar.gz")
sha256sums=("da8962e9eafe0d6005316df8f2b6d238b87840504538d5cde2b83335f9d2664f")

# TODO
# Maybe there should be a prepare() that checks various system variables to make sure they are in accordance with:
# https://github.com/shadow/shadow/blob/0171ea8282e19bc439add4ad952bf75a98444627/docs/system_configuration.md

build() {
  mkdir -p "shadow-$pkgver/build"
	cd "shadow-$pkgver/build"
	cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DSHADOW_TEST=ON \
	  ..
	make
}

check() {
  cd "shadow-$pkgver/build"
  ctest
}

package() {
  install -Dm644 "${srcdir}/shadow-${pkgver}/LICENSE" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	cd "shadow-$pkgver/build"
	make DESTDIR="${pkgdir}" install	
}
