# Maintainer: taotieren <admin@taotieren.com>

pkgname=petoicamp-opencat
_name=OpenCat
pkgver=1.2.3
pkgrel=4
epoch=
pkgdesc="OpenCat is the open-source Arduino and Raspberry Pi-based quadruped robotic pet framework developed by Petoi, the maker of futuristic programmable robotic pets."
arch=('any')
url="https://github.com/PetoiCamp/OpenCat"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
backup=()
_pydeps=(
    pillow
    pyserial
)
depends=(
    avrdude
    esptool
    sh
    python
    "${_pydeps[@]/#/python-}"
    tk
)
makedepends=()
optdepends=()
install=${pkgname}.install
options=('!strip' '!debug')
source=(
    "${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
    "${pkgname}.install"
)
noextract=(${_name}-${pkgver}.tar.gz)
sha256sums=('151829def2d8b2cee7228c6ea0ace8f46351502e01dbebef831f74185b73b576'
            'ec31192b3c1ba2ce71975c5b55c9e48bdc7eafb25c3de05846129ee79315291c')

package() {
    install -dm755 ${pkgdir}/usr/share/${pkgname}/
    install -dm777 ${pkgdir}/var/log/petoicamp-opencat/

    bsdtar -xf ${srcdir}/${_name}-${pkgver}.tar.gz --strip-components=1 -C ${pkgdir}/usr/share/${pkgname}/

    cd "${pkgdir}/usr/share/${pkgname}/"

    install -Dm644 pyUI/resources/Petoi.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    sed -e 's|./logfile.log|/var/log/petoicamp-opencat/logfile.log|g' \
        -i \
        pyUI/FirmwareUploader.py \
        serialMaster/ardSerial.py
    rm -rf pyUI/resources/{*Mac,*Win}
    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/${pkgname} <<EOF
#!/bin/sh
cd /usr/share/${pkgname}/pyUI/
python UI.py "\$@"
EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Name=${pkgdesc}
Comment=${pkgdesc}
Exec=${pkgname}
Terminal=false
Type=Application
StartupNotify=true
Categories=Electronics;Engineering;Science;
Icon=${pkgname}
EOF

    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/${pkgname}-ardserial <<EOF
#!/bin/sh
cd /usr/share/${pkgname}/serialMaster/
python ardSerial.py "\$@"
EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}-ardserial.desktop <<EOF
[Desktop Entry]
Name=${pkgdesc}
Comment=${pkgdesc}
Exec=${pkgname}-ardserial
Terminal=false
Type=Application
StartupNotify=true
Categories=Electronics;Engineering;Science;
Icon=${pkgname}
EOF
}
