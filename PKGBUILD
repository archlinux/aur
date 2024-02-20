# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-oathkeeper'
pkgver=0.40.6
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
  '33332b7c10854e5490da941c1de6b60ef9fad3fb87a7df7000b9759678a21e32305260e451b9c58bd277e0a2394e58e476a8f1c666a2a706cfcee5679997e9fb'
  '2da6632b323dd99b92286e2374f6f5776c0053c3164fff3a8b7cecfb53fe7e36c7adb4c80485b554f8a6ab62c610261598d9e9f7f4955fda4dea4607a404224b'
  'caab99a71d92687dce5538ae9bb6e14d8b54b10b0d0769b8f02f5aa5090a60ea70090d6b6aff71dd23b82ef133295703c12b8d9654f39c062500c2221ee9e29f'
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
