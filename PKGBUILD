# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: fortea

pkgname=apx
pkgver=2.3.0
pkgrel=1
pkgdesc='Package manager with support for multiple sources'
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/apx'
license=(GPL3)
depends=(
  distrobox
  glibc
)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d3a60e8032f74aa110f9d284d55668cf04f489ef9f3bebe18a88612a88279ac1752fed91e02f704058111f4dd2a6c4a90a1b511805d810d0f85174a38638b67c')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
  sed -i 's|share/apx|bin|' config/apx.json
  sed -i 's|bin/distrobox|bin|' config/apx.json
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build

  for shell in bash fish zsh; do
    ./build/apx completion $shell >build/$pkgname.$shell
  done
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # config
  install -Dm644 "config/apx.json" "$pkgdir/etc/apx/apx.json"

  # man pages
  install -Dm644 man/man1/apx.1 "$pkgdir/usr/share/man/man1/apx.1"

  # completions
  install -Dm644 build/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 build/$pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 build/$pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
