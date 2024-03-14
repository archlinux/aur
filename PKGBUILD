# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname='tlm'
pkgdesc='Local CLI Copilot, powered by CodeLLaMa.'
pkgver='1.1'
pkgrel='1'
arch=('x86_64')
url='https://github.com/yusufcanb/tlm'
license=('Apache-2.0')
depends=('ollama' 'glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yusufcanb/tlm/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('fde1d7f1213895aea8730d4f2903950b89330b059aa0bdf8ca2aa581c3f72051167b51562c6f36cc16f314cb9ecc209b130a71a051cdb338d4057651aa9b0156')

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
