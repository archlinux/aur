# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Tom Kwok <contact@tomkwok.com>
# Contributor: Jose Valecillos <valecillosjg at gmail dot com>
# Contributor: Guido <qqqqqqqqq9 at web dot de>
# Contributor: Limao Luo <luolimao+AUR at gmail com>
# Contributor: Alexander Fehr <pizzapunk at gmail dot com>
# Olivier Esser: Add needed old versions of lib32-glib2 and lib32-harfbuzz <olivier dot esser at gmail dot com>

pkgname=acroread
pkgver=9.5.5
pkgrel=10
pkgdesc="Adobe Acrobat Reader is a PDF file viewer"
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/reader/"
license=(custom)
optdepends=('acroread-fonts: CJK and extended font packs'
            'libcanberra: XDG sound support'
            'gtk-engine-murrine: fix ugly buttons and scrollbars'
            )
depends=('desktop-file-utils' lib32-{gtk2,libxml2,libxt,mesa,libidn,glu})
optdepends=('acroread-fonts: CJK and extended font packs'
            'lib32-libcanberra: XDG sound support'
            'lib32-gtk-engine-murrine: fix ugly buttons and scrollbars')
options=(!strip)
install=$pkgname.install
source=($pkgname.desktop
        http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/$pkgver/enu/AdbeRdr$pkgver-1_i486linux_enu.bin
        http://archive.virtapi.org/packages/l/lib32-glib2/lib32-glib2-2.56.0%252B7%252Bg66948ae23-1-x86_64.pkg.tar.xz
        http://archive.virtapi.org/packages/l/lib32-harfbuzz/lib32-harfbuzz-1.7.6-2-x86_64.pkg.tar.xz)
noextract=("${source[@]%%::*}")
sha512sums=('178ca8a3abf630195eaebd6a76a7e5ac19165708acd52b99acab2de3d0bdb57fdf81d666edae41a947fa5a3fc14442c86fa855860d5d3d0d3e1db0386c583b96'
            'f9c18ca0dc0687de353afeb90925439a557a14604e6361ff2b229ec29257ff051ea9eac6a90671b38a745473b5c87135377d035520f441ceaabf2510d690675b'
            'd47b60567907c624929086b6dfa529227ae43342fd892bfbcba4c3f07efd4c6625b6756aec41ea0332ee0f4aa9fdba5c952cbbb639b41ae03c6fe41fb0206d33'
            'b9b5a088224cdd04f418eda17e64996fbd09410173c9951ec99aa7827015a3366bb67e641e3a78cd819aba382f7bb0e1a5ebeb2745caaebfb0ae3e78b988a206')
prepare() {
    # Extracting content from bin file
    tail -c+6889 AdbeRdr9.5.5-1_i486linux_enu.bin | xz -qqd | tar x
    mkdir oldlib
    tar -C oldlib -axf lib32-glib2-2.56.0%252B7%252Bg66948ae23-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-harfbuzz-1.7.6-2-x86_64.pkg.tar.xz

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

    msg2 "Copying old libraries"
    install -d "$pkgdir/opt/Adobe/Reader9/Reader/intellinux/lib"
    cp -a oldlib/usr/lib32/* "$pkgdir/opt/Adobe/Reader9/Reader/intellinux/lib"

    cd AdobeReader/Adobe/Reader9/

    msg2 "Installing Main Files..."
    install -d "$pkgdir"/opt/Adobe/Reader9
    cp -a * "$pkgdir"/opt/Adobe/Reader9/

    msg2 "Installing Bin Files..."
    install -d "$pkgdir"/usr/bin/
    ln -s /opt/Adobe/Reader9/bin/acroread "$pkgdir"/usr/bin/
    install -Dm644 Resource/Shell/acroread.1.gz "$pkgdir"/usr/share/man/man1/acroread.1.gz
    install -Dm644 Resource/Shell/acroread_tab "$pkgdir"/etc/bash_completion.d/acroread

    msg2 "Installing Icon Resources..."
    install -Dm644 Resource/Icons/64x64/AdobeReader9.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

    msg2 "Installing License..."
    install -Dm644 Reader/Legal/en_US/License.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
