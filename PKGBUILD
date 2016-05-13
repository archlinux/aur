# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=pugdebug-git
_pkgname=pugdebug-git
pkgver=v1.0.0.r20.g00859c3
pkgrel=1
pkgdesc=" pugdebug is a standalone debugging client for PHP applications that uses XDebug as the debugging engine"
arch=('any')
license=('GPL3')
url='http://github.com/neovim/python-client'
depends=('python'
         'pyinstaller'
         'python-virtualenv'
         'python-six')
conflicts=()
provides=('pugdebug')
makedepends=('git')
source=("$pkgname::git://github.com/robertbasic/pugdebug.git"
        "LICENSE::https://raw.githubusercontent.com/robertbasic/pugdebug/master/COPYING")
sha256sums=('SKIP' 'c61f12da7cdad526bdcbed47a4c0a603e60dbbfdaf8b66933cd088e9132c303f')

if [ -n "$VIRTUAL_ENV" ]; then
  echo "Warning: You're building within a virtualenv. Use"
  echo "a shell without virtualenv to build this package!"
  exit 1
fi

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  pwd
  cd "$_pkgname"

  # Patch in missing deps
  echo six   >> requirements.txt
  echo pyqt5 >> requirements.txt

  virtualenv env
  source env/bin/activate
  pip install -r requirements.txt

  bash ./build.sh
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 dist/pugdebug  $pkgdir/usr/bin/pugdebug

}

# vim:set ts=2 sw=2 et:
