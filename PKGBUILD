# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Based on mmtrt's snap package

pkgname=acroread-dc-wine
pkgver=25.001.20997
pkgrel=4
pkgdesc="Adobe Acrobat Reader DC - PDF viewer (via Wine)"
arch=('x86_64')
url="https://www.adobe.com/products/reader.html"
license=('LicenseRef-proprietary')
depends=(
    'wine'
    'wine-mono'
    'wine-gecko'
    'winetricks'
    'p7zip'
    'hicolor-icon-theme'
)
optdepends=(
    'cups: printing support'
    'lib32-libcups: 32-bit printing support'
    'lib32-gnutls: HTTPS support'
    'lib32-libpulse: audio support'
    'xdotool: fix window type for proper WM integration'
    'xorg-xprop: fix window type for proper WM integration'
    'xorg-xrandr: screen resolution detection for virtual desktop'
)
makedepends=('icoutils')
install=acroread-dc-wine.install
options=('!strip')

# Language selection - change this to your preferred language
# Available: en_US, fr_FR, de_DE, es_ES, ja_JP, it_IT, nl_NL, pt_BR, fi_FI, da_DK, nb_NO, sv_SE
_lang="en_US"

_pkgver_nodots="${pkgver//./}"
source=(
    "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/${_pkgver_nodots}/AcroRdrDC${_pkgver_nodots}_${_lang}.exe"
    "acroread-dc.sh"
    "acroread-dc-setup.sh"
    "acroread-dc.desktop"
    "acroread-dc.reg"
)
sha256sums=('SKIP'
            'a6277ea43846f47fc21d8ea1dcac8611679867208297f28f0d2b175179004675'
            '7450f1caff56811d1f2fb32cc3ef9f504ae7dc023faaad37ccc1260757ff50cd'
            '4c3defab70b10298b8c1f66f16a385878d62b2443320256bf3c089824884c20d'
            '7d03cd0a3794bf611589614878cd4159dc13200aaca527a15a259609397fb7f8')
noextract=("AcroRdrDC${_pkgver_nodots}_${_lang}.exe")

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "AcroRdrDC${_pkgver_nodots}_${_lang}.exe" "$pkgdir/opt/$pkgname/AcroRdrDC_installer.exe"
    install -Dm755 acroread-dc.sh "$pkgdir/opt/$pkgname/acroread-dc.sh"
    install -Dm755 acroread-dc-setup.sh "$pkgdir/opt/$pkgname/acroread-dc-setup.sh"
    install -Dm644 acroread-dc.reg "$pkgdir/opt/$pkgname/acroread-dc.reg"

    7z x -o"$srcdir/extracted" "AcroRdrDC${_pkgver_nodots}_${_lang}.exe" -y > /dev/null 2>&1 || true
    if [[ -f "$srcdir/extracted/AcroRead.ico" ]]; then
        icotool -x "$srcdir/extracted/AcroRead.ico" -o "$srcdir/" 2>/dev/null || true
        if [[ -f "$srcdir/AcroRead_1_256x256x32.png" ]]; then
            install -Dm644 "$srcdir/AcroRead_1_256x256x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/acroread-dc.png"
        elif [[ -f "$srcdir/AcroRead_1_48x48x32.png" ]]; then
            install -Dm644 "$srcdir/AcroRead_1_48x48x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/acroread-dc.png"
        fi
    fi

    install -Dm644 acroread-dc.desktop "$pkgdir/usr/share/applications/acroread-dc.desktop"
    ln -s "/opt/$pkgname/acroread-dc.sh" "$pkgdir/usr/bin/acroread-dc"
}
