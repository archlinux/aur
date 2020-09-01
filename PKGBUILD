# Maintainer: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=breitbandmessung
pkgver=1.1.8
pkgrel=1
pkgdesc="Die Breitbandmessung Desktop-App erlaubt es Ihnen, die tatsächliche Datenübertragungsrate Ihres Breitbandanschlusses zu messen. Weitere Informationen erhalten Sie unter https://breitbandmessung.de"
arch=('x86_64')
license=('unknown')
url="https://breitbandmessung.de/"
options=('!strip')

source=("breitbandmessung-${pkgver}.deb::https://download.breitbandmessung.de/bbm/Breitbandmessung-linux.deb")
sha256sums=("1fc34fcac94263ab86937695e9d2e7a0d8fd5eaf64bffb1b31b463e4c8aabdb0")
depends=("net-tools")
makedepends=("asar")

package() {
	cd ${srcdir}

    #Extract debian sources 
	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

    #Fixing the sources to allow running on arch
    cd "${pkgdir}/opt/Breitbandmessung/resources"

    _unpatched="}return m.current={}"
    _patched="}m.allowed=!0;return m.current={}"

    asar e app.asar unpacked/
    sed -i "s/${_unpatched}/${_patched}/g" unpacked/build/static/js/*.js
    asar p unpacked/ app.asar
    rm -rf unpacked/

    #Create /usr/bin symlink
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/Breitbandmessung/breitbandmessung" "${pkgdir}/usr/bin/breitbandmessung"

    chmod -R go-w "${pkgdir}/usr"
}