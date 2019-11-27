# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ddns-updater-git
pkgver=r108.cf55cf7
pkgrel=1
pkgdesc="Lightweight scratch container updating DNS A records periodically for GoDaddy, Namecheap and DuckDNS"
arch=('x86_64')
url="https://github.com/qdm12/ddns-updater"
license=('MIT')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/qdm12/ddns-updater.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  go mod download
}

build() {
  cd "$srcdir/$pkgname"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ddns-updater "$pkgdir/usr/bin/ddns-updater"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

