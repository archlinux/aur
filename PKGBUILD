# Maintainer: nealinux <vimlinux@proton.me>
# Contributor: Tenshi65535 <wu.junyu.aur@outlook.com>
# Contributor: ston <2424284164@qq.com>
pkgname=go-musicfox
pkgver=4.5.7
pkgrel=2
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
provides=('musicfox')
conflicts=('go-musicfox-bin' 'musicfox')
depends=('flac' 'alsa-lib')
makedepends=('gcc-objc' 'go')
pkgsrcdir=${pkgname}-${pkgver}
source=("${pkgsrcdir}::git+${url}.git#tag=v${pkgver}"
    "lastfm_auth")
sha256sums=('608b19f8b0c1ef01aa49a3711dff98c757ad4024f1a141522806256289273af6'
    '1798a98fc0b986c690f0dc93b4f475b03f18cc72abf2825cbffcaa78cd869df2')

build() {
    echo ${pkgsrcdir}
    cd ${pkgsrcdir}
    export LASTFM_KEY=$(awk 'NR==1{print $3}' $HOME/.config/go-musicfox/lastfm_auth)
    export LASTFM_SECRET=$(awk 'NR==2{print $3}' $HOME/.config/go-musicfox/lastfm_auth)
    export GOPROXY="https://goproxy.cn,direct"
    go mod download
    make
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/musicfox" "${pkgdir}/usr/bin/musicfox"
    install -Dm644 "${srcdir}/go-musicfox-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/lastfm_auth" "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/go-musicfox-${pkgver}/configs/go-musicfox.ini" "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/go-musicfox-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
