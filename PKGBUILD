# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname='tlm'
pkgdesc='Local CLI Copilot, powered by Ollama. '
pkgver='1.2'
pkgrel='1'
arch=('x86_64')
url='https://github.com/yusufcanb/tlm'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama required, can be on another machine.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yusufcanb/tlm/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('cdda98e357b692c8ded58b107d1ca2c13be0b65d91d22069fbfeac7bb11b2afe888d4a6b2d024a0e5b4119c424fce868548049c3dd4d5a6ba6f4896b1072743b')

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
  go build -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
