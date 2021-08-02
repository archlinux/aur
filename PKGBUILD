# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller-hooks-contrib
_pkgname=pyinstaller-hooks-contrib
pkgver=2021.2
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('GPL' 'APACHE')
depends=('towncrier' 'python-setuptools' 'python-wheel' 'twine' 'git')
source=("git+https://github.com/pyinstaller/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  ver=$(curl -fSsL "https://api.github.com/repos/pyinstaller/$_pkgname/releases/latest" | grep -oP "tag_name.*$" |
    head -n1 |
    sed -re 's|^tag_name": "(.*)",$|\1|g')
  echo "${ver#v}"
}

build() {
  cd "$srcdir/$_pkgname" || exit
  git checkout "v$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
