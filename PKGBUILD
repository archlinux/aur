# Contributor: Lex Black <autumn-wind@web.de>

pkgname=opencloud
pkgver=5.2.0
pkgrel=1
pkgdesc="secure and private way to store, access, and share your files"
url="https://github.com/opencloud-eu/opencloud"
arch=('aarch64' 'x86_64')
license=('Apache-2.0')
#depends=('glibc')
makedepends=('git' 'go' 'pnpm')
optdepends=("opencloud-web: if wanting to use a customized web interface")
install="opencloud.install"
backup=('etc/opencloud/opencloud.env')
source=("git+https://github.com/opencloud-eu/opencloud.git#tag=v${pkgver/_/-}"
        "go.mk.patch"
        "opencloud.env"
        "opencloud.service"
        "opencloud.sysusers"
        "opencloud.tmpfiles")
sha512sums=('e81b4407f19f35e64648611af7cacd0625aeba8c41f706f98ca92bdcfbfd88df76f5cacbbfdfe579480386b6c801c3ddcd604cc4902e28b35ba3cdb27daa9276'
            'da70b77bf25c87d75f1a662d00a339f9b8756e6f8e33e17dcc0663d2dcd7d4981720a93fe1ba6c788d8a5e7f484f8e292e59273793106d496955c5a670862318'
            'a8d58020e085b0027bb27226d05d36eb0c1f52c3813f67a3a69cadbbf51bcff8d1a5341057f7a88d0961e3430b1cc9416f4d25e087d1512f3319fd194804c15e'
            'af6b2e80ebaf130fb3e8f6038580bea4db811499d06f2962604941f75d1f8ef0dd3692bf21e54c0611864c49217c8fa457cb6773775a1aa47c7254330f83ba7f'
            '3fa38aba73ffea0e559cf20af9f12b85321a97b41d48aad5c7cea81e9ab7d35c08d7a495c62e6a9fdf6ac7c494a4926805d89171dca0d822d922902188babed3'
            'e4b8c5bfda8214d6493055c996010b385c3be62a861dbcb3564c68aa03851bb6f23cd269f1b869fe4eeec6396ca9943888628c2a46215a7bd3c02c2a8f000742')


prepare() {
    cd "${pkgname}"
        
    patch .make/go.mk "${srcdir}"/go.mk.patch
}

build() {
    cd ${pkgname}

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make generate
    make -C opencloud build
}

package() {
    install -vDm755 "${pkgname}/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-server"

    install -vDm644 "${pkgname}.env" -t "${pkgdir}/etc/${pkgname}"

    install -vDm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -vDm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
