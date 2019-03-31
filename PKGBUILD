# Maintainer: Jason Stryker <public at jasonstryker dot com>

pkgname=runelite-git
_pkgname=runelite
pkgver=1.5.18+13+gf8fd91bb1c
pkgrel=1
pkgdesc="Open source Old School RuneScape client. (Git Version)"
arch=(any)
license=('BSD')
url="https://github.com/runelite/runelite"
depends=('java-runtime>=11' 'ttf-font')
optdepends=('gvfs: enable links')
makedepends=('maven')
provides=("runelite")
conflicts=('runelite')
source=("git+${url}.git"
        runelite.desktop
        runelite.png)
sha512sums=('SKIP'
            '532ec6105bbd13a6a977dfa0b2c79edc78d76994296b9044f9447eba2b1c118d249c4b103a94f30f22bdba2c9f214ca586fc8fde83d52e807d79a79c9ef1670d'
            '73e0c42f4eaf2e0adc249e471bd241e8328da7f867177535f1da206acce14801b60e69fffdbb2a10bc105f1de37b6eaaad23d5e67147b53a108b6e5bf55c586b')

pkgver() {
    cd "${srcdir}/${_pkgname}"
  
    git describe --tags | sed 's/-/+/g' | cut -d '+' -f 3-5
}

build() {    
    cd "${srcdir}/${_pkgname}/runelite-client/"

    mvn clean package -DskipTests=true
}

package() {
    client_jar=$(find ${srcdir}/${_pkgname}/runelite-client/target -type f -name client-*-SNAPSHOT-shaded.jar)
    
    install -D -m644 \
        "${client_jar}" \
        "${pkgdir}/usr/share/runelite/RuneLite.jar"

    install -D -m644 \
        "${srcdir}/runelite.desktop" \
        "${pkgdir}/usr/share/applications/runelite.desktop"

    install -D -m644 \
        "${srcdir}/runelite.png" \
        "${pkgdir}/usr/share/pixmaps/runelite.png"

    install -D -m644 \
        "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    install -D -m755 \
        "/dev/null" \
        "${pkgdir}/usr/bin/runelite"

    echo '#!/bin/sh' > "${pkgdir}/usr/bin/runelite"
    echo 'exec java -Dhttps.protocols=TLSv1.2 -jar /usr/share/runelite/RuneLite.jar "$@"' >> "${pkgdir}/usr/bin/runelite"
}
