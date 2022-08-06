# Maintainer: txyyh <zjh330726@gmail.com>

pkgname=clash-meta-alpha-git
_pkgname=Clash.Meta
pkgver=Prerelease.Alpha.r0.g2899a12
pkgrel=1
pkgdesc="A rule-based tunnel in Go"
arch=('x86_64')
url="https://github.com/MetaCubeX/Clash.Meta"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=('clash' 'clash-dev')
conflicts=('clash' 'clash-dev')
backup=("etc/clash/config.yaml")
options=('!lto')
source=("git+${url}.git#branch=Alpha"
        "config.yaml"
        "clash.service"
        "clash@.service")
sha256sums=('SKIP'
            'c4af03523b8006d206440163406ee9b4de1a10bb5023fb3194490b8225a5e481'
            'e7370a0c60147839d923a61189968a0e781857d036c9e0751b16ddce1fb61b0c'
            '3ba4a71955e8f4676eda68e7c5a1d9c02ad9d8e9fd4bbf8f35487bdc768290ef')

pkgver() {
    cd "${srcdir}"/"${_pkgname}"/
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"/"${_pkgname}"/
    make linux-amd64
}

package() {
    cd "${srcdir}"/"${_pkgname}"/
    mv bin/Clash.Meta-linux-amd64 bin/clash
    install -Dm 755 bin/clash -t "${pkgdir}"/usr/bin/
    install -Dm 644 "${srcdir}"/config.yaml -t "${pkgdir}"/etc/clash/
    install -Dm 644 "${srcdir}"/clash.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 "${srcdir}"/clash@.service -t "${pkgdir}"/usr/lib/systemd/system/
}
