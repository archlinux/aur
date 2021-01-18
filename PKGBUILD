# Maintainer: maniacata <maniaciachao at gmail dot com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Martin Thierer <thierer@web.de>
# Contributor: Amy Wilson <awils_1[at]xsmail[dot]com>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>
# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>

pkgname=logisim-evolution
pkgver=3.4.1
pkgrel=2
pkgdesc='An educational tool for designing and simulating digital logic circuits (build from source)'
arch=('any')
url="https://github.com/reds-heig/logisim-evolution"
license=('GPL3')
depends=('java-runtime>=9' 'hicolor-icon-theme')
makedepends=('java-environment>=9')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/reds-heig/logisim-evolution/archive/v${pkgver}.tar.gz")
sha256sums=('bce8ee163e80b56a49a4ec3b5fa10c2b21779146f4c2c44d4bc7560a72566236')

install=$pkgname.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./gradlew shadowJar
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 "build/libs/logisim-evolution-${pkgver}-all.jar" \
                   "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "support/Flatpak/com.github.reds.LogisimEvolution.xml" \
                   "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
    install -Dm644 "support/Flatpak/com.github.reds.LogisimEvolution.desktop" \
                   "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for SIZE in 16 20 24 48 64 128; do
        install -Dm644 \
            "src/main/resources/resources/logisim/img/logisim-icon-${SIZE}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${pkgname}.png"
    done

    install -Dm644 "build/resources/main/resources/logisim/img/logisim-icon.svg" \
                   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    sed -e 's|Exec=.*|Exec=/usr/bin/logisim-evolution|' \
        -e 's|com.github.reds.LogisimEvolution|logisim-evolution|' \
        -i "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

