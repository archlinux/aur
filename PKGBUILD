# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-gcat-git
pkgver=r61.f88aa8f
pkgrel=1
pkgdesc="Interacting with Google Drive spreadsheets from python or the command-line"
arch=('any')
url="https://github.com/embr/gcat"
license=('custom')
depends=('python2-yaml' 'python2-google-api-python-client' 'python2-pandas')
makedepends=('git')
source=($pkgname::git+https://github.com/embr/gcat.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  # this is included in python2-google-api-python-client
  sed -i "/oauth2client/d" setup.py
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1

  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; \
      print get_python_lib()"`
  install -Dm755 gcat/__init__.py "$pkgdir/$pydir/gcat/__init__.py"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg follow the steps at https://developers.google.com/drive/quickstart-python
} 
