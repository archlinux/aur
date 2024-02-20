# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-keto'
pkgver=0.12.0_alpha.0
pkgrel=1
pkgdesc='Ory Keto Global Authorization System written in Go'
arch=('x86_64')
url='https://github.com/ory/keto'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=(
  "${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/ory/keto/archive/refs/tags/v${pkgver//_/-}.tar.gz"
  'ory-keto.service'
  'ory-keto@.service'
  'ory-keto.sysusers'
)
b2sums=(
  '65098bea4f2c87699ca2480eac793a0a10b7eff3dbdb90361c80c6985c564560b871d46e8e3f1191a302b9728ac6e7940c86486f49fec78db082e4785c8b9335'
  'a4cb78d7fec5a3432c98b654956e607f08a0dfc5fc59a852177dc1305dbf8f322e4dea6da28caf6ddb652a6f0d838be1a0655f8f8e6922b4afbd0e35fbe8f57a'
  '7db66950add76f1697347376ad9106a17043f890fd11eb56f12fd6d5aae8cebe87ee557ab6c4ba3e2df7bbd9c08db2cfda40d3f4dc190939b44184631a54490d'
  'af4e0abd13212d81f32ad76b3d169248155af0a4bbe20cdaa8ca7a91c6b268a435275866a1a3c1be9de8e67dd2a3d029248b7a246172e8c9a035eebd1efe23c1'
)
backup=('etc/ory/keto/config.yaml')

build() {
    cd "keto-${pkgver//_/-}"
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

    cd "keto-${pkgver//_/-}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 config/keto.yml "${pkgdir}/etc/ory/keto/config.yaml"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
