# Maintainer: Maiko Tan <maiko.tan.coding@gmail.com>
pkgname=xc-git
_pkgname=xc
pkgver=0.8.6.r4.a1fec24f # will be set automatically
pkgrel=1
pkgdesc="Markdown defined task runner (latest git)."
arch=('x86_64')
url="https://github.com/joerdav/xc"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('xc')
conflicts=('xc' 'xc-bin')
source=("git+https://github.com/joerdav/xc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/xc"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/xc"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o xc ./cmd/xc
}

package() {
  install -Dm755 "$srcdir/xc/xc" "$pkgdir/usr/bin/xc"
  install -Dm644 "$srcdir/xc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
