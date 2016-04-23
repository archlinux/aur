# Maintainer: eagleeyetom <eagleeyetom@gmail.com>
# Contrubutor: raininja <raijin@rai.ninja>

pkgname=slimjet
pkgver=9.0.5.0
pkgrel=1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('i686' 'x86_64')
url="http://www.slimjet.com"
license=('custom:slimjet')
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gtk2' 'harfbuzz' 'harfbuzz-icu' 'hicolor-icon-theme'
         'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'openssl' 'nspr' 'opus' 'snappy' 'speech-dispatcher' 'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
makedepends=('pacman>=4.2.0')
provides=('slimjet' 'pepper-flash')
options=('!emptydirs' '!strip')
_channel=release
source_i686=("${pkgname}-${pkgver}_i386.deb::http://www.slimjet.com/${_channel}/${pkgname}_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.slimjet.com/{$_channel}/${pkgname}_amd64.deb")
sha512sums_i686=('0bf28b1bb77c1b1d90849a80f4b55973f1866e5fa8fa23a108958bb7220f81a2f60da3b65058c8b6c5e769c9d88299590f758500c5540e8060ee7d27a7569e11')
sha512sums_x86_64=('606ee6f62a7b85aa08a01767245e5c3fda7cad1bc400016ec97137df82fec3e2e9239055278c86a304920a49c03428b16f25eeedc09f962a3c675beb4ae7d46b')

package() {
    msg2 "Extracting the data.tar.lzma..."
    bsdtar -xf data.tar.lzma -C "$pkgdir/"
    
    msg2 "Correcting permissions..."
    chmod -R 0755 "$pkgdir/"
    
    _crypto_files="libnspr4.so.0d libplds4.so.0d libplc4.so.0d libssl3.so.1d libnss3.so.1d libsmime3.so.1d libnssutil3.so.1d"
    _libdir="/usr/lib"

    add_crypto_symlinks() {
    
      for f in $_crypto_files; do 
        target=$(echo $f | sed 's/.[01]d$//')
        if [ -f "/$_libdir/$target" ]; then
            ln -snf "/$_libdir/$target" "$pkgdir/opt/slimjet/$f"
            else echo "CHECK NSS, OPENSSL, AND NSPR VERSIONS"
            exit 1
        fi
        done
    }
    
    # Arch has  libudev.so.1, slimjet wants .0
    _libudev_0=libudev.so.0
    _libudev_1=libudev.so.1
    
    add_udev_symlinks() {
    ln -snf "/$_libdir/$_libudev_1" "$pkgdir/opt/slimjet/$_libudev_0"
    }
    
    msg2 "Adding udev and crypto symlinks..."
    add_udev_symlinks
    add_crypto_symlinks
    
    msg2 "Adding Icons..."
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$pkgdir"/opt/slimjet/product_logo_${i/x*}.png \
                       "$pkgdir"/usr/share/icons/hicolor/$i/apps/flashpeak-slimjet.png
    done
}
