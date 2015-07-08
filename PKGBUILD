# Maintainer: Tom Kwok <contact@tomkwok.com>
# Contributor: Jose Valecillos <valecillosjg at gmail dot com>
# Contributor: Guido <qqqqqqqqq9 at web dot de>
# Contributor: Limao Luo <luolimao+AUR at gmail com>
# Contributor: Alexander Fehr <pizzapunk at gmail dot com>

pkgname=acroread
pkgver=9.5.5
pkgrel=5
pkgdesc="Adobe Reader is a PDF file viewer"
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/reader/"
license=(custom)
depends=('desktop-file-utils' 'gtk2' 'libxml2' 'libxt' 'mesa' 'pangox-compat' 'libidn')
optdepends=('acroread-fonts: CJK and extended font packs'
            'libcanberra: XDG sound support'
            'gtk-engine-murrine: fix ugly buttons and scrollbars'
            )
if [[ $CARCH == "x86_64" ]]; then
   depends=('desktop-file-utils' lib32-{gtk2,libxml2,libxt,mesa,libidn} 'pangox-compat') &&
   optdepends=('acroread-fonts: CJK and extended font packs'
            'lib32-libcanberra: XDG sound support'
            'lib32-gtk-engine-murrine: fix ugly buttons and scrollbars'
            )
fi
# optdepends=("${optdepends[@]/lib32-/}")
options=(!strip)
install=$pkgname.install
source=($pkgname.desktop
    http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/$pkgver/enu/AdbeRdr$pkgver-1_i486linux_enu.bin)
noextract=("${source[@]%%::*}")
sha256sums=('6f72d131fd3ceadead6573fd9520fa073007442ba40b58d457e73c3599fe4173' 
            'f3d060c1ab475a649dec6316c0b5a4a7e1055f9681ec2f35b4f77a070dfb3ea2')
sha512sums=('e8ee711536892ced9a0f932c8cf44332dabf10754139f93229dd1d38113bf6521ea3fc42a8a54170c85ef9da009d6ae34233cdda8bf798e2f5bf6e0ae61e37d1' 
            'f9c18ca0dc0687de353afeb90925439a557a14604e6361ff2b229ec29257ff051ea9eac6a90671b38a745473b5c87135377d035520f441ceaabf2510d690675b') 
prepare() {
    # Extracting content from bin file
    tail -c+6889 AdbeRdr9.5.5-1_i486linux_enu.bin | xz -qqd | tar x
}

build() {
    cd AdobeReader/
    bsdtar -xf COMMON.TAR
    bsdtar -xf ILINXR.TAR

    sed -i "s/_filedir/&_acroread/" Adobe/Reader9/Resource/Shell/acroread_tab
    # Bug on log created by Adobe Reader browser plugin https://bugs.launchpad.net/ubuntu/+source/acroread/+bug/986841
    sed -i 's#C:\\nppdf32Log\\debuglog\.txt#/dev/null\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00#g' \
Adobe/Reader9/Browser/intellinux/nppdf.so
}

package() {
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    cd AdobeReader/Adobe/Reader9/

    msg2 "Installing Main Files..."
    install -d "$pkgdir"/opt/Adobe/Reader9
    cp -a * "$pkgdir"/opt/Adobe/Reader9/

    msg2 "Installing Bin Files..."
    install -d "$pkgdir"/usr/bin/
    ln -s /opt/Adobe/Reader9/bin/acroread "$pkgdir"/usr/bin/
    install -Dm644 Resource/Shell/acroread.1.gz "$pkgdir"/usr/share/man/man1/acroread.1.gz
    install -Dm644 Resource/Shell/acroread_tab "$pkgdir"/etc/bash_completion.d/acroread

    msg2 "Installing Browser Plugin..."
    install -d "$pkgdir"/usr/lib/mozilla/plugins/
    ln -s /opt/Adobe/Reader9/Browser/intellinux/nppdf.so "$pkgdir"/usr/lib/mozilla/plugins/

    msg2 "Installing Icon Resources..."
    install -Dm644 Resource/Icons/64x64/AdobeReader9.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

    msg2 "Installing License..."
    install -Dm644 Reader/Legal/en_US/License.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
