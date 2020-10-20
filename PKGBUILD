# PKGBUILD
# Maintainer: Stewart Borle <stewi014@gmail.com> (https://github.com/stewi1014)

# Upstream
# Maintainer: Kernec (https://github.com/kernc)

pkgname=xsuspender-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Automatically suspend inactive X11 applications"
arch=('x86_64')
url="https://github.com/kernc/xsuspender"
license=('custom:WTFPL')
depends=('glib2' 'libwnck3')
makedepends=('git' 'cmake' 'make' 'pkgconf')
source=("$pkgname"::'git+https://github.com/kernc/xsuspender.git#branch=master')
md5sums=('SKIP')

pkgver() { 
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

check() {
    cd "$srcdir/$pkgname"
    make test
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    mkdir -p "$pkgdir/etc/xdg/autostart/"
    mv "$pkgdir/usr/etc/xdg/autostart/xsuspender.desktop" "$pkgdir/etc/xdg/autostart/xsuspender.desktop"
    rm -rf "$pkgdir/usr/etc"
}
