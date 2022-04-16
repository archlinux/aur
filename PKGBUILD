# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=2.2.0
pkgrel=2
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
  'python-zstandard'
  'rpm-tools'
  'xz'
  'zstd'
)
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest'
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
  "0001-Use-different-Python-package-for-ZStandard.patch"
)
sha256sums=(
  '53d61cb3c31663c8e86703548bec38f21a49cf0e5a4bdb26f7f6bc3cee899178'
  '8775c5f66987a8f6a99fdb24cc769a5ca253acdb1f03c96134763ac7eda02f3b'
)

prepare() {
  cd "$pkgname-$pkgver"

  patch --forward --strip=1 --input="${srcdir}/0001-Use-different-Python-package-for-ZStandard.patch"
}

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"

  python -m pytest -c /dev/null
}

package() {
  cd "$pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
