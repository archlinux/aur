# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=python2-requests-git
pkgver=v2.21.0.16.gc9309e4c
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Python HTTP for Humans."
url="http://python-requests.org"
conflicts=('python2-requests')
makedepends=('git' 'python2-distribute' 'python2-chardet' 'python2-idna' 'python2-urllib3' 'python2-certifi' 'python2-pyopenssl' 'python2-cryptography')
depends=('python2' 'python2-chardet' 'python2-idna' 'python2-urllib3' 'python2-certifi' 'python2-pyopenssl' 'python2-cryptography')
provides=('python2-requests')
license=('custom: ISC')
arch=('any')

source=('requests::git+https://github.com/kennethreitz/requests.git'
         certs.patch
)
sha256sums=('SKIP'
            '7e4d8c39b47c338630583d88d9da9c1a91891e6339f61ad5567f3cffe5128d24')

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
