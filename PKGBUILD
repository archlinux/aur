# Maintainer: MrBlumi
# Contributor: Giovanni Bottaro <aur@mybotti.eu>

pkgname=('ocis')
pkgver=8.2.0
pkgrel=1
pkgdesc="A file sync & share platform designed to scale"
arch=('aarch64' 'x86_64')
url="https://github.com/owncloud/ocis"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'pnpm')
backup=('etc/ocis.env')

source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "go.mk.patch"
        "Makefile.patch"
        "ocis.env"
        "ocis.service"
        "ocis.sysusers"
        "ocis.tmpfiles")

sha512sums=('0b7c0fa04d9f1c9a4fad4b74f6b85834dbd2ff2aad592e700bfb5f2c4f8251465ba88a478d89a0be78ed00cc3f88c8425a1eaec551ee7077b1009190ecbec5f1'
            'da70b77bf25c87d75f1a662d00a339f9b8756e6f8e33e17dcc0663d2dcd7d4981720a93fe1ba6c788d8a5e7f484f8e292e59273793106d496955c5a670862318'
            '31f2590b1017daba53485d55ae35a3d9dd1b6550b88e786e149cadb1e5a884998a76e40ad1bc4644519bc6eb3ea48086a1c7d3cc320c7d389c5b78f7aaf9fc22'
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

    export VERSION="${pkgver}"

    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    export GOHOSTOS="$(go env GOHOSTOS)"
    export GOHOSTARCH="$(go env GOHOSTARCH)"
    export GOHOSTARM="$(go env GOHOSTARM)"

    make ci-node-generate
    make ci-go-generate build
}

package() {
    install -vDm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -vdm750 "${pkgdir}/etc/${pkgname}"
    install -vDm644 "${srcdir}/${pkgname}.env" -t "${pkgdir}/etc"

    install -vDm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -vDm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
