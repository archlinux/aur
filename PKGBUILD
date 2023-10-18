# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=rarbg-selfhosted
pkgver=0.0.5
pkgrel=3
pkgdesc='A self-hosted Torznab API for the RARBG backup, compatible with Prowlarr, Radarr, Sonarr etc.'
arch=('x86_64')
url='https://github.com/mgdigital/rarbg-selfhosted'
license=('BSD')
makedepends=(go)
options=(!lto)
source=(
  rarbg-selfhosted-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  rarbg-selfhosted.service
  )
sha256sums=('6aa61545d50dd301104bd52fefe458bff7dece0339dec6d2e1b15419b823e318'
            'b93a74382119cb82cd06973954e31fa6fe6ae33c07ae9d941d14941654309ce5')

install=rarbg-selfhosted.install

prepare(){
    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}"
    go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode external -extldflags $LDFLAGS" \
    -o $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 trackers.txt -t "${pkgdir}"/usr/share/${pkgname}
  install -Dm644 ../rarbg-selfhosted.service -t "$pkgdir"/usr/lib/systemd/system/
}

