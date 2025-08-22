# Maintainer: Seven Kingdoms: Ambition Team <seven-kingdoms-ambition-discuss@lists.sourceforge.net>

pkgname=7k-ambition
pkgver=3.2.2
pkgrel=1
pkgdesc="Seven Kingdoms: Ambition is a real-time game of epic strategy and empire building featuring economy management, warfare, and intrigue.  It is an updated and enhanced version of 7kaa (7K: Ancient Adversaries) featuring numerous fixes and improvements."
url="https://seven-kingdoms-ambition.sourceforge.io/"
arch=("i686" "x86_64")
license=("GPL-2.0-or-later")
depends=("openal" "desktop-file-utils" "enet" "gcc-libs" "sdl2" "boost")
makedepends=("base-devel")
optdepends=("7k-ambition-music: for ingame music")
source=("https://github.com/Infiltrator/7k-ambition/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")
b2sums=("7ef2926df74f230208c438223d963362b96327c5a8dd002ec32a7af6c2c3ae910f8cbffd2f974b0a0b178b479bc798c8be9a70e99fda93797519f041c9e18aec"
        "833ff931d205e7c2c2d2f5f4af6bc1b854344128d4377bb68d694722d1e4af6bdd822280134705286d1fb5fc4f0945d1f38fb24831c31c57c0c8a821765d54f2"
        "e6c5054c5066df0e3afe5d3b2ddea66c6bb20473caa9b223427dc959d9f5161e3ef72fb09c36fedf422ee90b3d919920dcf0887d4048515dc4096e2168afa502"
        "1feaeab6a4538a278578bdbd195d3b809472008fa8d691d564a27d05da3adcc1125f0eafe42c45dd28c8719c62397dedac2f2bf31276430e0e42be246a98f7be")


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure
    make -j
}

package() {
    # install data files
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    cd "${srcdir}/${pkgname}-${pkgver}/data/"
    cp -r {ENCYC,ENCYC2,IMAGE,RESOURCE,SCENARI2,SCENARIO,SOUND,SPRITE,TUTORIAL} "${pkgdir}/opt/${pkgname}/"

    # fix permissions
    cd "${pkgdir}/opt/${pkgname}/"
    find . -type d -exec chmod 755 {} \;

    # copy readme
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"

    # main file
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

    # bash script
    install -D -m755 "$srcdir/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # desktop entry
    install -D -m644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
