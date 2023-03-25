# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=wreckfest-wine-gog
_pkgname=wreckfest
pkgver=1.0j
_pkgver="1.0j_(62993)"
pkgrel=1
pkgdesc="Wreckfest using WINE with data via GOG"
arch=('i686' 'x86_64')
url="https://www.gog.com/en/game/wreckfest"
license=('custom')
depends=('wine')
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
sha256sums=('23a03208740d68f0c84a6392fdab7cf7874df343854ad6093b2885fa881d9378'
            'c305d8764a039f60120bc36fcfa154553fef74bee0e7eeb3cdf91639b9d8587e'
            '97dd99390ee5ebf79bb017ba128e50b9b6737de6fecb4991a254afdc9e4a82c2'
            'd056fc0af1fe2285eec29e11cab1e60c53f65243d4c321dd917ce028412aff2c'
            'b89dbb9c69d3debc2ba8427c667210d7a47b567795011a600a71bb15ee5ced1a'
            'ecc9917dd32fb7836897c098689baf76cb4a29c2e348c90e0d0aaf1fcd6a9678'
            'c45bdbe3589bffd9952db920b2a632b5e008d6eaf7d3b5a68662ca2d14bbf79c'
            '228188cdd318950b303efb5bc69198244139174bbcebb3e2a824881dcee38c8f'
            'f5a33559a4f9d7c9ea772ba8215b757ad21d53aa0ccc42d16c8fc311f2cba904'
            'bad71308306ecb675927d3cce770668ee4b5ff9c74cda02df8f3583c0c74b108'
            '2a461d48a57b449b223bfd4c5113e2c471bd249cf1777130d57ba75503bd18dc')

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
