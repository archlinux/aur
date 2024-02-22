# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-kratos'
pkgver=1.0.0
pkgrel=2
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
  '37f8bfda3017506980a1ae6da600d03a8c6a8d8745d21500941f87daebdb22b260e9111f173324502418a500ccfee8573ebccb240380cfa45f9e5e99f0021233'
  'cdeacf5339a48874878088985f1309d12ef101add31a1e5457a4960bd3e8f108e7fa0f3d9dc7a9945be81b71f7b667e651072ecdcba14a6c641981d43b0af96a'
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
