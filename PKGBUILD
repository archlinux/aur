# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-oathkeeper'
pkgver=0.40.7
pkgrel=1
pkgdesc='Ory Oatheeper identity and access proxy written in Go'
arch=('x86_64')
url='https://github.com/ory/oathkeeper'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ory/oathkeeper/archive/refs/tags/v${pkgver}.tar.gz"
  'ory-oathkeeper.service'
  'ory-oathkeeper@.service'
  'ory-oathkeeper.sysusers'
)
b2sums=(
  '13eeb30f8fdbcfe16692cecb40ec1add0030fac7dc52b681d4d5473b00fa7e7b54509118f34ebbb8d123f2642f33630f956d9a82ba5313d95f5b7188b9724570'
  '985cda21b49b4f3027bc89356ef90df58cd1f62ecc1d45d656bdfe1371983b72d2cac88da638a6947080e56145bc498b6241343ee7ab4be0d77d4e6e72238253'
  'fea3f17f1e16b7a946a57bc85ba14d9a35524c2e44c07905be2ac9bd10a117cdc5ce62bfc4a7cce3441bb7508f23df1525aa4fd1ea701574926c8aa978a0fe4f'
  '28fe1e8aceb95887a18f0d0b2e4c0e37ea6664987639d3777e8d30c9deff8e712a9a46c823c04e3a21afe5f3459eef71f433b1d0a226529317b57df60360cc6d'
)
backup=('etc/ory/oathkeeper/config.yaml')

build() {
    cd "oathkeeper-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

    go build -tags sqlite -o ${pkgname} .
}

package() {
    install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ${pkgname}@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "oathkeeper-${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 internal/config/.oathkeeper.yaml "${pkgdir}/etc/ory/oathkeeper/config.yaml"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
