# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gitlint
pkgver=0.17.0
pkgrel=4
pkgdesc='Git commit message linter'
arch=('any')
url='https://github.com/jorisroovers/gitlint'
license=('MIT')
options=(!emptydirs)
depends=(
  'python'
  'python-arrow'
  'python-click'
  'python-sh'
)
makedepends=('python-setuptools')
checkdepends=(
  'git'
  'python-pytest'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "0001-Unset-EDITOR-env-var-in-test_run_hook_edit.patch"
  "gitlint.install"
)
sha256sums=(
  '1c1e895aea22b1ded131a9dc81dd1f37fb064a9f3af7421debd1606ca646196a'
  'ec117041e4ba8a3a46d27e169982129dd08e455501de676d873fce91b1d934cd'
  'c160f586b02894afc3535de1f9c843b60bfc24d2b56cc00ab26472dc296123c4'
)
install=gitlint.install

prepare() {
  cd "$pkgname-$pkgver"

  patch --forward --strip=1 --input="${srcdir}/0001-Unset-EDITOR-env-var-in-test_run_hook_edit.patch"
}

build() {
  cd $pkgname-$pkgver
  cd gitlint-core

  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  cd gitlint-core

  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  cd gitlint-core

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
