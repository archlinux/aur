# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: fortea

pkgname=apx
pkgver=2.4.3
pkgrel=1
pkgdesc='Package manager with support for multiple sources'
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/apx'
license=(GPL-3.0-only)
depends=(
  distrobox
  glibc
)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d88430d8ac07aa57ec2d3ec13c4a199252cb05634569579974b3ad6111b8fc7a27fee072fb1c7752b3df3838a2d64872fc5be1c64848fe1def7909170ba4ecb4')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
  sed -i 's|share/apx|bin|' config/apx.json
  sed -i 's|bin/distrobox|bin|' config/apx.json
}

build() {
  cd "${pkgname}-${pkgver}"

  go build -o build \
    -ldflags "-s -w -linkmode=external -X main.Version=v$pkgver -extldflags \"$LDFLAGS\""

  for shell in bash fish zsh; do
    ./build/apx completion $shell >build/$pkgname.$shell
  done
}

check() {
  cd "${pkgname}-${pkgver}"

  [[ "$(./build/apx --version)" == "apx version v$pkgver" ]]
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
