# Maintainer: Presence <dan465 at mail dot com>

pkgname=pyobd
pkgver=1.19
pkgrel=3
pkgdesc="An OBD-II compliant car diagnostic tool"
arch=('x86_64')
url="https://github.com/barracuda-fsh/pyobd"
license=('GPL-2.0-only')
makedepends=('pyinstaller' 'python-wxpython' 'python-pyserial' 'python-numpy'
	'python-tornado' 'python-pint' 'icoutils' 'gendesk' 'python-matplotlib'
	'python-certifi' 'python-gobject' 'python-yaml'
	'python-psutil' 'python-charset-normalizer')
depends=('glibc' 'hicolor-icon-theme' 'zlib')
source=(https://github.com/barracuda-fsh/pyobd/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('94ce6f7574cff7ed3a8412002c06a6bea2251fed0bb1f890db33ad080154d10f')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    MPLBACKEND=WxAgg pyinstaller --onefile -w -i pyobd.ico --add-data "pyobd.ico:." pyobd.py
    gendesk -f --pkgname=$pkgname \
    --pkgdesc="$pkgdesc" \
    --name=$pkgname \
    --exec=$pkgname \
    --icon=$pkgname \
    --terminal=false \
    --categories=Development,Utilities

    mkdir -p "$srcdir/icons"
    icotool -x pyobd.ico -o "$srcdir/icons"
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    cd "$srcdir/icons"
    export num=1
    for size in {16,24,32,48,64,72,96,128,256};
    do
    	install -Dm644 ${pkgname}_${num}_${size}x${size}x32.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    	export num=$(($num+1))
    done
}

