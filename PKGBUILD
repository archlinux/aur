# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Based on mmtrt's snap package

pkgname=acroread-dc-wine
pkgver=26.001.21529
pkgrel=1
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
            'ee3011920d382c6b0309198e2baaf2445afd410cc77f10b40985662bd2f157ec'
            '24fe45e3fe55f7b0c5365c9344d589b6617f86800a41f62cadfbe4b2cc6eb771'
            '4c3defab70b10298b8c1f66f16a385878d62b2443320256bf3c089824884c20d'
            '11716e061f9a96d14aa2362daebbe24242e2e4b14215e1a8d953e17cd165be3e')
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
