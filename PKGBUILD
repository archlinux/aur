# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=dendrite
pkgver=0.3.3
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64')
url='https://github.com/matrix-org/dendrite'
license=('Apache')
makedepends=('go')
source=("https://github.com/matrix-org/dendrite/archive/v$pkgver/dendrite-v$pkgver.tar.gz"
        "config-sample.yaml"
        "dendrite.sysusers"
        "tmpfiles-dendrite.conf"
        "dendrite.service")
sha256sums=('d67685a0403d87d5d70cd8380cd7a2462e3724f14d931e9ad5ab45bc976795ef'
            '198f7f29dae00f89314672e64c9f264b5686bb8bcc6314df4ec54795318c07e6'
            'aba328d7a7244e82f866f9d0ead0a53e79e1590b9c449ad6d18ff2659cb5e035'
            'c8305641995461deef4dd84c5886e1cd84a0b2b11451f77d0d48076e8b5b0bfe'
            '5957e293152b982aacb2fbb7f29e889f7d174dd6a718b28ee69a1b1d368ff125')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/dendrite-monolith-server
  go build ./cmd/generate-config
  go build ./cmd/generate-keys
}

check() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go test ./cmd/dendrite-monolith-server
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ./dendrite-monolith-server           "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 ./generate-config                    "${pkgdir}/usr/bin/${pkgname}-generate-config"
  install -Dm755 ./generate-keys                      "${pkgdir}/usr/bin/${pkgname}-generate-keys"
  install -Dm644 "${srcdir}/config-sample.yaml"       "${pkgdir}/etc/dendrite/config-sample.yaml"
  install -Dm644 "${srcdir}/dendrite.service"         "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers"      "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/tmpfiles-${pkgname}.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
