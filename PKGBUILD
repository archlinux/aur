# Maintainer: eagleeyetom <eagleeyetom@gmail.com>
# Contrubutor: raininja <raijin@rai.ninja>

pkgname=slimjet
pkgver=9.0.3.0
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
sha512sums_i686=('49424bba175d87810340075af7945ba6af826d4fe2312407dc4922f34e8aa365f4a3aba2dde3905fdd159396b338f936c61ccc6256577ed45e1fba14c5c64694')
sha512sums_x86_64=('095b9c06a53db331f6ac83c958067485c69e8d014fcf0f955aa9a26b6454fe6c3ae47359621247f64b245843a9011442d9b3d31422e1e1ff57d9d039697abe4c')

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
