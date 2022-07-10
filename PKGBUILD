# Maintainer: Sam <dev at samarthj dot com>
# Contributor: xantares
# Contributor: ase1590

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller-git
_pkgname=pyinstaller
pkgver=5.2.r8410.gc7040cb65
pkgrel=1
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64' 'i686' 'aarch64' 'ppc64le' 's390x')
url="http://www.pyinstaller.org"
license=('custom:PyInstaller')
depends=(
  "python-altgraph"
  "pyinstaller-hooks-contrib>=2021.4"
  "python>=3.7"
  "python<3.11"
  "python-setuptools"
)
depends_i686=('lib32-zlib')
makedepends=(
  "cmocka"
  "git"
  "python-installer"
  "python-build"
  "python-wheel"
)
optdepends=(
  "python-tinyaes>=1.0.0: bytecode encryption support"
  "python-importlib-metadata: support for python 3.8 and lower"
)
provides=('pyinstaller')
conflicts=('pyinstaller')
source=("git+https://github.com/$_pkgname/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  commit=$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  ver=$(grep -E "^__version__" PyInstaller/__init__.py | sed -re "s|.* = '(.*)'$|\1|g")
  echo "${ver//-/_}.${commit}"
}

build() {
  cd "$srcdir/$_pkgname" || exit
  rm -rvf PyInstaller/bootloader/Darwin*
  rm -rvf PyInstaller/bootloader/Windows*
  [ "$CARCH" != "i686" ] && rm -rvf PyInstaller/bootloader/Linux-32bit*
  (
    cd bootloader || exit
    python ./waf all
  )
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 "COPYING.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 "README.rst" -t "$pkgdir/usr/share/doc/$pkgname/"
}
