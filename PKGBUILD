# Maintainer: adogecheems <adogecheems@outlook.com>
pkgname=monika-after-story-cn
pkgver=0.12.17.0
srcpkgver=0.12.17
pkgrel=3
pkgdesc="A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika, with third-party Chinese language support."
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/adogecheems/monika-after-story-linux"
license=('custom')
source=(
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/DDLC.tar.xz"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/scripts.tar.xz"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/fix.sh"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/mas.png"
    "mas-$srcpkgver.tar.gz::https://github.com/Monika-After-Story/MonikaModDev/archive/refs/tags/v$srcpkgver.tar.gz"
    "https://github.com/Mon1-innovation/MAS-Simplified-Chinese-Patch/releases/download/$pkgver/chs.rpa"
    "https://github.com/Mon1-innovation/MAS-Simplified-Chinese-Patch/releases/download/$pkgver/chs_gui.rpa"
    "mascn.desktop"
)
sha256sums=(
    'd1d5f4dbc409f921c1f3b48e1c422da7ebf032916699517e0dd213127e2c4328'
    '7eec1459c47de1b8519cff53688995be7a582f18fdf8ce4fb88da60c9ad87b11'
    '1aea7f22a69c0ff9a37665078d9848ff39b455ce1cac336254d7b72c10cfbdeb'
    'a8416c26f4ee7e6afe18b6c6641bb2e4978b41731ef06712ab5066fdffd0d3ab'
    '550bf597271b3b6a3774018968d8f2ed8620e6a33c584ddcadab8e8f75f95d15'
    '680da91bc6246feb36dad12c18e999c07ebc068a1cb5cdc5b4f4b9e492d820b8'
    'd5c09635c0d7dc8e0444fa754eb37ba699856b6b47cf5af51bd2c5201181942f'
    'e09e7372ecb9c6071436e314b2063dc10cb703d8235921e011f126b637692d60'
)
prepare() {
    cp -a "$srcdir/MonikaModDev-$srcpkgver/Monika After Story/." "$srcdir/DDLC/"
    cp -a "$srcdir/scripts/." "$srcdir/DDLC/"
    cp "$srcdir/fix.sh" "$srcdir/DDLC/"
    cp "$srcdir/chs.rpa" "$srcdir/DDLC/game/"
    cp "$srcdir/chs_gui.rpa" "$srcdir/DDLC/game/"
    
    chmod +x "$srcdir/DDLC/fix.sh"
    chmod +x "$srcdir/DDLC/DDLC.sh"
    chmod +x "$srcdir/DDLC/lib/linux-x86_64/DDLC"
    chmod +x "$srcdir/DDLC/lib/linux-i686/DDLC"
    chmod +x "$srcdir/DDLC/game/mod_assets/games/chess/stockfish_8_linux_x64"
    
    cd "$srcdir/DDLC"
    ./fix.sh
}
build () {
    cd "$srcdir/DDLC"
    ./DDLC.sh . lint || true
    ./DDLC.sh . compile
    
    find game -type f -name "*.rpy" -delete
    rm fix.sh traceback.txt
}
package() {
    install -Dm644 "$srcdir/mas.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mascn.png"
    install -Dm644 "$srcdir/mascn.desktop" "$pkgdir/usr/share/applications/mascn.desktop"
    
    install -d "$pkgdir/opt/monika-after-story-cn"
    cp -rL "$srcdir/DDLC/." "$pkgdir/opt/monika-after-story-cn"
}
