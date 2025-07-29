# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-cmudict
pkgver=1.1.1
pkgrel=1
pkgdesc="A versioned python wrapper package for cmudict"
arch=('any')
url="https://github.com/prosegrinder/python-cmudict"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+https://github.com/prosegrinder/python-cmudict.git#tag=v$pkgver"
        'git+https://github.com/cmusphinx/cmudict.git')
sha256sums=('d2ed1e55df15e01c8275cc2d733ed545213703ad74ee99dd413c7fdd5de7fadf'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.src/cmudict/data.url "$srcdir/cmudict"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python -m venv --clear --without-pip --system-site-packages .testenv
	.testenv/bin/python -m installer dist/*.whl
	.testenv/bin/python -m pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
