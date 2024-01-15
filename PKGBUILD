# Maintainer: Peltoche <pierre.peltier@protonmail.com>
pkgname=duckcloud
pkgver=24.01.1
pkgrel=1
epoch=1
pkgdesc="A cloud for your family"
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://duckcloud.co
license=(AGPL3)
depends=(glibc)
makedepends=(go openssl)
optdepends=()
backup=(etc/duckcloud)
install=duckcloud.install

source=(https://github.com/theduckcompany/duckcloud/archive/refs/tags/${pkgver}.tar.gz
      ${pkgname}.service
      ${pkgname}.sysusers
      ${pkgname}.tmpfiles
      LICENSE)

sha256sums=('37cee01bc182e0f7e6d374fc6c66409ffcb30f424639a5ac717eb210453f6b07'
            '33a7e3d8a674265eda550cde98d0a7fb63ad77fbdc3c4377e0e17edc2eff689e'
            'ca526231ca260be83df4dfb5cc3d7400e82a35e3f164b9799c63be9d4b1bcead'
            '8ee8d3bf748a986fdd040e56c208742045df91837de3e250d5148e0b3fd65692'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')

prepare() {
  cd ${pkgname}-${pkgver}
  go mod vendor
}

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -v \
    -ldflags "-linkmode external \
    -X github.com/theduckcompany/duckcloud/internal/tools/buildinfosj.Version=${pkgver} \
    -X github.com/theduckcompany/duckcloud/internal/tools/buildinfos.BuildTime=$(date --utc -Iseconds)" \
    -o ${pkgname} ./cmd/duckcloud
}

package() {
  install -Dm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm700 -d "${pkgdir}/etc/duckcloud"
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}

