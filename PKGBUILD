# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-university-8.2.4
pkgver=8.2.4
pkgrel=1
pkgdesc="AnyLogic University Edition - for public research in universities. Last x86 version"
arch=(i686 x86_64)
url="https://www.anylogic.com"
license=('custom')
depends=('glibc')
makedepends=('gendesk')
optdepends=('chromium: alternative browser for model animating'
            'firefox: alternative browser for model animating')
provides=('anylogic')
conflicts=('anylogic')
options=(!strip)
source_i686=("https://files.anylogic.com/$pkgname.linux.i586.tgz.bin")
source_x86_64=("https://files.anylogic.com/$pkgname.linux.x86_64.tgz.bin")
sha256sums_i686=('c45b2b736b9fbbf51119e09947b5250bc0057279b0e5c89b5cd3118d16ec1932')
sha256sums_x86_64=('a8d0fe1d1482d103349b6bb29d536ace98fe4f87f8fe36ee5cc624445809a01d')

prepare() {
    msg2 "Unpacking archive..."
    if [ "$CARCH" == "x86_64" ]
    then
        tail -n +279 "$srcdir/$pkgname.linux.x86_64.tgz.bin" > "$pkgname.linux.x86_64.tgz"
    elif [ "$CARCH" == "i686" ]
    then
        tail -n +279 "$srcdir/$pkgname.linux.i586.tgz.bin" > "$pkgname.linux.i586.tgz"
    fi

    msg2 "Extracting archive..."
    if [ "$CARCH" == "x86_64" ]
    then
        tar -xf $pkgname.linux.x86_64.tgz
    elif [ "$CARCH" == "i686" ]
    then
        tar -xf $pkgname.linux.i586.tgz
    fi
}

package() {
    mkdir -p "$pkgdir/opt"

    msg2 "Copying AnyLogic University Edition contents..."
    cp -R "$srcdir/anylogic" "$pkgdir/opt"

    msg2 "Creating .desktop file..."
    gendesk -q -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='AnyLogic University Edition' --exec='env SWT_GTK3=0 UBUNTU_MENUPROXY= /opt/anylogic/anylogic'
    install -Dm644 "$srcdir/anylogic/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/anylogic/license/Software Licensing Agreement for AnyLogic.txt" "$pkgdir/usr/share/licenses/anylogic/LICENSE"
}
