# Maintainer: Harry Youd <harry at youd dot family>
pkgname=threadfin
_reponame=Threadfin
pkgver=1.2.16
pkgrel=2
pkgdesc="M3U Proxy for Plex DVR and Emby Live TV."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://xteve.de"
_url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "0001-update-to-go-1-23.patch")
sha256sums=('07d22bb57ce8a062b1e186bbd630cd6804976373b5b1709a6baef7f588d68efc'
            'ebdde77c4a0352bf51d82698d6748a2af1c234ef30b6d959d97a72837f66b039'
            '9a7a0900cd204a8df5a8e97ebef76180525c66233cad37dfb9e1773296a07846'
            '8edf5061f950b1027e0790f19d1e5d7cea8ab347b938fd8d9865412652573319'
            '232586951e762cc44612afd2366fe2e66469b8a9049a193ffd8c8ec76650b546')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    local ldflags=" -s -w -extldflags '${LDFLAGS}'"
    
    cd "${_reponame}-${pkgver}"
    patch -Np1 -i ../0001-update-to-go-1-23.patch
    go mod tidy
    go mod vendor
    go build -trimpath -ldflags "${ldflags}" -o "${pkgname}"
}

package() {
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${_reponame}-${pkgver}"
    install -Dm755 "${pkgname}"              "${pkgdir}/usr/bin/${pkgname}"
}
