# Maintainer: Sam <dev at samarthj dot com>
# Contributor: xantares
# Contributor: ase1590

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller-git
_pkgname=pyinstaller
pkgver=5.0.dev0.r8021.g0c9c07807
pkgrel=1
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('x86_64' 'i686' 'aarch64' 'ppc64le' 's390x')
url="http://www.pyinstaller.org"
license=('custom:PyInstaller')
depends=('python-altgraph' 'pyinstaller-hooks-contrib')
depends_i686=('lib32-zlib')
makedepends=('cmocka' 'python>=3.6' 'python-setuptools' 'git' 'python-wheel')
optdepends=('python-pycrypto: bytecode encryption support'
  'upx: executable compression support')
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
  export PYTHONHASHSEED=0
  (
    cd bootloader || exit
    python ./waf all
  )
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname" || exit
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$_pkgname/COPYING.txt"
}
