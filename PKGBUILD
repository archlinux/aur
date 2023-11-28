# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

_pkgname='xmpp-dns'
pkgname="${_pkgname}-git"
pkgver=0.3.7.r2.gcbb332b
pkgrel=2
pkgdesc='Command-line tool to check XMPP SRV records (built from latest git commit)'
arch=('x86_64' 'aarch64')
url='https://salsa.debian.org/mdosch/xmpp-dns'
license=('BSD')
provides=('xmpp-dns')
conflicts=('xmpp-dns')
depends=('glibc')
makedepends=('git' 'go')
source=('git+https://salsa.debian.org/mdosch/xmpp-dns.git')
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$_pkgname"

  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external" \
    -mod=readonly -modcacherw \
    -o build
}

check() {
  cd "$_pkgname"

  go test
}

package() {
  cd "$_pkgname"

  install -Dm0755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 "$srcdir/$_pkgname/man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
