# Maintainer: agony <27015 at riseup dot net>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=centrifugo
pkgver=6.10.3
pkgrel=1
pkgdesc='Scalable real-time messaging server'
arch=('x86_64' 'aarch64')
url='https://github.com/centrifugal/centrifugo'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
install=centrifugo.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'centrifugo.service'
        'centrifugo.sysusers'
        'centrifugo.tmpfiles')
sha256sums=('842d22b53c2c77dd2bad4009a05b78b501afa48c87940cde25403ee03bf7326a'
            'f61eeb35bfa248be947b0da434bf82815d2a0396f10933e4aadac06a73462f9c'
            'dd656417db47b6dd5260a8a6b1f82005c80b6555ac65dd375a95e3aa5168e728'
            '3a4a5123db7293dc103187f406a168214ced95bda0c4f6c0f06508cf262a9718')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X github.com/centrifugal/centrifugo/v6/internal/build.Version=${pkgver}" -o centrifugo .
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  local packages
  mapfile -t packages < <(bash misc/scripts/test_packages.sh unit)
  go test "${packages[@]}"
}

package() {
  install -dm755 "${pkgdir}/etc/centrifugo"
  install -Dm644 centrifugo.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 centrifugo.sysusers "${pkgdir}/usr/lib/sysusers.d/centrifugo.conf"
  install -Dm644 centrifugo.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/centrifugo.conf"
  install -Dm755 "${pkgname}-${pkgver}/centrifugo" -t "${pkgdir}/usr/bin"
}
