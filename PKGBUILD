# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=nginx-mod-naxsi-git
pkgver=1.3.r45.g740ef82
pkgrel=1
pkgdesc='Nginx Anti XSS & SQL Injection'
arch=('x86_64')
depends=('nginx')
makedepends=('nginx-src')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/wargio/naxsi"
license=('GPL3')
source=('git+https://github.com/wargio/naxsi.git')
sha256sums=('SKIP')
backup=('etc/nginx/naxsi_core.rules')

pkgver() {
    cd $srcdir/naxsi
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/naxsi
    git submodule update --init --recursive
}

build() {
    mkdir build
    cd build

    ln -sf /usr/src/nginx/auto
    ln -sf /usr/src/nginx/src

    /usr/src/nginx/configure --with-compat --add-dynamic-module=../naxsi/naxsi_src
    make modules
}

package() {
    cd $srcdir/build/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done

    cd $srcdir/naxsi
    install -Dm644 naxsi_rules/naxsi_core.rules "$pkgdir"/etc/nginx/naxsi_core.rules
}
