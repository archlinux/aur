# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=filr-client
pkgver=3.4.0.31
pkgrel=1
pkgdesc='Synchronization client for files from the Filr server'
arch=('any')
url="https://www.microfocus.com/de-de/products/filr/"
license=('custom:MicroFocus')
depends=('python2-wxpython3' 'python2-watchdog' 'python2-pyopenssl' 'python2-pyasn1' 'python2-keyring' 'python2-suds')
makedepends=('python2')

# You will need to download the package from your filr server:
source=('https://your.filr.server/desktopapp/novellfilr/linux/FilrLinuxClient.tar.bz2'
        'filr.sh'
        'filr.desktop')
sha256sums=('9ac2bdfff3213c6fe122dde8bc46f31c3e3e39115f4275e5b66d195aa0158f8b'
            '1a41d3e6563455e00bf0d9a0cc602627a930498d326368edde56d368c9c53d08'
            'd985da0af1ef9e67acf3d5dc2849ae75c6a3dbef679b7eaf6196798d65ce40dc')

prepare() {
    cd "FilrLinuxClient/DEBS/"
    bsdtar --extract -f filr-linux-desktop.deb

    mkdir -p "$srcdir/$pkgname-$pkgver"
    bsdtar -C "$srcdir/$pkgname-$pkgver" --extract -f data.tar.xz
}

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/"
    cp -R "usr/src/packages/target/filr/build/lib.linux-x86_64-2.7/aca" "$pkgdir/usr/lib/python2.7/site-packages/"

    mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/novel_filr"
    cp "usr/src/packages/target/filr/build/lib.linux-x86_64-2.7/mainapp.py" "$pkgdir/usr/lib/python2.7/site-packages/novel_filr/"
    cp "usr/src/packages/target/filr/build/scripts-2.7/filr.py" "$pkgdir/usr/lib/python2.7/site-packages/novel_filr/"
    touch "$pkgdir/usr/lib/python2.7/site-packages/novel_filr/__init__.py"

    mkdir -p "$pkgdir/usr/share/$pkgname/"
    cp -r "usr/lib/python2.7/dist-packages/novell/filr/"{certs,conf,icons,locale,templates} "$pkgdir/usr/share/$pkgname/"

    install -Dm644 "$srcdir/FilrLinuxClient/micro-focus-beta-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/filr.desktop" "$pkgdir/usr/share/applications/filr.desktop"
    install -Dm755 "$srcdir/filr.sh" "$pkgdir/usr/bin/filr"

    python2 -m compileall -d /usr/lib "$pkgdir/usr/lib"
    python2 -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
