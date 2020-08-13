# Maintainer: RyuaNerin <admin@ryuar.in>
# Contributor: hdhoang <arch@hdhoang.space>
# Contributor: jkl

pkgname=nginx-mainline-mod-fancyindex-git
pkgver=0.4.4
pkgrel=1

_modname="ngx_fancyindex"
_nginxver=1.19.2

pkgdesc='Fancy indexes module for the Nginx web server'
arch=('i686' 'x86_64' 'armv7h')
makedepends=('git')
depends=("nginx-mainline=$_nginxver")
provides=('nginx-mainline-mod-fancyindex')
conflicts=('nginx-mainline-mod-fancyindex')
url="https://github.com/aperezdc/ngx-fancyindex"
license=('CUSTOM')

source=(
	https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
    "$_modname::git+https://github.com/aperezdc/ngx-fancyindex.git"
)
sha256sums=('7c1f7bb13e79433ee930c597d272a64bc6e30c356a48524f38fd34fa88d62473'
            'SKIP'
            'SKIP')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>

prepare() {
    cd "$srcdir"/$_modname
    sed 's@/usr/local@/usr@' -i config
}

build() {
    cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat \
                --add-dynamic-module=../$_modname
	make modules
}

package() {
	install -Dm644 "$srcdir/"$_modname/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
