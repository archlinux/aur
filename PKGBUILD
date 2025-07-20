# Maintainer: adogecheems <adogecheems@outlook.com>
pkgname=monika-after-story
pkgver=0.12.17
pkgrel=1
pkgdesc="A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika."
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/adogecheems/monika-after-story-linux"
license=('custom')
makedepends=(
    'unzip'
    'xorg-server-xvfb'
)
optdepends=('polkit: for possible privilege escalation')
source=(
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/DDLC.tar.xz"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/0utils.rpy"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/config.py"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/splash.rpy"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/mas256.png"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/mas512.png"
    "https://github.com/Monika-After-Story/MonikaModDev/releases/download/v$pkgver/Monika_After_Story-$pkgver-Mod.zip"
    "mas.desktop"
)
sha256sums=(
    'd1d5f4dbc409f921c1f3b48e1c422da7ebf032916699517e0dd213127e2c4328'
    'ae877da79c2b94b9b9704f8e7fb3cecd244385c0914fe9eb9248238504b78d27'
    'ff186a543a41f7ca0aeaaa5e6c4e3d8eb39539d20111a96555e1b4e43fed0fa7'
    'c35ef9f37bf0c17f543c9bd8986efcba56d218b50f8e6774c87a00b5f10aeae4'
    '68077c41ba536571dd0a529a2d0a1d0a8cd3e0d6cb61c39d65200ca0c18f9014'
    'a8416c26f4ee7e6afe18b6c6641bb2e4978b41731ef06712ab5066fdffd0d3ab'
    '6bc8e179f543c042a0bd0aaaa55815770d9f94b31e4bad8f1e0edaff71652803'
    '723c98ca0bc0f022a444c7a7cb225989ad2b2fbe364ead02c5b1c29d31a7abd4'
)
noextract=(
    "Monika_After_Story-$pkgver-Mod.zip"
)
prepare() {
    unzip -o -q "$srcdir/Monika_After_Story-$pkgver-Mod.zip" -d "$srcdir/DDLC"
    
    mv -f "$srcdir/0utils.rpy" "$srcdir/DDLC/game"
    mv -f "$srcdir/splash.rpy" "$srcdir/DDLC/game"
    mv -f "$srcdir/config.py" "$srcdir/DDLC/renpy"

    echo "Monika After Story|$pkgver" > "$srcdir/DDLC/game/masrun"

    chmod +x "$srcdir/DDLC/DDLC.sh"
    chmod +x "$srcdir/DDLC/lib/linux-x86_64/DDLC"
    chmod +x "$srcdir/DDLC/lib/linux-i686/DDLC"
}
build () {
    cd "$srcdir/DDLC"

    SDL_AUDIODRIVER=dummy xvfb-run bash -c '
        ./DDLC.sh --compile &
        pid=$!
        sleep 60
        kill $pid
    '

    rm -f "game/*.rpy"
}
package() {
    install -Dm644 "$srcdir/mas256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/mas.png"
    install -Dm644 "$srcdir/mas512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mas.png"
    install -Dm644 "$srcdir/mas.desktop" "$pkgdir/usr/share/applications/mas.desktop"
    
    install -d "$pkgdir/opt/monika-after-story"
    cp -r "$srcdir/DDLC/"* "$pkgdir/opt/monika-after-story"
}
