# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=jhuckaby
pkgname=performa
pkgver=1.1.4
pkgrel=1
pkgdesc="A multi-server monitoring system"

url="https://github.com/${pkgauthor}/${pkgname}"

arch=('any')
license=('MIT')

depends=('bash' 'zsh' 'nodejs' 'python')
makedepends=('npm')

install="$pkgname.install"

backup=("opt/${pkgname}/conf/config.json"
        "usr/lib/systemd/system/${pkgname}.service")

source=("https://github.com/${pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('4028bf67371e69fe49adb4169c10443942e07d28a40e74234c14f24037fadca0'
            '6d17185565ce6015abf2fb976cf1bfc407ab605f48c3c5280e44cf05159a3f23')

provides=("${pkgname}")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm install
    node bin/build.js dist
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a ./* "${pkgdir}/opt/${pkgname}/"

    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "LICENSE.md"

    rm -rf "${pkgdir}/opt/${pkgname}/.git"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
