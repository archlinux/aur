# Maintainer:

_module="iniparse"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.5.r21.gdbfd717
pkgrel=1
pkgdesc="Better INI parser library for Python"
url="https://github.com/candlepin/python-iniparse"
license=('MIT')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-tests'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="candlepin.python-iniparse"
source=(
  "$_pkgsrc"::"git+$url.git"
  "29_fix_tests.patch"::"https://github.com/candlepin/python-iniparse/pull/29.diff"
)
sha256sums=(
  'SKIP'
  'bbd488275c73583591dcc997993834240e2f45878a1c3ce4972cd82b5b1d925b'
)

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -i ../29_fix_tests.patch
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pkgsrc"
  python runtests.py
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" "$(ls -1 dist/*.whl | sort -rV | head -1)"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  rm -rf "$pkgdir/usr/share/doc"
}
