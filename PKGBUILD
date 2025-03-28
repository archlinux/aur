# Maintainer: karboncore

pkgname=python-floret-git
pkgver=434.7756382
pkgrel=1
pkgdesc='fastText + Bloom embeddings for compact, full-coverage vectors with spaCy'
arch=(any)
url=https://github.com/explosion/floret
license=(MIT)
depends=(pybind11 python-pytest)
makedepends=(git python-build python-wheel python-installer python-setuptools)
provides=(${pkgname%-git})
source=(git+https://github.com/explosion/floret.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/floret"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/floret"
  sed -i '/#include <unordered_map>/a #include <cstdint>' src/args.cc
}

build() {
  cd "$srcdir/floret"
  python -m build -wn
}

package() {
  cd "$srcdir/floret"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname%-git}/
}
