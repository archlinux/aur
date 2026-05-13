# Maintainer: EIonTusk <eiontusk@github.com>
pkgname=hyprlang2lua
pkgver=0.1.0
pkgrel=1
pkgdesc='Convert legacy Hyprland hyprlang (.conf) configuration to the Hyprland 0.55+ Lua format'
arch=('x86_64' 'aarch64')
url='https://github.com/EIonTusk/hyprlang2lua'
license=('MIT')
depends=('glibc')
makedepends=('go')
checkdepends=('lua')  # luac -p drives the golden-file syntax gate; tests still pass without it
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d7bffb35813e251f97bec30d9ab4a8a74e6a03407612e41891632fa711dc986')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  # -trimpath strips build host paths from the binary; -mod=readonly forbids
  # implicit go.mod edits during build; -modcacherw lets makepkg clean up
  # the module cache without permission errors.
  export GOFLAGS='-trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath"
  go build -ldflags='-s -w -linkmode external -extldflags "$LDFLAGS"' \
    -o build/hyprlang2lua ./cmd/hyprlang2lua
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/hyprlang2lua "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md          "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
