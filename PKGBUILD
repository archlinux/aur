# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-kratos'
pkgver=1.0.0
pkgrel=1
pkgdesc='Ory Kratos identity server written in Go'
arch=('x86_64')
url='https://github.com/ory/kratos'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ory/kratos/archive/refs/tags/v${pkgver}.tar.gz"
  'ory-kratos.service'
  'ory-kratos@.service'
  'ory-kratos.sysusers'
)
b2sums=(
  'b0c7e66ba377e3949aa4c42bf7e7ae0dd757279ab307cf736b0e650b5f3a9a2cb2b5355a73d0759eb847fea81c9b2c2bc4445ff5e55a5297e59141fff83bba7d'
  '47cdf1267cfcb91c4c03f5ee88e3d971c893b6f21e6e46db3b415b56047df9b31ee55b3c41fd28eca1e9ff456d8c18ef6c85f4385bc85506e903268a6c1d3421'
  'c8f344d7a3a669a74e321828a2e0187d9b14bea4a035559776cede8f4aff8523669f3d4bf07e2393be71b84e9578c7f555d1d8fdd06a0ce1377626879ad33caf'
  '7b4b96566de1d375990c1ef5e4248fd04010641d8790c5579ffbc6d1bc2740b5b34012dd8c763ce59cea42526eaa63f979537ab91e85b87e0cf0411c3590e266'
)
backup=(
  'etc/ory/kratos/config.yaml'
  'etc/ory/kratos/identity-schema.json'
)

build() {
    cd "kratos-${pkgver}"
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

    cd "kratos-${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 contrib/quickstart/kratos/email-password/kratos.yml "${pkgdir}/etc/ory/kratos/config.yaml"
    install -Dm 644 contrib/quickstart/kratos/email-password/identity.schema.json "${pkgdir}/etc/ory/kratos/identity-schema.json"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
