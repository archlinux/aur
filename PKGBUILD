# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

_mod_name=nchan
pkgname=nginx-mod-$_mod_name
pkgver=1.2.8
pkgrel=1

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=("nginx")
makedepends=('nginx-src')
url="https://nchan.io/"
license=('MIT')

source=(
    https://github.com/slact/$_mod_name/archive/v${pkgver}.tar.gz
)

prepare() {
    cp -r /usr/src/nginx .
}

build() {
    _module_dir="$srcdir"/$_mod_name-$pkgver

    cd "$srcdir"/nginx
    ./configure --with-compat --add-dynamic-module=$_module_dir
    make modules
}

package() {
    _module_dir="$srcdir"/$_mod_name-$pkgver

    install -Dm644 "${_module_dir}"/LICENCE \
               "$pkgdir"/usr/share/licenses/$pkgname/LICENCE

    cd "$srcdir"/nginx/objs
    for _mod in ngx_*_module.so; do
        install -Dm755 $_mod "$pkgdir"/usr/lib/nginx/modules/$_mod
    done
}

sha256sums=('de42e8d4fef6aef9e4c7303a7480adfe9545992470a7f6be008de7a4bb64cc98')
