# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=breitbandmessung
pkgver=2.0.1
pkgrel=1
pkgdesc="Die Breitbandmessung Desktop-App erlaubt es Ihnen, die tatsächliche Datenübertragungsrate Ihres Breitbandanschlusses zu messen. Weitere Informationen erhalten Sie unter https://breitbandmessung.de"
arch=('x86_64')
license=('unknown')
url="https://breitbandmessung.de/"
options=('!strip')
source=("breitbandmessung-${pkgver}.deb::https://download.breitbandmessung.de/bbm/Breitbandmessung-linux.deb")
sha256sums=("07073899891fb1cc4b07cb93a6d21d7eaee173244eb80ace49a110cde11460d1")
depends=("net-tools")
makedepends=("asar")

build() {
    _builddir="${srcdir}/${pkgver}-${pkgrel}"
    mkdir -p "${_builddir}"

    tar --extract --overwrite --file=data.tar.xz --directory="${_builddir}"

    cd "${_builddir}/opt/Breitbandmessung/resources/"

    _unpatched="}return p.current={}"
    _patched="}p.allowed=!0;return p.current={}"

    asar e app.asar unpacked/
    sed -i "s/${_unpatched}/${_patched}/g" unpacked/build/static/js/*.js
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