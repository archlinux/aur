# Maintainer: taotieren <admin@taotieren.com>

pkgname=ecubus-pro-bin
_tagname=0.8.58
pkgver=${_tagname//-/_}
pkgrel=6
pkgdesc="A powerful automotive ECU development tool Easy of use, Cross platform, Multi dongle, Powerful script ability, CLI support"
arch=(x86_64)
url="https://github.com/ecubus/EcuBus-Pro"
license=('Apache-2.0')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(
    sh
    dbus
    expat
    gcc-libs
    glib2
    glibc
    hicolor-icon-theme
    systemd-libs
    python
)
makedepends=(
    libarchive
)
optdepends=(
    "python-doipclient: A Diagnostic over IP (DoIP) client implementing ISO-13400-2."
    "python-udsoncan: Implementation of the Unified Diagnostic Service (UDS) protocol (ISO-14229) used in the automotive industry."
)
backup=()
options=(!debug !strip)
install=
_pkgname=EcuBus-Pro
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('baa82761538e28a4e828762eb18e27b52fa0ebcc3582a9f6244c162314336a6a')
noextract=("${_pkgname}_${pkgver}_amd64.deb")

package() {
    mkdir -pv ${srcdir}/${_pkgname}_${pkgver}
    bsdtar -xf ${_pkgname}_${pkgver}_amd64.deb -C ${_pkgname}_${pkgver}
    bsdtar -xf ${_pkgname}_${pkgver}/data.tar.xz -C ${pkgdir}
    cd ${srcdir}/${_pkgname}_${pkgver}/
    install -dm0755 "${pkgdir}/usr/lib/${pkgname%-bin}/"

    mv ${pkgdir}/opt/EcuBus-Pro/* ${pkgdir}/usr/lib/${pkgname%-bin}
    rm -rf ${pkgdir}/usr/lib/${pkgname%-bin}/resources/bin/esbuild{.exe,_mac}
    rm -rf ${pkgdir}/opt

    sed -i 's|/opt/EcuBus-Pro/ecubuspro|/usr/bin/ecubus-pro|g' ${pkgdir}/usr/share/applications/ecubuspro.desktop

    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/${pkgname%-bin} <<EOF
#!/bin/sh

exec /usr/lib/${pkgname%-bin}/ecubuspro "\$@"
EOF
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/ecb_cli <<EOF
#!/bin/sh

cd /usr/lib/ecubus-pro/resources/app.asar.unpacked/resources/lib/

./ecb_cli "\$@"
EOF
}
