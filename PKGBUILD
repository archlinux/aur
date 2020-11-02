# Maintainer: Mark Pustjens <pustjens@dds.nl>

pkgname=quill
pkgver=1.4.1
pkgrel=1
pkgdesc="Asynchronous Low Latency C++ Logging Library"
arch=('any')
url="https://github.com/odygrd/quill"
license=('MIT')
depends=('fmt')
makedepends=('cmake' 'git')
source=("https://github.com/odygrd/quill/archive/v${pkgver}.tar.gz")
sha512sums=('6086da07323325e0be3ff68987dfc857cf9eac535a6750fa41e39e5ba1d9566143b8c1e1ff4b347a2242eb8664274f58b490e3222b49f255da8652bf2aed1149')
b2sums=('06a7a20371d88e045843ca15e390c8005ac3ee36986b1044a6d9ec130df029cb8dcf9e26eafb15c0991450312c9a2fcae684ca630045363256a4377f551aa3b7')

prepare() {
  mkdir -vp "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
        -DQUILL_BUILD_TESTS=ON \
        -DQUILL_FMT_EXTERNAL=ON \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k test -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
