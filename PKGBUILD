# Maintainer: François M. <francois5537 @ gmail.com>

pkgname=manager-accounting
pkgver=15.5.85
pkgrel=1
pkgdesc='Manager is free accounting software for small business'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.manager.io/"
depends=('mono' 'gtk2' 'gtk-sharp-2' 'webkit-sharp')
makedepends=('unzip')
install=manager-accounting.install
options=('!makeflags')
source=("http://download.manager.io/version.txt"
        "http://download.manager.io/$pkgname.zip"
        "fix-path.patch")
sha256sums=('SKIP'
            'SKIP'
            '81e73bbae1a386dc76bd1f8b018868864c802cb242667d18b9d6f005518859f7')

pkgver() {
    cd "$srcdir"
    ver=$(head -n 1 version.txt) | echo $ver
}

prepare() {
    cd "$srcdir"

    # Check checksum
    chksum=($(sed '15q;d' "${pkgname}_${pkgver}.dsc"))
    filesum=($(sha256sum "${pkgname}_${pkgver}.tar.gz"))
    if [ $chksum != $filesum  ]; then
        error "The checksums doesn't match'"
        exit
    fi

    # Extract, patch
    tar --strip-components=1 -zxvf "${pkgname}_${pkgver}.tar.gz"
    patch -p1 -i fix-path.patch
}

package() {
    install -d $pkgdir/usr/{bin,lib,share/{applications,icons}}
    cp -r opt/manager-accounting $pkgdir/usr/lib/
    cp -r usr/share/icons/* $pkgdir/usr/share/icons/
    ln -s /usr/lib/manager-accounting/manager-accounting $pkgdir/usr/bin/manager-accounting
    install -m644 usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/
}
