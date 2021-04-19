# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=dendrite
pkgver=0.3.11
pkgrel=2
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
sha256sums=('e473fa629af175ff0dda29ad93c9d7c1a3f35d216b2df6b19aab978856e58e4a'
            '6a322c0fe6accc645b51dc0e7ebff1f7fae263b420a7dcd9eec0ddb936155b76'
            'aba328d7a7244e82f866f9d0ead0a53e79e1590b9c449ad6d18ff2659cb5e035'
            '7d3b8e046581c70857d452eb6569ea239989c7a47f818c184773b52df8a712dc'
            '562a89c61d4f54a2558024f755497a3a59b1c85e236924131fdf58724ed25f3f')

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
  go build ./cmd/create-account
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
  install -Dm755 ./create-account                      "${pkgdir}/usr/bin/${pkgname}-create-account"
  install -Dm644 "${srcdir}/config-sample.yaml"       "${pkgdir}/etc/dendrite/config-sample.yaml"
  install -Dm644 "${srcdir}/dendrite.service"         "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers"      "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/tmpfiles-${pkgname}.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
