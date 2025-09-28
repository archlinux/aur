# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=wreckfest-wine-gog
_pkgname=wreckfest
pkgver=1.0o
_pkgver="1.0o_(79627)"
pkgrel=2
pkgdesc="Wreckfest using WINE with data via GOG"
arch=('i686' 'x86_64')
url="https://www.gog.com/en/game/wreckfest"
license=('custom')
depends=('wine' 'dxvk')
makedepends=('innoextract' 'icoutils')
source=("setup_${_pkgname}_${_pkgver}.exe::gogdownloader://${_pkgname}/en1installer0"
        "setup_${_pkgname}_${_pkgver}-1.bin::gogdownloader://${_pkgname}/en1installer1"
        "setup_${_pkgname}_${_pkgver}-2.bin::gogdownloader://${_pkgname}/en1installer2"
        "setup_${_pkgname}_${_pkgver}-3.bin::gogdownloader://${_pkgname}/en1installer3"
        "setup_${_pkgname}_${_pkgver}-4.bin::gogdownloader://${_pkgname}/en1installer4"
        "setup_${_pkgname}_${_pkgver}-5.bin::gogdownloader://${_pkgname}/en1installer5"
        "setup_${_pkgname}_${_pkgver}-6.bin::gogdownloader://${_pkgname}/en1installer6"
        "setup_${_pkgname}_${_pkgver}-7.bin::gogdownloader://${_pkgname}/en1installer7"
        "setup_${_pkgname}_${_pkgver}-8.bin::gogdownloader://${_pkgname}/en1installer8"
        "${_pkgname}.desktop" "${_pkgname}.sh")
sha256sums=('2b5272be9064d553070b3de70249fef0161387c5fcb9c2719cecfba0a7cadc0a'
            'd895e4171f92406bd390a67e7c169bdec9466a39211ee6b2ca2fc2a3d4ea7bb2'
            '9a7df92aa45800f26db2860d659c09b99a18432362a5aebd63c3acd24ca85f11'
            'a1a29f274d75f2f0ac623428b1cf4aee77a5d50ddb6a354182111bc2e3951f28'
            '4fe320c3217cebec4ca4c9229c62e85ab8dd766cc1317fcb3c4beab4f652d5af'
            '977340bd72f736545ff4fb7c9194557f849f6686190159fa0a17eb8612de3860'
            'ae144fdec0f0fe7b3fb4eef64be098833a08b76de30b69010a85b824c8471bda'
            'a1f9812ea39f3e218e09f211cac098940f69c00f8545bead8f2ad02d3fd47d7d'
            '17be69b5fae4ce9868b62689429666aacdfa5ded05aac10e6ca4a5f63fc9e621'
            'bad71308306ecb675927d3cce770668ee4b5ff9c74cda02df8f3583c0c74b108'
            '4ea6d28880fa0d11b4abb6f0bb4bd07ea2263ee7aa2940719638cc1fc3fe089c')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    mkdir -p "${srcdir}/gogdata"
    cd "${srcdir}/gogdata"
    innoextract --gog -s "${srcdir}/setup_${_pkgname}_${_pkgver}.exe"
    icotool -x -o "${srcdir}/" app/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}-gog

    # Install game icon.
    install -Dm644 "${srcdir}/goggame-1249986612_7_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # Install game data.
    cp -r $srcdir/gogdata/* $pkgdir/opt/${_pkgname}-gog/

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}-gog.desktop

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}-gog
}
