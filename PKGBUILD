# Maintainer: Mekyt <hello at mek dot yt>

pkgname='gotrue'
pkgver=2.144.1
pkgrel=1
pkgdesc='A JWT based API for managing users and issuing JWT tokens'
arch=('x86_64')
url='https://github.com/supabase/gotrue'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
  'postgresql: PostgreSQL support'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/supabase/gotrue/archive/refs/tags/v${pkgver}.tar.gz"
  'gotrue.service'
  'gotrue@.service'
  'gotrue.sysusers'
)
b2sums=(
  'b6fc3752847fb0708500c9f7de5e5444d295b3e6d660dfbab4299a1bfea18fd0249771d4f22bf0941043fbc24984936c694f39f39a8644587cf975f2e76eb621'
  '51e1c83f5ba8b57c171ea73f40c1fad24b93554b1783a90eb89443d0aabb81a64ee43c52bdca26dc115213b00ce136583c05f3a1b0c34aca34226dae5ff08ee0'
  '81dc5b451f5cda81ae7ac1bf6bc065a127c0cb5298584249ea98eae9b4af4e19d73b065a7ff6259f1f17f82100d0ebb89ebbfcd2e943e4de1c80ca50a3702b6e'
  '6ff4cd13ee331144066e1ec4267267728484b5cdd19ce3d5411e8650d873971b1ea9f9bdb5027054806f5775223844797d33ba7fef7bf376b5b2adbced12541a'
)
backup=('etc/gotrue/config.env')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

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
