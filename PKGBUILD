# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=2.1.0
pkgrel=1
pkgdesc="A tool for checking common errors in rpm packages"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=(
  'binutils'
  'bzip2'
  'cpio'
  'gzip'
  'python'
  'python-magic'
  'python-pybeam'
  'python-pyxdg'
  'python-toml'
  'python-zstd'
  'rpm-tools'
  'xz'
  'zstd'
)
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'python-pytest-flake8'
  'python-pytest-xdist'
)
optdepends=(
  'appstream-glib: for AppData file validation'
  'checkbashisms: for checking bashisms'
  'dash: for checking bashisms'
  'desktop-file-utils: for checking desktop entries'
  'python-pyenchant: for spell checking'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "skip-test-requiring-rpmdb.patch"
)
sha512sums=(
  '75df896259b5c340c528357309b2e5e1ce574b7e5e55dff573a1a7808faa3617da799df37e7e65064952a16549225beb16c1e12ba22f2fe4976a69696ed66f46'
  '56dbea9ec9465d749d095819352fbfea570b1452aad523bb8a2d1a8ea8878489fdbc8190cbb6d8c2e82d60290d238edd502f879239124aadb81d7cdbac846365'
)

prepare() {
  cd "$pkgname-$pkgver"

  patch --forward --strip=1 --input="${srcdir}/skip-test-requiring-rpmdb.patch"
}

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"

  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
