# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=2.0.0
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
  "skip-tests-requiring-optional-deps.patch"
)
sha512sums=(
  'f8f65ec90306bf59c0e31a8a3434477c38b8fb08aa2798b805afd57a506b00110797d514431e69dcb8dde5a54afad8606d8e1c973b8584c47cebed1420d6d61c'
  'f2f9b1b8e5bd9d644cf7d597b95f3ee4df94379a167a25640fc708e22cc3774bfa3748f9f8ee31f943094d607f94c205dfdfc3ea2824a279fe9809e5c1c155e0'
)

prepare() {
  cd "$pkgname-$pkgver"

  patch --forward --strip=1 --input="${srcdir}/skip-tests-requiring-optional-deps.patch"
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
