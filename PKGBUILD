# Maintainer: Mekyt <hello at mek dot yt>

pkgname='zelus'
pkgver=1.1.1
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
  '2423bae9e5da8d1bfaaf1b4b15bbd8ad958a85ecb409eb101d8e7850554b68f6d2a475b59c4cd9d35d83f06df2ee24ea37098038ac3230aa5afd78a82df4efef'
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
