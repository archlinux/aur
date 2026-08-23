# Maintainer: Vincent Ceylan <aur@egn.mozmail.com>
# Contributor: Posi <posi1981@gmail.com>
# Contributor: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=breitbandmessung-bin
pkgver=3.12.1
pkgrel=1
pkgdesc="Die Breitbandmessung Desktop-App erlaubt es Ihnen, die tatsächliche Datenübertragungsrate Ihres Breitbandanschlusses zu messen. Weitere Informationen erhalten Sie unter https://breitbandmessung.de"
arch=('x86_64')
license=('custom:proprietary-zafaco-GmbH')
url="https://breitbandmessung.de/desktop-app"
options=('!strip')
source=("breitbandmessung-${pkgver}.deb::https://download.breitbandmessung.de/bbm/Breitbandmessung-linux.deb" "LICENSE")
sha256sums=("b948331a4e8df0fcbdd6fbace588770e62b4c61e7e279c6a0f79ef581de080f1" "SKIP")
depends=("net-tools")
makedepends=("asar")
provides=("breitbandmessung=${pkgver}")
conflicts=("breitbandmessung")
replaces=("breitbandmessung<=3.9.0")

build() {
    _builddir="${srcdir}/${pkgver}-${pkgrel}"
    mkdir -p "${_builddir}"

    tar --extract --overwrite --file=data.tar.xz --directory="${_builddir}"

    cd "${_builddir}/opt/Breitbandmessung/resources/"

    _unpatched="lsbRelease()"
    _patched='{ "distributorID": "Debian", "release": "8", "description": "Debian" }'

    asar e app.asar unpacked/
    sed -i "s/${_unpatched}/${_patched}/g" unpacked/build/electron.js
    asar p unpacked/ app.asar
    rm -rf unpacked/
}

package() {
    cp -a "${srcdir}/${pkgver}-${pkgrel}/." "${pkgdir}"

    #Create /usr/bin symlink
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/Breitbandmessung/breitbandmessung" "${pkgdir}/usr/bin/breitbandmessung"

    chmod -R go-w "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
