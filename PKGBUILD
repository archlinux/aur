# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=morphe-cli
pkgver=1.8.1
pkgrel=1
pkgdesc="Tool for patching Android apps using Morphe Patcher (CLI & GUI)"
arch=('any')
url="https://morphe.software"
license=('GPL-3.0-or-later')
depends=('java-runtime>=11')
optdepends=('android-tools: for installing patched APKs via ADB')
source=("${pkgname}-${pkgver}.jar::https://github.com/MorpheApp/morphe-cli/releases/download/v${pkgver}/morphe-cli-${pkgver}-all.jar"
        "https://raw.githubusercontent.com/MorpheApp/morphe-cli/v${pkgver}/src/main/resources/morphe_logo.png"
        "https://raw.githubusercontent.com/MorpheApp/morphe-cli/v${pkgver}/NOTICE")
sha256sums=('0eb52bdd90d914c28fc7d1ef9f7e93931e3a47f894ed71ed864c87d205f2d861'
            'cbfcb7b7a8274e8da1b9fbb4ac9655f4322a720ca9efbe02f42a9ea53ffdb30d'
            'bed1a8483e262dcfc648e22ac62fea352b6e0cb54d0fea794d2ccf1e93ccd961')
noextract=("${pkgname}-${pkgver}.jar")
options=('!debug')

latestver() {
    gh api --paginate repos/MorpheApp/morphe-cli/releases --jq '.[] | select(.prerelease == false and .draft == false) | .assets[]?.name' |
    sed -nE '/^morphe-cli-[0-9.]+-all\.jar$/{s/^morphe-cli-//; s/-all\.jar$//; p; q}'
}

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 morphe_logo.png "${pkgdir}/usr/share/pixmaps/morphe.png"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

    # Wrapper script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<'WRAPPER'
#!/bin/sh
exec /usr/bin/java -jar /usr/share/java/morphe-cli/morphe-cli.jar "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Desktop file
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/morphe.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Morphe
Exec=morphe-cli
Icon=morphe
Categories=Utility;
Terminal=false
EOF
}
