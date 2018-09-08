# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=wmuc
pkgver=0.3.0
pkgrel=1
pkgdesc="A git repository manager."
arch=(x86_64)
url="https://github.com/mfinelli/wmuc"
license=(GPL3)
makedepends=(go dep)
source=(https://github.com/mfinelli/wmuc/releases/download/v$pkgver/wmuc-v$pkgver.tar.gz{,.asc}
        https://github.com/mfinelli/wmuc/releases/download/v$pkgver/third-party.tar.gz{,.asc})
sha256sums=('193ad62691a53be3450fb186247b53cb76b6aff1f1a8ee2a12168a70c124aeb6'
            'SKIP'
            '4b4945819540c0d641b9d8704245df82952fee1e61c5d0af7a6b668fba26248f'
            'SKIP')
validpgpkeys=(C3CD75B002978A8468CA7B1F6C3ADDDE36FDA306)
noextract=("$pkgname-v$pkgver.tar.gz")

prepare() {
  export GOPATH="$srcdir"
  mkdir -p src/github.com/mfinelli/$pkgname

  bsdtar -xf "$pkgname-v$pkgver.tar.gz" \
    -C src/github.com/mfinelli/$pkgname
  mv vendor src/github.com/mfinelli/$pkgname/
}

check() {
  export GOPATH="$srcdir"
  cd src/github.com/mfinelli/$pkgname
  make test
}

build() {
  export GOPATH="$srcdir"
  cd src/github.com/mfinelli/$pkgname
  make legal/third_party.go # makefile error
  make
}

package() {
  cd src/github.com/mfinelli/$pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
