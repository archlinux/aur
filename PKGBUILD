# Maintainer: taotieren <admin@taotieren.com>

pkgname=rttview
_name=RTTView
pkgver=20241201
pkgrel=1
epoch=
pkgdesc="SEGGER-RTT Client for J-LINK and DAPLink"
arch=('any')
url="https://github.com/XIVN1987/RTTView"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
backup=(usr/share/${pkgname}/setting.ini)
depends=(
    glibc
    sh
    zlib
)
_makepydeps=(
    hid
    requests
    six
    pyelftools
    pyqt5
    #     pyqt5-chart
    pyqt5-webengine
    pyusb
)
makedepends=(
    #     python-build
    #     python-installer
    #     python-wheel
    #     python-setuptools
    hidapi
    python
    pyinstaller
    "${_makepydeps[@]/#/python-}"
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('d176541f8be3b2cf5810015d13c7654442c4774ac519ff14758f47211f99519d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    #     python -m build --wheel --no-isolation
    pyinstaller --onefil RTTView.py
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    #     python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm755 -t ${pkgdir}/usr/share/${pkgname}/ dist/${_name}
    install -Dm644 -t ${pkgdir}/usr/share/${pkgname}/ ${_name}.ui
    install -Dm644 -t ${pkgdir}/usr/share/${pkgname}/ README.md
    install -Dm644 Image/serial.ico ${pkgdir}/usr/share/pixmaps/${pkgname}.ico
    install -Dm666 /dev/stdin ${pkgdir}/usr/share/${pkgname}/setting.ini <<EOF
EOF
    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/${pkgname} <<EOF
#!/bin/sh
cd /usr/share/${pkgname}/
./${_name} "\$@"
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

}
