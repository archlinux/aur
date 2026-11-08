# Maintainer: Vincent Ceylan <aur@egn.mozmail.com>
# Contributor: Posi <posi1981@gmail.com>
# Contributor: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=messverfahren-ravt
pkgver=1.1.0
pkgrel=63
pkgdesc="Mit der Messverfahren-RaVT Desktop-App können Sie die Datenübertragungsrate Ihres Internetzugangs messen und dadurch die Leistungsfähigkeit Ihres stationären Internetzugangs ermitteln."
arch=('x86_64')
license=('custom:proprietary-zafaco-GmbH')
url="https://www.breitbandmessung.de/festnetz/recht-auf-versorgung"
options=('!strip')
source=("messverfahren-${pkgver}.deb::https://download.breitbandmessung.de/ravt/Messverfahren-RaVT-linux.deb" "LICENSE")
sha256sums=("1009eb3967704f29a486f84eb99e73b4525a716aa951c2264c60223265d52cd8" "SKIP")
depends=("net-tools")
optdepends=('libappindicator: for systray icon')
makedepends=("asar")
provides=("breitbandmessung" "breitbandmessung-bin")
conflicts=("breitbandmessung" "breitbandmessung-bin")
replaces=("breitbandmessung<=3.9.0" "breitbandmessung-bin<=3.12.0")

build() {
    _builddir="${srcdir}/${pkgver}-${pkgrel}"
    mkdir -p "${_builddir}"

    tar --extract --overwrite --file=data.tar.xz --directory="${_builddir}"

    cd "${_builddir}/opt/Messverfahren-RaVT/resources/"

    _unpatched="lsbRelease()"
    _patched='{ "distributorID": "Debian", "release": "8", "description": "Debian" }'

    asar e app.asar unpacked/
    sed -i "s/${_unpatched}/${_patched}/g" unpacked/build/electron.js
    asar p unpacked/ app.asar
    rm -rf unpacked/

    rm -rf ${_builddir}/usr/share/icons/hicolor/36x36
    mv -T ${_builddir}/usr/share/icons/hicolor/2x2 ${_builddir}/usr/share/icons/hicolor/36x36
    rm -rf ${_builddir}/usr/share/icons/hicolor/54x54
    mv -T ${_builddir}/usr/share/icons/hicolor/3x3 ${_builddir}/usr/share/icons/hicolor/54x54
    echo "Keywords=breitbandmessung" >> ${_builddir}/usr/share/applications/messverfahren-ravt.desktop
}

package() {
    cp -a "${srcdir}/${pkgver}-${pkgrel}/." "${pkgdir}"

    #Create /usr/bin symlink
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/Messverfahren-RaVT/messverfahren-ravt" "${pkgdir}/usr/bin/messverfahren-ravt"

    chmod -R go-w "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
