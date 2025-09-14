# Maintainer: adogecheems <adogecheems@outlook.com>
pkgname=monika-after-story
pkgver=0.12.17
pkgrel=7
pkgdesc="A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika."
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
    "mas-$pkgver.tar.gz::https://github.com/Monika-After-Story/MonikaModDev/archive/refs/tags/v$pkgver.tar.gz"
    "mas.desktop"
)
sha256sums=(
    'd1d5f4dbc409f921c1f3b48e1c422da7ebf032916699517e0dd213127e2c4328'
    'caa9a987153c88c4e242eecb8e827dd5ff946567e5345048893a4781fcc06377'
    '9ecb0f7e400756d23a0fbf1aa19c96c24de38bbb71cbbae2b7c13a2896cbee5a'
    'a8416c26f4ee7e6afe18b6c6641bb2e4978b41731ef06712ab5066fdffd0d3ab'
    '550bf597271b3b6a3774018968d8f2ed8620e6a33c584ddcadab8e8f75f95d15'
    '723c98ca0bc0f022a444c7a7cb225989ad2b2fbe364ead02c5b1c29d31a7abd4'
)
prepare() {
    cp -a "$srcdir/MonikaModDev-$pkgver/Monika After Story/." "$srcdir/DDLC/"
    cp -a "$srcdir/scripts/." "$srcdir/DDLC/"
    cp "$srcdir/fix.sh" "$srcdir/DDLC/"
    
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
    install -Dm644 "$srcdir/mas.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mas.png"
    install -Dm644 "$srcdir/mas.desktop" "$pkgdir/usr/share/applications/mas.desktop"
    
    install -d "$pkgdir/opt/monika-after-story"
    cp -rL "$srcdir/DDLC/." "$pkgdir/opt/monika-after-story"
}
