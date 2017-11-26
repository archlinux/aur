# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Based on [extra]'s thunderbird

pkgname=thunderbird-nightly
pkgver=59.0a1.20171126
_version=59.0a1
pkgrel=1
pkgdesc="Standalone Mail/News reader - Nightly build"
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
FX_SRC_URI="http://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-central/${FX_SRC}"

source=("${FX_SRC_URI}.txt"
        "${FX_SRC_URI}.tar.bz2"
        "$pkgname.desktop"
        "vendor.js")

sha512sums=('5d248a159a8e3ca66e31461ee3f699ac8ad0cb0995d3518d57ef1b38c395e7249f8e20709eb11f21391cad2021302e803645b4e8589eeb431a5ff21c5320f2a6'
            '75900f9ff114b0755798e6efd1dda9422cf28d35959cc4c57bdcd7cde51be9191808eb07e959390f4b5d59dad90ad8421902df0b48241f13b7a19312a38c0dec'
            'c75c6d5b6f48e25a3c2ea666ae9b42f4e3372de9aaf6cd4270f3356c7046f9f19caa1651e5d779b95d790edfd4dd39dc3f4261361d882a62166dc9e91e9e8cb1'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')

pkgver(){
    cd "$srcdir"
    echo "${_version}.$(head -n1 "${FX_SRC}.txt" |cut -c -8)"
}

package() {
    cd "$srcdir"
    install -d "$pkgdir"/{usr/bin,opt}
    cp -a thunderbird "$pkgdir/opt/$pkgname-$pkgver"
    cp vendor.js "$pkgdir/opt/$pkgname-$pkgver/defaults/pref/"
    ln -s "/opt/$pkgname-$pkgver/thunderbird" "$pkgdir/usr/bin/$pkgname"
    for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
        install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
    done
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    rm -rf "$pkgdir/opt/$pkgname-$pkgver/dictionaries/"
    ln -sf /usr/share/hunspell/ "$pkgdir/opt/$pkgname-$pkgver/dictionaries"
}
