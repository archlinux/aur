# Maintainer: Kalani Helekunihi <i [at] am [dot] guru>
# Maintainer: devome <evinedeng@hotmail.com>

pkgname=xteve
_reponame="xTeVe"
pkgver=2.2.0.200
pkgrel=3
pkgdesc="M3U Proxy for Plex DVR and Emby Live TV."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://xteve.de"
_url="https://github.com/${pkgname}-project/${_reponame}"
license=('MIT')
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service")
sha256sums=('d17566bc840534f4a1b1223d0d2332ab6b98e8c94f02ce1e941186b7cc67c484'
            '4a72807f2ce7fd28b1d88f728e9aa442928433cb31b16067fd0251786f0ed228'
            '3159b3643846bbe4fa2e59ce1694cdc73abea1e81dc11b271f638a18ddb0782c'
            '93a0d4657ca04679329c8cd52a0bb834c46e8b9ec548a410e2ab9f49e3d1fc7b'
            'b37977d867e54bb4b7ddf2fb3a228f282419e803d8c42a1d7f833037d40d2b52')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    local ldflags=" -s -w -extldflags '${LDFLAGS}'"
    
    cd "${_reponame}-${pkgver}"
    go build -trimpath -ldflags "${ldflags}" -o "${pkgname}"
}

package() {
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    cd "${_reponame}-${pkgver}"
    install -Dm755 "${pkgname}"              "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 *.md                   -t "${pkgdir}/usr/share/doc/${pkgname}"
}
