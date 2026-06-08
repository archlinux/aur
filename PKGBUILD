# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=morphe-cli
pkgver=1.9.1
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
sha256sums=('7cbcc206945b022e880828be0c28bfdd97d70706f1533751cd20300db25fc9a3'
            'cbfcb7b7a8274e8da1b9fbb4ac9655f4322a720ca9efbe02f42a9ea53ffdb30d'
            '374c549a4e8dbe9bd1d76ef64ddbe10bb87ed3b0461b8d0e68ebad9afec41220')
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
