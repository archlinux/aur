# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Simon Doppler <dop dot simon at gmail dot com>
pkgname=python-colored
_name=${pkgname#python-}
pkgver=2.3.1
pkgrel=1
pkgdesc="Simple python library for color and formatting to terminal"
arch=('any')
url="https://dslackw.gitlab.io/colored"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("https://gitlab.com/dslackw/colored/-/archive/$pkgver/$_name-$pkgver.tar.gz"
        'tests-set-tty-aware-false.patch')
sha256sums=('225b1c3240eb426525d153b9f98784d4d9b29e662501c8eb135b5e01323346d7'
            '0946c4592ac78b89f18e88b55717e65e7a55ba48983ee6b086f134c6764514ff')

prepare() {
  cd "$_name-$pkgver"
  patch -Np1 -i ../tests-set-tty-aware-false.patch

  # remove shebangs
  sed -i '/#!\/usr\/bin\/env python/d' colored/*.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
