# Maintainer: Harry Youd <harry at youd dot family>
pkgname=threadfin
_reponame=Threadfin
pkgver=1.2.34
pkgrel=1
pkgdesc="M3U Proxy for Plex DVR and Emby Live TV."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
makedepends=("go")
optdepends=('ffmpeg: buffering and transcoding'
            'vlc: buffering and transcoding')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('31f04f5d99d1e2b970e3c8e8d53f1ebf97704c4bd9df834a46960bd5d9bd2393'
            'ebdde77c4a0352bf51d82698d6748a2af1c234ef30b6d959d97a72837f66b039'
            '9a7a0900cd204a8df5a8e97ebef76180525c66233cad37dfb9e1773296a07846'
            '8edf5061f950b1027e0790f19d1e5d7cea8ab347b938fd8d9865412652573319')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    local ldflags=" -s -w -extldflags '${LDFLAGS}'"
    
    cd "${_reponame}-${pkgver}"
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
