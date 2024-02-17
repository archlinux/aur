# Maintainer: Mekyt <hello at mek dot yt>

pkgname='gotrue'
pkgver=2.142.0
pkgrel=3
pkgdesc='A JWT based API for managing users and issuing JWT tokens'
arch=('x86_64')
url='https://github.com/supabase/gotrue'
license=('MIT')
depends=()
makedepends=('go')
optdepends=(
  'nv: Systemd service support'
  'postgresql: PostgreSQL support'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/supabase/gotrue/archive/refs/tags/v${pkgver}.tar.gz"
  'gotrue.service'
  'gotrue@.service'
  'gotrue.sysusers'
)
b2sums=(
  '796f575ba6a58880685750e037db3073068485041329eef4fdafa794cf6e3d64d8705a52383dfc2952d404e7a6c3c929ac211fba8c6c1b8df82596821cb3ba5e'
  'cf8fc6c42929c2ac6159211f29527cd120798c07e3f4106791dd23c4e574206e4dcd59b3ab2668d97b26d193e0ae5e547972e49a4922bbeed7d6ff0d94136d61'
  'cae008df3137269fdce5a91a6ef8a406c2ec30e8c961e0f0108da90b1caf29bd5585f1e2f0a9a9f2ee37e4a676d0fd2b3188d51e18ef91a6bf1d166193838fcd'
  '6ff4cd13ee331144066e1ec4267267728484b5cdd19ce3d5411e8650d873971b1ea9f9bdb5027054806f5775223844797d33ba7fef7bf376b5b2adbced12541a'
)
backup=('etc/gotrue/config.env')

build() {
    cd "${pkgname}-${pkgver}"
    export GO_ENABLED='0'
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build -ldflags "-X github.com/supabase/auth/internal/utilities.Version=v${pkgver}" -buildvcs=false -o gotrue
}

package() {
    install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ${pkgname}@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 example.env "${pkgdir}/etc/${pkgname}/config.env"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
