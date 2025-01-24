# Contributor: Andreas Baumann <mail@andreasbauman.cc>
pkgname=prodos-utilities-git
_pkgname=ProDOS-Utilities
pkgver=r82.6925946
pkgrel=1
pkgdesc="Tool and Go library to access ProDOS filesystems of the Apple ][ series of computers"
arch=('x86_64')
url="https://github.com/tjboldt/ProDOS-Utilities"
license=('MIT')
depends=()
optdepends=()
makedepends=('go')
source=("${_pkgname}::git+https://github.com/tjboldt/ProDOS-Utilities.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  GOOS=linux GOARCH=amd64 go build -o "$srcdir/$_pkgname/binaries/linux/intel/ProDOS-Utilities"
}

package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir/usr/bin"
  install -Dm775 "$srcdir/$_pkgname/binaries/linux/intel/ProDOS-Utilities" ${pkgdir}/usr/bin/

  install -d -m0755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
