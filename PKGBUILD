# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Raghavendra Bhuvan <rage28@googlemail.com>
pkgname=git-user
pkgver=v2.0.6
pkgrel=1
pkgdesc=" Git plugin that allows you to save multiple user profiles and set them as project defaults"
arch=('x86_64')
url="https://github.com/gesquive/${pkgname}.git"
source=("${pkgname}-${pkgver}::${url%.git}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('abf1d8e78c9e9a89555519ec755dfe2516fe9b1e3622ca89692cd6782e0fdc6e')
license=('MIT')
depends=('glibc')
makedepends=('go')

prepare() {
  cd "$pkgname-${pkgver#v}"
  mkdir -p build/
}

build() {
  cd "$pkgname-${pkgver#v}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-${pkgver#v}"
  go test ./...
}

package() {
  cd "$pkgname-${pkgver#v}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
