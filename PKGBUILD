# Maintainer: nealinux <vimlinux@proton.me>
# Contributor: Tenshi65535 <wu.junyu.aur@outlook.com>
# Contributor: ston <2424284164@qq.com>
pkgname=go-musicfox
pkgver=4.8.1
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64' 'aarch64')
provides=('musicfox')
conflicts=('go-musicfox-bin' 'musicfox')
depends=('flac' 'alsa-lib')
makedepends=('gcc-objc' 'go')
pkgsrcdir=${pkgname}-${pkgver}
source=("go-musicfox-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30c8759de23f37e59a7c5beec02e9d2bf4f6004bd72482cb2f25e434e651ca08')

build() {
    echo ${pkgsrcdir}
    cd ${pkgsrcdir}
    export GOPROXY="https://goproxy.cn,direct"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH=${srcdir}
    go build -o ../musicfox -ldflags "-s -w \
       -X 'github.com/go-musicfox/go-musicfox/internal/types.AppVersion=v${pkgver}'" cmd/musicfox.go
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/musicfox" "${pkgdir}/usr/bin/musicfox"
    install -Dm644 "${srcdir}/go-musicfox-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/go-musicfox-${pkgver}/utils/filex/embed/config.toml" "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/go-musicfox-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
