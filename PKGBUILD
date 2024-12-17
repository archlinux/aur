# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-whey
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple Python wheel builder for simple projects'
arch=('any')
url='https://whey.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-consolekit'
  'python-dist-meta'
  'python-dom-toml'
  'python-domdf-python-tools'
  'python-handy-archives'
  'python-natsort'
  'python-packaging'
  'python-pyproject-parser'
  'python-shippinglabel'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'python-docutils: readme functionality'
  'python-readme-renderer: readme functionality'
  'python-cmarkgfm: readme functionality'
  'python-editables: editable installs'
)
source=("$pkgname::git+https://github.com/repo-helper/whey#tag=v$pkgver")
sha512sums=('2d2de412ec4b9d6441b6ecc603335f29bfaa7c4a32e7692a4d80be80a3fc1badcd3c0a43a54f25a924a3710bb0d055f63565fa789aaa0f85539c114d27743e19')
b2sums=('e186e846967b31c98227fa1fb68d18a6ccb7a51132a8411bdb2dd3306a69b195534e46e9dc83b69fefa5bfa00c56d31ac825e1a98bd7de0849a27f441da3bc16')

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
