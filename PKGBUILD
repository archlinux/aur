# Maintainer: lmartinez-mirror
pkgname=frangipanni-git
pkgver=0.5.0.r0.gf7c9a3e
pkgrel=2
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go>=1.15')
provides=('frangipanni')
conflicts=('frangipanni')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  sed -i "s/none/$pkgver/" frangipanni.go
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname"
  go build -o frangipanni frangipanni.go
}

package() {
  cd "$pkgname"
  install -Dm 755 frangipanni -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
