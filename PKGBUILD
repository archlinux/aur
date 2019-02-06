# Maintainer: Jason Stryker <public at jasonstryker dot com>
pkgname=runelite-git
pkgver=0.r6617.6c1f924f6e
pkgrel=1
pkgdesc="Open source Old School RuneScape client. (Git Version)"
arch=(any)
license=('BSD')
url="https://github.com/runelite/runelite"
depends=('java-runtime>=8' 'bash' 'ttf-font')
optdepends=('gvfs: enable links')
makedepends=('maven')
provides=("runelite")
conflicts=('runelite')
source=("${pkgname}::git+${url}.git"
        runelite        
        runelite.desktop
        runelite.png)
sha512sums=('SKIP'
            '55635de6a1b081bedbd8efc3a6eb93cdf7623a188bc262f2182c8be6bd5ae098d0c0c5d655b3322de549916ce9cfbb47ac369c481f619f396d9167d76627b19d'
            'e00339514623c2f683118f1cdba93cebbc0761fd72f31e2d139ed467b8c41a6738fd0f27ac2beba4d2caa2a365ef4cc49a43af54b13ca5a908e5fd11d03f4bc1'
            'fe73d666eec61a8ac0059a56a417d3a22ccdc0d09eb567a613469af513318f4284ee70079a4d18d74cd3423c4d75ce5bb0a3c6df9f9f4532f8d5833ffe4a34ce')

_CUSTOM_PLUGINS_PATH=~/.local/share/runelite-plugins

pkgver() {
  cd "${srcdir}/${pkgname}"
  
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}/runelite-client/

    # Custom plugins are not guaranteed to work with new versions of runelite.
    # Please be careful about installing custom plugins from untrusted sources,
    # a malicious plugin could steal your account information.
    cp -vr ${_CUSTOM_PLUGINS_PATH}/* src/main/java/net/runelite/client/plugins/ || true

    mvn clean package \
        -Dmaven.repo.local="${srcdir}/repo" \
        -DskipTests=true
}

package() {
    jar=$(find ${srcdir}/${pkgname}/runelite-client/target -type f -name client-*-SNAPSHOT-shaded.jar)
    
    install -D -m644 \
        "${jar}" \
        "${pkgdir}/usr/share/runelite/RuneLite.jar"

    install -D -m755 \
        "${srcdir}/runelite" \
        "${pkgdir}/usr/bin/runelite"

    install -D -m644 \
        "${srcdir}/runelite.desktop" \
        "${pkgdir}/usr/share/applications/runelite.desktop"

    install -D -m644 \
        "${srcdir}/runelite.png" \
        "${pkgdir}/usr/share/pixmaps/runelite.png"

    install -D -m644 \
        "${srcdir}/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}"
}
