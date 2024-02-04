# Maintainer: Posi <posi1981@gmail.com>

# Contributorr: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=breitbandmessung
pkgver=3.6.0
pkgrel=1
pkgdesc="Die Breitbandmessung Desktop-App erlaubt es Ihnen, die tatsächliche Datenübertragungsrate Ihres Breitbandanschlusses zu messen. Weitere Informationen erhalten Sie unter https://breitbandmessung.de"
arch=('x86_64')
license=('unknown')
url="https://breitbandmessung.de/"
options=('!strip')
source=("breitbandmessung-${pkgver}.deb::https://download.breitbandmessung.de/bbm/Breitbandmessung-linux.deb")
sha256sums=("8d4a7843db6247f58b913347cfdee3d1e13f5b071f145deeb744bd37833be4e7")
depends=("net-tools")
makedepends=("asar")

build() {
    _builddir="${srcdir}/${pkgver}-${pkgrel}"
    mkdir -p "${_builddir}"

    tar --extract --overwrite --file=data.tar.xz --directory="${_builddir}"

    cd "${_builddir}/opt/Breitbandmessung/resources/"

#    _unpatched="}return p.current={}"
#    _patched="}p.allowed=!0;return p.current={}"

    _unpatched="lsbRelease()"
    _patched='{ "distributorID": "Debian", "release": "8", "description": "Debian" }'

    asar e app.asar unpacked/
#    sed -i "s/${_unpatched}/${_patched}/g" unpacked/build/static/js/*.js
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
}
