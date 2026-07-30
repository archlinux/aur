# Maintainer: EIonTusk <eiontusk@github.com>
pkgname=hyprlang2lua
pkgver=0.7.0
pkgrel=1
pkgdesc='Convert legacy Hyprland hyprlang (.conf) configuration to the Hyprland 0.55+ Lua format'
arch=('x86_64' 'aarch64')
url='https://github.com/EIonTusk/hyprlang2lua'
license=('MIT')
depends=('glibc')
makedepends=('go')
checkdepends=('lua')  # luac -p drives the golden-file syntax gate; tests still pass without it
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('090b7d92825b6329f1bf5cfd40c492e5db283d1330c2cd8db308ffe7c5690b89')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  # cgo is needed for -linkmode=external so makepkg.conf hardening LDFLAGS
  # propagate into the final binary.
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  # -trimpath strips build host paths from the binary; -mod=readonly forbids
  # implicit go.mod edits during build; -modcacherw lets makepkg clean up
  # the module cache without permission errors.
  export GOFLAGS='-trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath"
  go build -ldflags="-s -w -linkmode=external -extldflags \"$LDFLAGS\"" \
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
