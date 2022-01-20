# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=artemis3
pkgver=3.2.1
pkgrel=1
pkgdesc="Radio Signals Recognition Manual"
url="https://aresvalley.com/"
license=(GPL3)
arch=(x86_64)
depends=('glibc>=2.27' 'python>=3.7.0' 'python-numpy>=1.17.2' 'python-pandas>=0.24.2' 'python-certifi>=2019.6.16' 'python-aiohttp>=3.5.4' 'python-urllib3>=1.24.3' 'python-pygame>=1.9.6' 'python-qtawesome>=0.6.0' 'python-pyqt5>=5.12.2')
makedepends=(pyinstaller patch)
source=("https://github.com/AresValley/Artemis/archive/v${pkgver}.tar.gz"
        "artemis3"
        "artemis3.sysusers"
        "artemis3.desktop"
        "fixbuild.patch")
install=artemis3.install
sha256sums=('dfdfe81e0f7ef5f18cc04f8b410e58bdbde099f2e0d76de8b4e29e1155258c4a'
            '11efdce8f8532de4064c42a6da264e3a835b134a05a8cc3be43081f397c901d1'
            '5add7b9bc96f588c734da485dccb3451aa5aa6dfc6b452c0ec9b2144cf20365c'
            'de6e877836308b2ab02ff677589a3e60167c51beea611dc80ce0315dcd586595'
            'aabcef613f795dac33fb7f9a7ed71e514a63a02aaf697901449768869baa010b')

prepare() {
    cd "${srcdir}/Artemis-${pkgver}"

    patch -Np0 -i "${srcdir}/fixbuild.patch"
}

build() {
    cd "${srcdir}/Artemis-${pkgver}/spec_files/Linux"

    pyinstaller Artemis.spec
}

package() {
    cd "${srcdir}/Artemis-${pkgver}"

    # install basic stuff
    mkdir -p "${pkgdir}/opt/${pkgname}"

    install -Dm755 "${srcdir}/artemis3" "${pkgdir}/usr/bin/artemis3"
    install -Dm755 "spec_files/Linux/dist/Artemis" "${pkgdir}/opt/${pkgname}/Artemis"
    cp -ar "src/themes" "${pkgdir}/opt/${pkgname}/"

    # install desktop entries and icons
    install -Dm644 "spec_files/Linux/artemis3.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/artemis3.svg"
    install -Dm644 "${srcdir}/artemis3.desktop" "${pkgdir}/usr/share/applications/artemis3.desktop"

    # create group
    install -Dm644 "${srcdir}/artemis3.sysusers" "${pkgdir}/usr/lib/sysusers.d/artemis3.conf"

    # fix permissions
    chown -R root:2008 "${pkgdir}/opt/${pkgname}"
    chmod -R g+w "${pkgdir}/opt/${pkgname}"
}
