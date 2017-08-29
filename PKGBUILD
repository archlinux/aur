# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=elan
pkgver=4.9.4
pkgrel=1
pkgdesc="A video and audio annotation tool"
arch=(any)
url="https://tla.mpi.nl/tools/tla-tools/elan/"
license=('GPL3')
depends=('java-runtime')
makedepends=('maven')
source=("http://www.mpi.nl/tools/elan/ELAN_$(echo "${pkgver}" | sed 's/\./-/g')_src.zip"
        "elan")
sha256sums=('fd1eee70a10b53f98efe7808c81650ebff175cac774166ff9aaa70e452207101'
            'c933caffc0daf1655ffb91564d234209205d9f49e0006c432d63a97a16f43363')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Yikes, broken SSL certificate upstream
    sed -i 's#https://lux15#http://lux15#' pom.xml
}

build() {
    cd "${pkgname}-${pkgver}"
    mvn package -P !linux -Dmaven.repo.local="${srcdir}/repo"
}

package() {
    cd "${pkgname}-${pkgver}/target"
    install -dm755 "${pkgdir}/usr/share/java/elan"
    install -Dm644 ./*.jar "${pkgdir}/usr/share/java/elan"
    install -Dm644 ./*.jar "${pkgdir}/usr/share/java/elan"
    install -dm755 "${pkgdir}/usr/share/java/elan/lib"
    install -Dm644 lib/*.* "${pkgdir}/usr/share/java/elan/lib"
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/elan" "${pkgdir}/usr/bin"
}
