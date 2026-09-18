# Maintainer: taotieren <admin@taotieren.com>

pkgname=ecubus-pro-bin
_tagname=0.8.67
pkgver=${_tagname//-/_}
pkgrel=1
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
    glib2
    libgcc_s.so
    libstdc++.so
    hicolor-icon-theme
    java-runtime
    systemd-libs
    python
    # AUR
    python-canmatrix
    python-doipclient
    python-odxtools
    python-udsoncan
)
makedepends=(
    libarchive
)
optdepends=()
backup=()
options=(!debug !strip)
install=
_pkgname=EcuBus-Pro
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('bf7fbf5a5ed462607ecbf5351b8df48a33c724ea699b47b3c3ea569371d5bcb9')
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
