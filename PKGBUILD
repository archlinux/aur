# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=morphe-desktop
pkgver=1.12.0
pkgrel=1
pkgdesc="Tool for patching Android apps using Morphe Desktop (CLI & GUI)"
arch=('any')
url="https://morphe.software"
license=('GPL-3.0-or-later')
depends=('java-runtime>=21')
optdepends=('android-tools: for installing patched APKs via ADB')
replaces=('morphe-cli')
source=("${pkgname}-${pkgver}.jar::https://github.com/MorpheApp/morphe-desktop/releases/download/v${pkgver}/morphe-desktop-${pkgver}-all.jar"
        "morphe-logo-${pkgver}.png::https://raw.githubusercontent.com/MorpheApp/morphe-desktop/v${pkgver}/src/main/resources/morphe_logo.png"
        "NOTICE-${pkgver}::https://raw.githubusercontent.com/MorpheApp/morphe-desktop/v${pkgver}/NOTICE")
sha256sums=('1c0a3e232576563ed3f6e73ee214417595b5583732a120a9a2d0a198f5ad3e4f'
            'cbfcb7b7a8274e8da1b9fbb4ac9655f4322a720ca9efbe02f42a9ea53ffdb30d'
            '6c84c9f8eb03caf4fcc02950343b95d3bcab9ce585be620f8fbed4112667decf')
noextract=("${pkgname}-${pkgver}.jar")
options=('!debug')

latestver() {
    gh api --paginate repos/MorpheApp/morphe-desktop/releases --jq \
        '.[] | select(.prerelease == false and .draft == false) | .assets[]?.name' |
        sed -nE '/^morphe-desktop-[0-9.]+-all\.jar$/{s/^morphe-desktop-//; s/-all\.jar$//; p; q}'
}

package() {
    install -Dm644 "${pkgname}-${pkgver}.jar" \
        "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "morphe-logo-${pkgver}.png" \
        "${pkgdir}/usr/share/pixmaps/morphe.png"
    install -Dm644 "NOTICE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'WRAPPER'
#!/bin/sh
exec /usr/bin/java -jar /usr/share/java/morphe-desktop/morphe-desktop.jar "$@"
WRAPPER
    ln -s "${pkgname}" "${pkgdir}/usr/bin/morphe-cli"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/morphe.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Morphe Desktop
Comment=Android app patching tool
Exec=morphe-desktop
Icon=morphe
Categories=Utility;
Terminal=false
DESKTOP
}
