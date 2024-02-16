# Maintainer: MrBlumi
# Contributor: Giovanni Bottaro <aur@mybotti.eu>

pkgname=('ocis')
pkgver=4.0.6
pkgrel=1
pkgdesc="A file sync & share platform designed to scale"
arch=('aarch64' 'x86_64')
url="https://github.com/owncloud/ocis"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'pnpm')
backup=('etc/ocis.env')

source=("https://github.com/owncloud/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "go.mk.patch"
        "Makefile.patch"
        "ocis.env"
        "ocis.service"
        "ocis.sysusers"
        "ocis.tmpfiles")

sha512sums=('bc6fee9ede164cb7392454eb85098389a2276a83ebb69086c87253256d19f3dfa80bf37a063c34c766320d3bd80ba06aff4b8ac770b95b9505bc273eb1c3e8ac'
            'da70b77bf25c87d75f1a662d00a339f9b8756e6f8e33e17dcc0663d2dcd7d4981720a93fe1ba6c788d8a5e7f484f8e292e59273793106d496955c5a670862318'
            'd884c00b254d51d1991c902d916dc14dbacc2423793f5a5c9cad06bcd09f7ecd10630a9d4e4d12dec5cb224fccba066a051b9348e0ee8388bcd766bc6a1eb883'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
            'bf3a07a265bcaa9e651fa73721af9fe23c1ae02aefb734de11739521838210b60f3388a00f1c25b7fc99b9408148183c62dca1c53ec03dad4bf0c82a1039009e'
            'a205aeaf1136696c5613560a12fa253f050b4944f1fbf2be6ef47e660ffc110a7e9226aa631670487dde66c61556b1147af48427a4831d6a7bbf9333c4b9b1c7'
            'bfe32b2f19afd84bf6d3048ca9aadba758372bf8ec0b73cf6abdcd2e4dfe059c8e84a9db1cc7c0d1a5a88742f2c4445e268abcbc55a479670842cfd945c8d096')


prepare() {
    cd "${pkgname}-${pkgver}"
	
    patch .make/go.mk ${srcdir}/go.mk.patch
    patch services/web/Makefile ${srcdir}/Makefile.patch
}

build() {
    cd "${pkgname}-${pkgver}/${pkgname}"

    export DRONE_TAG="${pkgver}"

    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make ci-node-generate
    make ci-go-generate build
}

package() {
    install -vDm755 "${pkgname}-${pkgver}/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -vdm755 "${pkgdir}/etc/${pkgname}"
    install -vDm750 "${srcdir}/${pkgname}.env" -t "${pkgdir}/etc"

    install -vDm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -vDm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
