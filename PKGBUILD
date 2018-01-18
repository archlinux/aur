#TODO: pkgver
#TODO: fetch version of nginx automatically
#TODO: any hook for nginx upgrades?
#TODO: add nginx vesrion to pkgver - nginxver-pkgver
pkgname=nginx-mod-http-knock
pkgver=a
pkgrel=1

_modname=ngx_http_knock_module
_nginxver=1.13.4

pkgdesc='Nginx module ngx_http_knock_module to guard websites with a secret handshake'
arch=('i686' 'x86_64')
depends=('nginx')
url="https://github.com/PhillipTaylor/ngx_http_knock_module"
license=('MIT')

source=(
	"https://nginx.org/download/nginx-$_nginxver.tar.gz"
	"git+https://github.com/PhillipTaylor/ngx_http_knock_module.git"
)

sha256sums=('de21f3c49ba65c611329d8759a63d72e5fcf719bc6f2a3270e2541348ef1fbba'
            'SKIP')

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --add-dynamic-module=../$_modname
	make modules
}

package() {
	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
