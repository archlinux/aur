# Maintainer: Luis Pérez <luis.perez@protonmail.com>
# Contributor: djmattyg007 <internet@matthewgamble.net>

pkgname=doggo
pkgver=0.5.5
pkgrel=1
pkgdesc='Command-line DNS Client for Humans.'
arch=('x86_64')
url="https://github.com/mr-karan/doggo"
license=('GPL')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
conflicts=('doggo-git')
provides=('doggo')
sha256sums=('7ba1340ce46566ca8fa1565ef261519dee5b1c7007aea97eb1f9329f8a3f0403')

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
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/$pkgname -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd/doggo/
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 completions/"${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}"
  install -Dm644 completions/"${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
