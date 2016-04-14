# Maintainer: eagleeyetom <eagleeyetom@gmail.com>
# Contrubutor: raininja <raijin@rai.ninja>

pkgname=slimjet
pkgver=9.0.4.0
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
sha512sums_i686=('c98429f456a1d15a761db1ed132a78e3756f869bdbe12ce313d32f3ee2fec201d3fbc3799139486c729e2b6e34ca405ed04de1c696982b6c839da08b4e39153b')
sha512sums_x86_64=('8b48a793660819d68e2581c06f8165c1e70aac4c4cd8931e4b4b0ba8743f842b4688add6b5609ef65a60874684ce46a283dab8ef8a04c59429de265b8cf98296')

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
