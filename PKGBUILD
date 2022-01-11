# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hexokinase-git
pkgver=r44.11fc3ef
pkgrel=2
pkgdesc="Fast text scraper for converting colors into hex values"
arch=('x86_64')
url="https://github.com/rrethy/hexokinase"
license=('MIT')
depends=('glibc')
optdepends=('vim-hexokinase: companion vim plugin')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	go mod tidy
	go mod verify
}

build() {
  cd "$pkgname"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  cd "$pkgname"
  install -D hexokinase -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
