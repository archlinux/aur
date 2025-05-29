pkgname=markdump
pkgver=0.4.2
pkgrel=1
pkgdesc="Serves a dump of markdown files via web."
arch=('x86_64')
url="https://github.com/wansing/$pkgname"
license=('GPL')
depends=('glibc')
makedepends=('go')
backup=('etc/markdump/markdump.conf')
source=(
	"$url/archive/v$pkgver.tar.gz"
	"markdump.conf"
	"markdump.service"
	"markdump.sysusers"
	"markdump.tmpfiles"
)
sha256sums=('4a2ca9a4ca3835686632469d3f7cb6d0926a8bf446559080a3fe483add9ffa5f'
            'f3d8d16bda8ae68cb22f0a1a0f5b313dee7046b8958cc37b1d7f3b01e2c5416f'
            '7c0dd5c962bdaeb3d1514bd0eaaaf6e4490e0df631d8acbf8c9cceae9a41f7a3'
            '527a83a17234a02eeb422c8dade89efe200e3036219604692d725a3fdae7ce1b'
            '6af79d20e90026ac2d82a36e5c9eeb0d738e8839aee51705d129810ccde3ed01')

prepare(){
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
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "../markdump.conf" "${pkgdir}/etc/markdump/markdump.conf"
  install -Dm644 "../markdump.service" "${pkgdir}/usr/lib/systemd/system/markdump.service"
  install -Dm644 "../markdump.sysusers" "${pkgdir}/usr/lib/sysusers.d/markdump.conf"
  install -Dm644 "../markdump.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/markdump.conf"
}
