# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-professional-8.2.4
pkgver=8.2.4
pkgrel=1
pkgdesc="AnyLogic Professional Edition - for companies and government organizations. Last x86 version"
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
sha256sums_i686=('13e3f9b78b9cc8c30e4170f009e6bd266e0370746aaad11825771ba705307dd0')
sha256sums_x86_64=('cb93b0aa73878a75f0a6c4a16484bcc4b40948185e82bd62439e89e5cab3c777')

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

    msg2 "Copying AnyLogic Professional Edition contents..."
    cp -R "$srcdir/anylogic" "$pkgdir/opt"

    msg2 "Creating .desktop file..."
    gendesk -q -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='AnyLogic Professional Edition' --exec='env SWT_GTK3=0 UBUNTU_MENUPROXY= /opt/anylogic/anylogic'
    install -Dm644 "$srcdir/anylogic/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/anylogic/license/Software Licensing Agreement for AnyLogic.txt" "$pkgdir/usr/share/licenses/anylogic/LICENSE"
}
