# Maintainer: agony <27015 at riseup dot net>

pkgname=tinyice
pkgver=2.12.3
pkgrel=1
pkgdesc='Icecast-compatible streaming server for audio and video'
arch=('x86_64' 'aarch64')
url='https://github.com/DatanoiseTV/tinyice'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'nodejs' 'npm')
install=tinyice.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'tinyice.sysusers'
        'tinyice.tmpfiles')
sha256sums=('f9e25cd1169f5a8351aa4da7d2f12dee293eff5e785be460990c7d1a654f28a1'
            '03ccb8a881692e4b49498999087a717b647620c3ce754ed8168376de2194663d'
            'ce5c426ecc09f9c877320a2293a4b60b1bca0b84ee8242f527ab8f9abb85ab0b')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
  cd server/frontend
  export npm_config_cache="${srcdir}/npm-cache"
  npm ci
}

build() {
  cd "${pkgname}-${pkgver}/server/frontend"
  export npm_config_cache="${srcdir}/npm-cache"
  npm run build
  cd ../..
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X main.Version=v${pkgver}" -o tinyice .
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  install -Dm644 tinyice.sysusers "${pkgdir}/usr/lib/sysusers.d/tinyice.conf"
  install -Dm644 tinyice.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/tinyice.conf"
  cd "${pkgname}-${pkgver}"
  install -Dm755 tinyice -t "${pkgdir}/usr/bin"
  install -Dm644 packaging/tinyice.service -t "${pkgdir}/usr/lib/systemd/system"
}
