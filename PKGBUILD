# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>
# Co-mantainer: Rubén Fdes. Moreira <ruben.fdesmoreira@openmailbox.org>

pkgname=fair-coin
pkgver=1.5.2
pkgrel=5
pkgdesc="FairCoin Qt official client"
arch=(i686 x86_64)
url="https://fair-coin.org/"
license=('MIT')
depends=('qt4' 'boost-libs' 'qrencode' 'protobuf')
makedepends=('boost' 'imagemagick')
source=("https://github.com/FairCoinTeam/fair-coin/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "0001-fix-issue-14.patch")
install="$pkgname.install"
sha256sums=("72e512768f8307db5c2f1ae5513bf222835919268110db7361bab056ee44db5e"
            "7bf32cef879eb08682d92cd8ee35d68b8e295030d2873dc6a3a95cd37b88612c"
            "3742eb31eab4ab8a91ce975b03d56220638c4e926dea6f098e0a786407ec20c3")

prepare() {
    cd $pkgname-$pkgver
    patch -p1 < ../0001-fix-issue-14.patch
}

build() {
    cd $pkgname-$pkgver
    ./autogen.sh
    LIBS=-lrt ./configure --prefix=/usr --with-incompatible-bdb --disable-tests 
    make
}

package() {
    cd ${pkgname}-${pkgver}

    DESTDIR="$pkgdir" make install

    # Install license file (recommended, as license is MIT)
    install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING

    # Imagemagick comes to the rescue to create icons... Extracting the ICO file
    # for the Windows build into several pngs
    convert share/pixmaps/faircoin.ico ${pkgname}.png
    install -Dm644 ${pkgname}-0.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png
    install -Dm644 ${pkgname}-1.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png
    install -Dm644 ${pkgname}-2.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png
    install -Dm644 ${pkgname}-3.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
    install -Dm644 ${pkgname}-4.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png

    # Desktop entry file
    install -Dm644 ../../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
