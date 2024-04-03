# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-keto'
pkgver=0.13.0_alpha.0
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
  'caca7068faa7ba53a691ad07576df12aa3da87709a47848a72f8e08b52db387441fec78987f28db67641e7370bc99cec0b453afb9a1e9e4505a19f5af5971b22'
  '63a37f70e159ea9827c2b4f65a751bac62f24dd176e19c31f4fd06bff9f44e886afc6939a2a583c7395569799f576f2f40f205dbff41b42ca7a1316da4ee37b6'
  '360a7f2f615fe7bc62996b8382a8f3b8ffeb8fd53c40a399cd2ac0672780c48af1f0fbfba040a085a56cbd46822ca190280164fd42b362a91da6eab9f32d77df'
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
