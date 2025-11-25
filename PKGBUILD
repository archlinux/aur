# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=coccoc-browser-stable
_pkgname=coccoc-browser
pkgver=141.0.7390.132
pkgrel=1
_pkgrel=1
pkgdesc="The web browser from Coc Coc. Coc Coc is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=('x86_64')
url="https://coccoc.com"
license=('custom')
depends=(
    'ttf-liberation'
    'alsa-lib'
    'libcups'
    'gtk3'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
)
optdepends=(
    'pipewire: WebRTC desktop sharing under Wayland'
    'kdialog: for file dialogs in KDE'
    'gnome-keyring: for storing passwords in GNOME keyring'
    'libunity: for download progress on KDE'
    'kwallet: for storing passwords in KWallet'
)
provides=('coccoc-browser' 'coccoc')
conflicts=('coccoc-browser' 'coccoc')
options=('!strip' '!emptydirs')
install=${pkgname}.install

# validgpgkey='5DA62E7F05A744B437D54C1A414816EB7B41FA4B'
source=(
    "https://browser-linux.coccoc.com/deb/pool/main/${pkgname}_${pkgver}-${_pkgrel}_amd64.deb"
    # "https://browser-linux.coccoc.com/deb/public.gpg"
    "LICENSE.html"
)
sha256sums=(
    '21ea1c0e4b6c81a26b422a43b365cf11ed42d620a621a5c4a0aef6be65c83836'
    # '6119c4e31caf078f03f9ce5a2cf301646abcb78a687a70d28bdae9901c478300'
    '22bf4605260a7432eee169b0afbfae6782b9812c2bc776fdc1a887f6e2b10ec6'
)

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/coccoc/browser/coccoc-browser" "$pkgdir/usr/bin/coccoc-browser"
    
    local icon_sizes=(16 24 32 48 64 128 256)
    for size in "${icon_sizes[@]}"; do
        install -Dm644 "$pkgdir/opt/coccoc/browser/product_logo_${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/coccoc-browser.png"
        rm "$pkgdir/opt/coccoc/browser/product_logo_${size}.png"
    done
    
    install -Dm644 "LICENSE.html" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.html"
    chmod -R go-w "$pkgdir"
    rm -r "$pkgdir/etc/cron.daily/" "$pkgdir/opt/coccoc/browser/cron/" 
}