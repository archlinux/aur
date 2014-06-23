# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=python2-requests-git
pkgver=v2.3.0.41.gfcb735f
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Python HTTP for Humans."
url="http://python-requests.org"
conflicts=('python2-requests')
makedepends=('git' 'python2-distribute')
optdepends=('python2-certifi: SSL support'
            'python2-grequests: asynchronous requests with gevent'
            'python2-simplejson')
depends=('python2')
provides=('python2-requests')
license=('custom: ISC')
arch=('any')

source=('requests::git+https://github.com/kennethreitz/requests.git'
         certs.patch
)
sha256sums=('SKIP'
            '482fc40ba146d2200771a690b3bedf6eddc9c3224d6f7b5ba529124039b07246'
)

pkgver() {
  cd "$srcdir"/requests
  git describe --tags | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir"/requests

  patch -p0 -i "$srcdir/certs.patch"
  find -type f -exec sed -i '1 s|python$|python2|' {} +
  sed -r 's#(\W|^)requests/cacert\.pem(\W|$)##' -i MANIFEST.in
  rm -f requests/cacert.pem

}

build(){
  cd "$srcdir"/requests
  python2 setup.py build
}

check() {
  cd "$srcdir"/requests
  test -f "$(python2 -m requests.certs)"
}

package() {
  cd "$srcdir"/requests
  python2 setup.py install --root="$pkgdir"
  install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:
