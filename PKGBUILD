# Maintainer: Stanislav Senotrusov <senotrusov@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=mdformat-asterisk
pkgver=1.0.0
pkgrel=2
pkgdesc='CommonMark-compliant Markdown formatter patched to swap primary and secondary marker symbols'
arch=(any)
url=https://github.com/senotrusov/mdformat-asterisk
license=(MIT)
depends=(python-markdown-it-py)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
conflicts=(mdformat)
source=("git+$url.git#tag=$pkgver")
b2sums=('8d23ce0ef4b9f73c0b16f141d1bbd09d545ed23b9756298a8324f6915276cbd587aa69c0020291fcc1c48306ef9fcba3ef2ad06bbf177f9d1d868fb69f0dc370')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  PYTHONPATH=build/lib pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
