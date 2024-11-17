# Maintainer : envolution

pkgname=codai
pkgver=1.7.2
pkgrel=2
pkgdesc="AI code assistant that helps developers through a session CLI"
arch=("x86_64")
url="https://github.com/meysamhadeli/codai"
license=("Apache-2.0")
install=codai.install
options=(!debug)
makedepends=("go")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/meysamhadeli/codai/archive/refs/tags/v${pkgver}.tar.gz"
  "codai-wrapper.sh"
  "codai.env.sample"
  "config.yml.sample"
  "codai.install"
)
sha256sums=('d439145904026d61eb3ef5e6b832b9ff47a4fa7bbc0550f6a3e84e3e79eb8278'
            '678cfc4e7653b954d33a64118591f8f37568c6b801d541138b7f315cef19d313'
            '0045a2a6c2dfe2b2931d7e3009f32a16fcb6ec55fb6cc46fc98f03fe64a0a26b'
            'c0177646a2285135f7f223d40352cbecc840ac22e7eb776c96de0fc017ccc07f'
            'bb49a7159d9fbdb7e798d7113c6ee783639c86c2482ca0cf45d0b4e01b7488cd')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/codai . 
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  install -Dm755 "codai-wrapper.sh" "$pkgdir/usr/bin/codai"
  install -Dm644 "codai.env.sample" "$pkgdir/usr/share/codai/codai.env.sample"
  install -Dm644 "config.yml.sample" "$pkgdir/usr/share/codai/codai-config.yml.sample"
  cd "$pkgname-$pkgver"
  install -Dm755 "build/codai" "$pkgdir/usr/bin/codai-bin"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim: ts=2 sw=2 et:
