# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=vmango

pkgname=${_pkgname}
pkgver=0.9.1
pkgrel=1
pkgdesc="Your own personal IaaS cloud"
arch=("any")
url="https://github.com/subuk/vmango"
license=("GPL3")

backup=("etc/vmango.conf")

depends=("libvirt" "qemu" "cdrtools")
makedepends=("go-pie" "go-bindata")

source=("${_pkgname}::git+https://github.com/subuk/vmango.git#tag=v${pkgver}"
        "service"
        "sysusers"
        "tmpfiles")
sha512sums=('SKIP'
            '4b729f55f3d90337a9d259df1da383c17d7e5d506701b20c5b5fd4c03f7647988cc93a088921c8c3d6283426b4ab6c3e846997e78a6ab03598993506e7e457ce'
            'de9d454c87fadf9b2cea3ba2acd417a1201abae2d79a58187f0c96d0163ad921a96710b7c24ff9907bfd1d42242abeffbaec9a6cacb1b26c3b76ed219610ab12'
            'd3758ad5c40889eec213b9c73129c81fbbe3ce477b113233e19f89f577e2e743724e69c458cc70c1a2b621d5e29e1420b8f8088228d1ceb1de25d56bf30d9555')


prepare() {
    cd "$srcdir/$_pkgname"

    export GOFLAGS="-mod=vendor"

	go-bindata -o web/assets_generated.go -pkg web static/... templates/...
}

build() {
    cd "$srcdir/$_pkgname"

    export GOFLAGS="-mod=vendor"

    go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X subuk/vmango/web.AppVersion=${pkgver} -extldflags ${LDFLAGS}" \
    .
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm600 -o"vmango" -g"vmango" "vmango.dist.conf" "${pkgdir}/etc/vmango.conf"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    # Install sysusers
    install -Dm644 "${srcdir}/sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"

    # Install tmpfiles
    install -Dm644 "${srcdir}/tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

    # install service
    install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

}
