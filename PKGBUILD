# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=nginx-mainline-mod-traffic-accounting-git
pkgver=r99.43c9b9d
pkgrel=2

_nginxver=1.19.8
_modname="traffic-accounting-nginx-module"

pkgdesc='Monitor the incoming and outgoing traffic metrics in realtime for NGINX (module for mainline nginx) (Git version)'
arch=('i686' 'x86_64' 'aarch64' 'armv7')
depends=("nginx-mainline=$_nginxver")
url="https://github.com/Lax/$_modname"
license=('BSD')

source=(
	"https://nginx.org/download/nginx-$_nginxver.tar.gz"
	"git+https://github.com/Lax/$_modname.git"
)

sha256sums=('308919b1a1359315a8066578472f998f14cb32af8de605a3743acca834348b05'
            'SKIP')

pkgver() {
	cd "$_modname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/nginx-$_nginxver
	./configure --with-compat --with-stream --add-dynamic-module=../"$_modname"
	make modules
}

package() {
	install -Dm644 "$srcdir"/"$_modname"/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd "$srcdir"/nginx-$_nginxver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
