# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller
_pkgname=pyinstaller
pkgver=4.5
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
source=("git+https://github.com/$_pkgname/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  ver=$(curl -fSsL "https://api.github.com/repos/$_pkgname/$_pkgname/releases/latest" | grep -oP "tag_name.*$" |
    head -n1 |
    sed -re 's|^tag_name": "(.*)",$|\1|g')
  echo "${ver#v}"
}

build() {
  cd "$srcdir/$_pkgname" || exit
  git checkout "v$pkgver"
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
