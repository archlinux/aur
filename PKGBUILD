# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=python-pypresence-git
_stablename=${pkgname%-git}
_name=${_stablename#python-}

pkgver=4.3.0.r41.g4e882c3
pkgrel=1
pkgdesc='Discord RPC and Rich Presence wrapper library - git version'
url='https://github.com/qwertyquerty/pypresence'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-sphinx
  python-wheel
  git
)
conflicts=('python-pypresence')
provides=("python-pypresence=$pkgver")
source=("$_name::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd $_name
  ( set -o pipefail
    git describe --tags --long --abbrev=7 2>/dev/null | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  cd $_name

  python -m build --wheel --no-isolation
  sphinx-build -b man docs/sphinx man
}

package() {
  cd $_name

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir"/usr/share/man/man1 man/pypresence.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
