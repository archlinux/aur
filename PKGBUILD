# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: fortea

pkgname=apx
pkgver=2.1.1
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
b2sums=('0e03be6488706c1a0ad4d6204dd6a72bf7ca437447c0561ceea88ac2a6330d028a4a8b3997a55a25ef6c489c17d54d17d57f94dcd2584c161894e2f9a431214d')

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
