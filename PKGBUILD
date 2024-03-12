# Maintainer: Mekyt <hello at mek dot yt>

pkgname='zelus'
pkgver=1.1.0
pkgrel=1
pkgdesc='Ory Kratos user interface written in Go'
arch=('x86_64')
url='https://git.sr.ht/~mekyt/zelus'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=(
  "${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~mekyt/zelus/archive/v${pkgver}.tar.gz"
  'zelus.sysusers'
)
b2sums=(
  'ae53d850a821a313c7925af34f1af8569deb9e8b7504ab798714b20dafa865bed0422584e8fade4c793ebda077dc0c3633ae43b7b62dc2d9057b00d593647af4'
  'c0adb51100668292e4fa192417232fa5fe396a1b929618fc50191b4c24aeee177476f904d9c3e30a7a98494890feb7cb6a6220b9297a05a6d260a8900c18d5e3'
)
backup=('etc/zelus/config.env')

build() {
    cd "${pkgname}-v${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

    go build
}

package() {
    install -Dm 644 zelus.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "${pkgname}-v${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 .env.default "${pkgdir}/etc/${pkgname}/config.env"
    install -Dm 644 systems/zelus.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 systems/zelus@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
