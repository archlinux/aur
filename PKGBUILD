# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=morphe-cli
pkgver=1.6.0
pkgrel=1
pkgdesc="Command-line tool for patching Android apps using Morphe Patcher"
arch=('any')
url="https://morphe.software"
license=('GPL-3.0-or-later')
depends=('java-runtime>=11')
optdepends=('android-tools: for installing patched APKs via ADB')
source=("${pkgname}-${pkgver}.jar::https://github.com/MorpheApp/morphe-cli/releases/download/v${pkgver}/morphe-cli-${pkgver}-all.jar"
        "https://raw.githubusercontent.com/MorpheApp/morphe-cli/v${pkgver}/LICENSE"
        "https://raw.githubusercontent.com/MorpheApp/morphe-cli/v${pkgver}/NOTICE")
sha256sums=('c95ed42ecfc2e5236c2a0c61734705bbe90f6ada80970f91e5af9a4d3b7a81bd'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'bed1a8483e262dcfc648e22ac62fea352b6e0cb54d0fea794d2ccf1e93ccd961')
noextract=("${pkgname}-${pkgver}.jar")
options=('!debug')

latestver() {
    curl -fsSL 'https://api.github.com/repos/MorpheApp/morphe-cli/releases/latest' | jq -r '.assets[]?.name' |
    sed -nE '/^morphe-cli-[0-9.]+-all\.jar$/{s/^morphe-cli-//; s/-all\.jar$//; p;}'
}

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

    # Wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<'WRAPPER'
#!/bin/sh
exec /usr/bin/java -jar /usr/share/java/morphe-cli/morphe-cli.jar "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
