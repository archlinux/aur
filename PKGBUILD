# Maintainer: shichirouji21 <shichirouji21@users.noreply.github.com>
pkgname=himitsu-bako
pkgver=1.0.0
pkgrel=1
pkgdesc='Encrypted clipboard-backed secret storage using age'
arch=('x86_64')
url='https://github.com/shichirouji21/himitsu-bako'
license=('BSD-2-Clause')
depends=('fzf')
makedepends=('go')
optdepends=('wl-clipboard: Wayland clipboard support'
            'xclip: X11 clipboard support'
            'xsel: alternative X11 clipboard support')
provides=('himitsu-bako')
conflicts=('himitsu-bako-bin' 'himitsu-bako-git')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('99c0aae63c90920ff3624c259b6cb7c1a17fe9eb3cb5c1a6372031a7cd26e5a2')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  export GOFLAGS='-trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/gocache"

  go build -ldflags='-s -w' -o build/himitsu-bako .
}

check() {
  cd "$pkgname-$pkgver"

  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/gocache"

  go vet ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/himitsu-bako "$pkgdir/usr/bin/himitsu-bako"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
