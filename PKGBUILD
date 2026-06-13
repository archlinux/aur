# Maintainer: Biggs <biggs at sergeantbiggs dot net>
pkgname=koffan
_pkgname=Koffan
pkgver=2.11.0
pkgrel=1
pkgdesc='Free self-hosted groceries list for families and shared households'
arch=('x86_64')
url="https://github.com/PanSalut/Koffan"
license=('LicenseRef-MIT-with-commons-clause')
makedepends=('go')
backup=("etc/${pkgname}/${pkgname}.env")
source=("https://github.com/PanSalut/Koffan/archive/refs/tags/v${pkgver}.zip"
        "${pkgname}.sysusers"
        "${pkgname}.service"
        "${pkgname}.tmpfiles"
        "${pkgname}.env")

b2sums=('66e8928996912168de6ed0ec26d82b610ce1fe469a809c6f61b70fda369c4cf8c1ba6eac31eae4cebbe56ba81e41269adbefabe19b3e6ca040df17dcd2d71ab8'
        'cd144b523bfdade1364db9680cd6df5a698dc170660c8554b6efc0abc6f70d8fc1a035f3a2a7e33b2693063edab4c4fcabfb3cea3c2d0790b3c3648bc757183d'
        'd13adfaf736616f69a18e2c65a7894319551f5a13ebc3686c45a69c06cfc822027840108f162ea0be44de9ba94f105c442fda4131ac1d33784ae154d92358ee7'
        'facb9f40c2084a2fa9a04647d1b2c87daecd7cde808cf164000b54af32a3b739ea91099489178eb02c34a4a02d21c0d2b3fb71a62e9cbcb979b8500876115e7f'
        'd291fa7fc3be4be24bc1442a1af2b2e5693a3ce436ab82be9f919f1dfdfbbe954a093e75400383c90a8900cefc770ff9a3f0c92e70bd3e445b199ff1d019239a')

prepare(){
    cd "$_pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$_pkgname-$pkgver"
    export GOPATH="${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./...
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 build/shopping-list "$pkgdir"/usr/bin/shopping-list
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm 640 "${srcdir}/${pkgname}.env" "${pkgdir}/etc/${pkgname}/koffan.env"
}
