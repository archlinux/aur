# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=nginx-mod-vts
pkgver=0.1.18
pkgrel=1

_modname="nginx-module-vts"
_nginxver="1.18.0"

pkgdesc="Nginx virtual host traffic status module"
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    http://nginx.org/download/nginx-$_nginxver.tar.gz.asc
    https://github.com/vozlt/$_modname/archive/v$pkgver.tar.gz
)
sha256sums=('4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99'
            'SKIP'
            '17ea41d4083f6d1ab1ab83dad9160eeca66867abe16c5a0421f85a39d7c84b65')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8')

build() {
    cd "$srcdir"/nginx-$_nginxver

    ./configure --with-compat --add-dynamic-module=../$_modname-$pkgver

    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done

    install -Dm0644 "${srcdir}/nginx-module-vts-$pkgver"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
