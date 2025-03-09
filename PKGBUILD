# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: wh201906 <wh201906@yandex.com>

_pkgname=mEDIFIER
pkgname=medifier-git
pkgver=0.2.1.r2.g10056b5
pkgrel=5
pkgdesc="An open-source alternative to the Edifier Connect app"
arch=($CARCH)
url="https://github.com/wh201906/mEDIFIER"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=('qt5-serialport' 'qt5-connectivity')
makedepends=('qt5-tools' 'git')
backup=()
options=('!strip')
install=
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/"
    git describe --long --tags | sed 's/V//g;s/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${_pkgname}/Qt/"
    qmake
    make -j$(($(nproc) + 1))
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}/Qt/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0644 "${srcdir}/${_pkgname}/deploy/aur/io.github.wh201906.medifier.qt.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.wh201906.medifier.qt.metainfo.xml"
    install -Dm0644 "${srcdir}/${_pkgname}/deploy/aur/io.github.wh201906.medifier.qt.desktop" "${pkgdir}/usr/share/applications/io.github.wh201906.medifier.qt.desktop"
    install -Dm0644 ${srcdir}/${_pkgname}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    #    install -Dm644 "$srcdir/${_pkgname}/src/icon/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    #    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
