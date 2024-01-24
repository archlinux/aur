# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: wh201906 <wh201906@yandex.com>

_pkgname=SerialTest
pkgname=serialtest-git
pkgver=0.3.3.r1.g10fc7a8
pkgrel=20
pkgdesc="A cross-platform test tool for serial port, Bluetooth, TCP and UDP."
arch=(
    'aarch64'
    'riscv64'
    'x86_64')
url="https://github.com/wh201906/SerialTest"
license=('GPL-3.0-only')
provides=(${_pkgname})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('qcustomplot' 'qt5-serialport' 'qt5-connectivity')
makedepends=('qt5-tools' 'git')
backup=()
options=()
install=${pkgname}.install
source=("${_pkgname}::git+${url}.git#branch=dev"
        "${pkgname}.install")
sha256sums=('SKIP'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

# prepare() {
#     cd "${srcdir}/${_pkgname}/"
#     git checkout dev
# }

pkgver() {
    cd "${srcdir}/${_pkgname}/"
    git describe --long --tags | sed 's/V//g;s/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${_pkgname}" clean -dfx
}


build() {
    cd "${srcdir}/${_pkgname}/src/"
    qmake
    make -j$((`nproc` + 1))
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}/src/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0644 "${srcdir}/${_pkgname}/pack/aur/io.github.wh201906.serialtest.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.wh201906.serialtest.metainfo.xml"
    install -Dm0644 "${srcdir}/${_pkgname}/pack/aur/io.github.wh201906.serialtest.desktop" "${pkgdir}/usr/share/applications/io.github.wh201906.serialtest.desktop"
    install -Dm0644 ${srcdir}/${_pkgname}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "$srcdir/${_pkgname}/src/icon/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
#    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
