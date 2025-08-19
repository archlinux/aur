# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dist-meta
pkgver=0.9.0
pkgrel=1
pkgdesc='Parse and create Python distribution metadata'
arch=(any)
url='https://dist-meta.readthedocs.io/'
license=(MIT)
depends=(
  python
  python-domdf-python-tools
  python-handy-archives
  python-packaging
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-hatchling
  python-hatch-requirements-txt
)
#checkdepends=('')
#optdepends=('')
source=("$pkgname::git+https://github.com/repo-helper/dist-meta#tag=v$pkgver")
sha512sums=('d5c780be311d0e19d144b8fa207250caf369720e85829f2c1bbd263ecaecad4c302d3c03aef1ea2ca619a97d68b22e045b93428bd8aeea0819420f5b66ada5db')
b2sums=('65a468a10419aaee70276ddae71dadf6ed9ea5a0fdc33d2e76341792efab2a1b5f756c7fab9663495967be758883017b57f2720a9b91a739c9fd759f3e12c48a')

prepare() {
  cd "$pkgname"

  # remove version constraints
  sed \
    -e 's/^requires = \[.*/requires = \[ "setuptools", "wheel" \]/' \
    -i pyproject.toml
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
