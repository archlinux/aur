# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=ravro_dcrpt-git
pkgver=r101.7a20746
pkgrel=1
pkgdesc="Decrypt secret report files ravro"
arch=('any')
url="https://github.com/ravro-ir/ravro_dcrpt"
license=('unknown')
depends=('wkhtmltopdf')
makedepends=('go' 'git')
source=("git+${url}.git")
provides=('ravro_dcrpt')
conflicts=('ravro_dcrpt')
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${pkgname/-git/}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${pkgname/-git/}"
  mkdir -p build/
}

build() {
  cd "${pkgname/-git/}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "${pkgname/-git/}"
  install -Dm755 build/${pkgname/-git/} "$pkgdir"/usr/bin/${pkgname/-git/}
}
