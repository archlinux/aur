# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=wingide
pkgver=5.1.5
pkgrel=1
_pkgrel=1
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('i686' 'x86_64')
[ "$CARCH" = 'i686' ] && _pkgarch=i386
[ "$CARCH" = 'x86_64' ] && _pkgarch=x86_64
source_x86_64=("http://wingware.com/pub/$pkgname/$pkgver/$pkgname-$pkgver-$_pkgrel-x86_64-linux.tar.gz")
source_i686=("http://wingware.com/pub/$pkgname/$pkgver/$pkgname-$pkgver-$_pkgrel-i386-linux.tar.gz")
depends=('hicolor-icon-theme' 'libpng' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
md5sums_i686=('a5cfa7e893eb9a44cde19eb920ea79fb')
md5sums_x86_64=('a72d36891b71915ad433836e1fcd57d4')
install=${pkgname}.install

prepare() {
    cd "$srcdir/$pkgname-$pkgver-$_pkgrel-$_pkgarch-linux"
    sed -i 's/python/python2/' wing-install.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver-$_pkgrel-$_pkgarch-linux"
    ./wing-install.py \
        --install-binary \
        --winghome "${pkgdir}/opt/${pkgname}" \
        --bin-dir ${pkgdir}/usr/bin > /dev/null 2>&1

    # Correct the WINGHOME environment variable
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wingdbstub.py
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wing

    # Correct ARCH environment variable
    sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/wingide/run-wing.sh
    # Fix a bug in the script
    sed -i "s|'x86_64'\]|'x86_64' \]|" ${pkgdir}/opt/wingide/run-wing.sh

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod +x ${pkgdir}/opt/${pkgname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
