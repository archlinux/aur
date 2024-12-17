# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dist-meta
pkgver=0.8.1
pkgrel=1
pkgdesc='Parse and create Python distribution metadata'
arch=('any')
url='https://dist-meta.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-domdf-python-tools'
  'python-handy-archives'
  'python-packaging'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
#checkdepends=('')
#optdepends=('')
source=("$pkgname::git+https://github.com/repo-helper/dist-meta#tag=v$pkgver")
sha512sums=('6bed8087136e8e265136d067d192868de9e2bd0e9e261eb5b4eb8b6c94df3781d1a1986b8641e6686eb1051db494ee7af1dc5163ca189735c91d9d0ab45d6fb0')
b2sums=('8d7b9de86d86bed0c027c1b196d2f9dd0163d8d944cecfa70c00f2cc4e553a67c0b58e9bd70f147789a8d0ac3db52e672e7a4ed9b1696646c22fddc876794866')

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
