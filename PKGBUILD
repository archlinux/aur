# Maintainer : envolution

pkgname=codai
pkgver=1.7.1
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
sha256sums=('1e73fe8072fcdabb4a683f8182473d190082ff560014f9baafdcb1a00a5601e2'
            '678cfc4e7653b954d33a64118591f8f37568c6b801d541138b7f315cef19d313'
            '0045a2a6c2dfe2b2931d7e3009f32a16fcb6ec55fb6cc46fc98f03fe64a0a26b'
            'c0177646a2285135f7f223d40352cbecc840ac22e7eb776c96de0fc017ccc07f'
            '5abf1acb4c09aa88a51ba5062ca9e0c3795edb4f5e990293f0e4e81e5de9bfca')

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
  install -Dm644 "config.yml.sample" "$pkgdir/usr/share/codai/config.yaml.sample"
  cd "$pkgname-$pkgver"
  install -Dm755 "build/codai" "$pkgdir/usr/bin/codai-bin"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim: ts=2 sw=2 et:
