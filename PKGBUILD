# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

_modname="nginx-module-vts"
pkgname=nginx-mod-vts
pkgver=0.2.2
pkgrel=4
pkgdesc="Nginx virtual host traffic status module"
arch=('x86_64')
makedepends=('nginx' 'nginx-src')
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD-2-Clause')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vozlt/$_modname/archive/v$pkgver.tar.gz)
sha256sums=('9353035331cfc5eec6c129eb8b348dab77f525329d4d60680a76e0c13c085f41')

build() {
    cp -r /usr/src/nginx .

    cd nginx
    ./configure --with-ld-opt="$LDFLAGS" --with-compat --add-dynamic-module=../$_modname-$pkgver
    make modules
}

package() {
	local _nginx_version=$(nginx -v 2>&1)
	_nginx_version=${_nginx_version/* nginx\/}
	depends+=("nginx=${_nginx_version}")

    install -Dm0644 "nginx-module-vts-$pkgver"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

    cd nginx/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
