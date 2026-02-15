# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

_modname=nchan
pkgname=nginx-mainline-mod-$_modname
pkgver=1.3.8
pkgrel=1

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx-mainline")
makedepends=('nginx-mainline-src')
url="https://nchan.io/"
license=('MIT')

source=(
    https://github.com/slact/$_modname/archive/v${pkgver}/$_modname-$pkgver.tar.gz
)

prepare() {
    mkdir -p build
    cd build
    ln -sf /usr/src/nginx/auto
    ln -sf /usr/src/nginx/src
}

build() {
    cd build
    auto/configure \
        --with-ld-opt="$LDFLAGS" \
        --with-compat \
        --add-dynamic-module=../$_modname-$pkgver
    make modules
}

package() {
    install -Dm644 "$srcdir"/$_modname-$pkgver/LICENCE \
                   "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
    install -dm0755 "$pkgdir"/etc/nginx/modules.d/

    cd build/objs
    for mod in ngx_*.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
        echo "load_module \"/usr/lib/nginx/modules/$mod\";" >> "$pkgdir/etc/nginx/modules.d/50-${_modname}.conf"
    done
}

sha256sums=('86e40f97bf380cb81d62c279aa0f992c2d8c93ebcfe242cf0be95e5b6ade9a98')
