# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-hydra'
pkgver=2.2.0
pkgrel=1
pkgdesc='Ory Hydra OpenID Connect and OAuth Provider written in Go'
arch=('x86_64')
url='https://github.com/ory/hydra'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
optdepends=(
  'postgresql: PostgreSQL support'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ory/hydra/archive/refs/tags/v${pkgver}.tar.gz"
  'ory-hydra.service'
  'ory-hydra@.service'
  'ory-hydra.sysusers'
)
b2sums=(
  '4a4a92362123f98829d298c3c87195968fdb7f598ed08ee4932b981eb7cdaf15890f6a274e194d53736390431ea736a5482e0727e5d54d31279b9e8759a84bb0'
  '1b92812c4f065ce7f4e57c7d4708fce32a88264e97f2f03de1724c77e7fd17c559122ad530a97452da2c80ba8f8b6b0a010c1067da347f5c62ab5e6e13687c81'
  '6c1b12d82576f9ca752772fa51ead9915783cb3287be6678e8cab51239b98d415994e6f0639e6c9f5d1f5d0d5e2a0cc8540038cdb936738bb7a35c1d4b82fbf4'
  'c3ecc3967092945a23a553d984523402c2fd9278b0d8388f102203439843927c7bdec824dbcf0cbb950521859cc2ed95ac974eab0b08bc864edc598620715650'
)
backup=('etc/ory/hydra/config.yaml')

build() {
    cd "hydra-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

    sed -i '/ory\/fosite/d' go.mod
    sed -i '/ory\/x/d' go.mod

    go get github.com/ory/fosite@v0.46.0
    go get github.com/ory/x@v0.0.614
    go build -tags sqlite -o ${pkgname} .
}

package() {
    install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ${pkgname}@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "hydra-${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 internal/config/config.yaml "${pkgdir}/etc/ory/hydra/config.yaml"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
