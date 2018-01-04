# Maintainer: Michael Moroni <michaelmoroni AT disroot DOT org >
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Based on [extra]'s thunderbird

_name=thunderbird
_channel=nightly
_lang=it
pkgname=${_name}-${_channel}-${_lang}
pkgver=59.0a1.20171126
_version=59.0a1
pkgrel=1
pkgdesc="Standalone Mail/News reader - Nightly build (${_lang})"
arch=('i686' 'x86_64')
url="http://www.mozilla.org/it/thunderbird"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig'
         'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg'
         'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss'
         'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$_version")
install="$pkgname.install"

_url="https://ftp.mozilla.org/pub/${_name}/${_channel}/latest-comm-central-l10n"
_urlUS="https://ftp.mozilla.org/pub/${_name}/${_channel}/latest-comm-central"
_src="${_name}-${_version}.${_lang}.linux"
_srcUS="${_name}-${_version}.en-US.linux"
source=("${pkgname}.desktop" 'vendor.js')
# source_i686=("${_url}/${_src}-i686.tar.bz2"{,.asc} "${_urlUS}/${_srcUS}-i686.txt")
# source_x86_64=("${_url}/${_src}-x86_64.tar.bz2"{,.asc} "${_urlUS}/${_srcUS}-x86_64.txt")
source_i686=("${_url}/${_src}-i686.tar.bz2" "${_urlUS}/${_srcUS}-i686.txt")
source_x86_64=("${_url}/${_src}-x86_64.tar.bz2" "${_urlUS}/${_srcUS}-x86_64.txt")
sha512sums=('869509c2051987fe3f16ba4bbd016c3f8caf3c0204b52f90d33b9f25ed537d78fd208ce8e3d17f40adcf5dbec668176040ca5c803867cb250d209f8c3b78c50d'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_i686=('b625b4797ceceb55e0c8392aa7072737d7f307830280285630e5a9a77d1146f4a0cfc67a7177aa6c019586873fb6705f8ee0a1876966bfc238c83a2d884ae1f0'
                 '7251a5cd92a83616aa1fc43f7c105dae5252f5e6e41b7efa5c5eea091016ef1fc3e47a4987c275336328c643d111f90204dde21e8eb7aeff2e6cba336f0b7efa')
sha512sums_x86_64=('b2f8bc12ce952a2f5a14ad7682433568330d60767180069dec7f6a4f781e1e8e261096cebef7411486f9d9d5ce34d02c910b77679b87f6658ef2382ebe28e90c'
                 '7251a5cd92a83616aa1fc43f7c105dae5252f5e6e41b7efa5c5eea091016ef1fc3e47a4987c275336328c643d111f90204dde21e8eb7aeff2e6cba336f0b7efa')
# sha512sums_i686=('SKIP' 'SKIP' 'SKIP')
# sha512sums_x86_64=('SKIP' 'SKIP' 'SKIP')

pkgver(){
    cd "$srcdir"
    echo "${_version}.$(head -n1 "${_srcUS}-${CARCH}.txt" |cut -c -8)"
}

package() {
    cd "$srcdir"
    install -d "$pkgdir"/{usr/bin,opt}
    cp -a thunderbird "$pkgdir/opt/$pkgname-$pkgver"
    cp vendor.js "$pkgdir/opt/$pkgname-$pkgver/defaults/pref/"
    ln -s "/opt/$pkgname-$pkgver/thunderbird" "$pkgdir/usr/bin/$pkgname"
    for i in 16 32 48 64 128; do
        install -Dm644 thunderbird/chrome/icons/default/default${i}.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
    done
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    rm -rf "$pkgdir/opt/$pkgname-$pkgver/dictionaries/"
    ln -sf /usr/share/hunspell/ "$pkgdir/opt/$pkgname-$pkgver/dictionaries"
}
