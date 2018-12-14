# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Maintainer: raininja <dandenkijin@gmail.com>
pkgname=slimjet
pkgver=21.0.7.0
pkgrel=1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('i686' 'x86_64')
url="http://www.slimjet.com"
license=('custom:freeware')
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gtk2' 'harfbuzz' 'harfbuzz-icu' 'hicolor-icon-theme'
         'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'openssl' 'nspr' 'opus' 'snappy' 'speech-dispatcher' 'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
makedepends=('pacman>=4.2.0')
provides=('slimjet')
options=('!emptydirs' '!strip')
replaces=('slimjet')
_channel=release
source_i686=("${pkgname}-${pkgver}_i386.deb::http://www.slimjet.com/${_channel}/${pkgname}_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.slimjet.com/${_channel}/${pkgname}_amd64.deb")
source=('LICENSE')
md5sums=('e2f3d75bbf4ea8cef106adb30c6b4c83')
md5sums_i686=('7b5bb36816aac3b1a307034470709f58')
md5sums_x86_64=('86b2a2df8b91a2369c071c583dfacd82')


package() {
    msg2 "Extracting the data tarball..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"

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

    add_license_note() {
    mkdir "$pkgdir/usr/share/licenses/"
    install  "/$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}"
    }

    # Arch has  libudev.so.1, slimjet wants .0
    _libudev_0=libudev.so.0
    _libudev_1=libudev.so.1

    add_udev_symlinks() {
    ln -snf "/$_libdir/$_libudev_1" "$pkgdir/opt/slimjet/$_libudev_0"
    }

    msg2 "Adding udev and crypto symlinks, and a LICENSE ..."
    add_udev_symlinks
    add_crypto_symlinks
    add_license_note

    msg2 "Adding Icons..."
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$pkgdir"/opt/slimjet/product_logo_${i/x*}.png \
                       "$pkgdir"/usr/share/icons/hicolor/$i/apps/flashpeak-slimjet.png
    done
}
