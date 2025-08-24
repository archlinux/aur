# Maintainer: adogecheems <adogecheems@outlook.com>
pkgname=monika-after-story
pkgver=0.12.17
pkgrel=3
pkgdesc="A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika."
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/adogecheems/monika-after-story-linux"
license=('custom')
depends=('python2')
makedepends=('unzip')
optdepends=('polkit: for possible privilege escalation')
source=(
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/DDLC.tar.xz"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/scripts.tar.xz"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/mas.png"
    "https://github.com/Monika-After-Story/MonikaModDev/archive/refs/tags/v$pkgver.tar.gz"
    "mas.desktop"
)
sha256sums=(
    'd1d5f4dbc409f921c1f3b48e1c422da7ebf032916699517e0dd213127e2c4328'
    '21a34f24d14e86b76bab1b600b9467e04e8d564fbeac02a2a0b187e256dc655b'
    'a8416c26f4ee7e6afe18b6c6641bb2e4978b41731ef06712ab5066fdffd0d3ab'
    '550bf597271b3b6a3774018968d8f2ed8620e6a33c584ddcadab8e8f75f95d15'
    '723c98ca0bc0f022a444c7a7cb225989ad2b2fbe364ead02c5b1c29d31a7abd4'
)
prepare() {
    cp -a "$srcdir/MonikaModDev-$pkgver/Monika After Story/." "$srcdir/DDLC/"

    cp -a "$srcdir/scripts/." "$srcdir/DDLC/"
    
    chmod +x "$srcdir/DDLC/DDLC.sh"
    chmod +x "$srcdir/DDLC/lib/linux-x86_64/DDLC"
    chmod +x "$srcdir/DDLC/lib/linux-i686/DDLC"
}
build () {
    cd "$srcdir/DDLC"
    
    # Game files redirection
    NEW_PATH='os.path.join(os.path.expanduser("~"), ".MonikaAfterStory")'
    EXCLUDE_LIST=("script-ch30.rpy" "zz_dockingstation.rpy" "zz_spritejsons.rpy")
    
    find "game/" -type f -name "*.rpy" | while read -r file; do
        skip=0
        for exclude in "${EXCLUDE_LIST[@]}"; do
            if [[ "$(basename "$file")" == "$exclude" ]]; then
                skip=1
                break
            fi
        done
        if [[ $skip -eq 0 ]]; then
            sed -i \
            -e "s/renpy\.config\.basedir/${NEW_PATH}/g" \
            -e "s/config\.basedir/${NEW_PATH}/g" \
            "$file"
        fi
    done
    
    sed -i 's/log_enable = True/log_enable = False/' renpy/config.py
    
    ./DDLC.sh . compile
    
    rm -f game/*.rpy
}
package() {
    install -Dm644 "$srcdir/mas.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mas.png"
    install -Dm644 "$srcdir/mas.desktop" "$pkgdir/usr/share/applications/mas.desktop"
    
    install -d "$pkgdir/opt/monika-after-story"
    cp -a "$srcdir/DDLC/." "$pkgdir/opt/monika-after-story"
}
