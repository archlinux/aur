# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nginx-mod-nchan
pkgver=1.1.6
pkgrel=2

_nginxver=1.12.1

pkgdesc='nchan nginx module'
arch=('i686' 'x86_64')
depends=('nginx')
url="https://nchan.io/"
license=('MIT')

source=(
    http://nginx.org/download/nginx-$_nginxver.tar.gz
    https://github.com/slact/nchan/archive/v${pkgver}.tar.gz
)


build() {
    cd "$srcdir"/nginx-$_nginxver
    _module_dir="$srcdir"/nchan-$pkgver
    _nginx_configure_options=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@')
    ./configure ${_nginx_configure_options} --add-dynamic-module=${_module_dir}
    make modules
}

package() {
    cd "$srcdir"/nginx-$_nginxver/objs
    for _mod in ngx_nchan_module.so; do
        install -Dm755 $_mod "$pkgdir"/usr/lib/nginx/modules/$_mod
    done
}

sha256sums=('8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb'
            'df037766e3a152d8cf2a8b644dd10db8cac3679523adc3c063d41ffeb20d43bc')
