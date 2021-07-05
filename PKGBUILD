# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=age-git
pkgver=1.0.0.rc.3.r1.g4ea591b
pkgrel=1
pkgdesc="A simple, modern and secure file encryption tool"
url="https://github.com/FiloSottile/age"
license=('BSD')
provides=('age')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

prepare(){
  cd "${pkgname%-git}"
  mkdir -p build/
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
    -o build ./...
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  install -Dm755 "${pkgname%-git}/build/age" "$pkgdir/usr/bin/age"
  install -Dm755 "${pkgname%-git}/build/age-keygen" "$pkgdir/usr/bin/age-keygen"
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 "${pkgname%-git}/doc/age.1" "$pkgdir/usr/share/man/man1/age.1"
  install -Dm644 "${pkgname%-git}/doc/age-keygen.1" "$pkgdir/usr/share/man/man1/age-keygen.1"
}
