# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-ple-8.2.4
pkgver=8.2.4
pkgrel=2
pkgdesc="AnyLogic Personal Learning Edition - for beginners and students. Last x86 version"
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
sha256sums_i686=('d5cd96ea5e1170a7d4e8a9e60a27df0a10b9481bad791347109f77d1c73a3cc7')
sha256sums_x86_64=('e03e6f6046b568595f91330ce9153b562d3c6f3e9e6fe8ef252103073da78400')

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

    msg2 "Copying AnyLogic Personal Learning Edition contents..."
    cp -R "$srcdir/anylogic" "$pkgdir/opt"

    msg2 "Creating .desktop file..."
    gendesk -q -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='AnyLogic Personal Learning Edition' --exec='env SWT_GTK3=0 UBUNTU_MENUPROXY= /opt/anylogic/anylogic'
    install -Dm644 "$srcdir/anylogic/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/anylogic/license/Software Licensing Agreement for AnyLogic.txt" "$pkgdir/usr/share/licenses/anylogic/LICENSE"
}
