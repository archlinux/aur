# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Based on [extra]'s thunderbird

pkgname=thunderbird-nightly
pkgver=66.0a1.20181215
_version=66.0a1
pkgrel=1
pkgdesc='Standalone Mail/News reader - Nightly build'
arch=('i686' 'x86_64')
url="http://www.mozilla.org/thunderbird"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$_version")
install="$pkgname.install"

FX_SRC="thunderbird-${_version}.en-US.linux-${CARCH}"
FX_SRC_URI="https://download-installer.cdn.mozilla.net/pub/thunderbird/nightly/latest-comm-central/${FX_SRC}"

source=("${FX_SRC_URI}.txt"
        "${FX_SRC_URI}.tar.bz2"
        "$pkgname.desktop"
        "vendor.js")

sha512sums=('SKIP'
            'SKIP'
            'c75c6d5b6f48e25a3c2ea666ae9b42f4e3372de9aaf6cd4270f3356c7046f9f19caa1651e5d779b95d790edfd4dd39dc3f4261361d882a62166dc9e91e9e8cb1'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')

pkgver(){
    cd "${srcdir}"
    echo "${_version}.$(head -n1 "${FX_SRC}.txt" |cut -c -8)"
}

package() {
    cd "$srcdir"
    install -d "${pkgdir}"/{usr/bin,opt}
    cp -a thunderbird "$pkgdir/opt/${pkgname}-${pkgver}"
    cp vendor.js "${pkgdir}/opt/${pkgname}-${pkgver}/defaults/pref/"
    ln -s "/opt/${pkgname}-${pkgver}/thunderbird" "${pkgdir}/usr/bin/${pkgname}"
    for i in 16x16 32x32 48x48 64x64 128x128; do
        install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "$pkgdir/usr/share/icons/hicolor/$i/apps/${pkgname}.png"
    done
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm -rf "${pkgdir}/opt/${pkgname}-${pkgver}/dictionaries/"
    ln -sf /usr/share/hunspell/ "${pkgdir}/opt/${pkgname}-${pkgver}/dictionaries"
}
