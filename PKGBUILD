# Maintainer:

_module="iniparse"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=0.5.1.r0.g0f3da0a
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
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

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
