# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sergey Shatunov <me@prok.pw>

pkgname=nginx-mainline-mod-http-xslt-filter
pkgver=1.17.10
pkgrel=1

_modname="${pkgname#nginx-mainline-mod-}"

pkgdesc='HTTP XSLT module for the Nginx mainline web server'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('nginx-mainline' 'libxslt')
url="https://nginx.org"
license=('custom')

source=(https://nginx.org/download/nginx-$pkgver.tar.gz{,.asc}
)

validpgpkeys=(
	'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('a9aa73f19c352a6b166d78e2a664bb3ef1295bbe6d3cc5aa7404bd4664ab4b83'
            'SKIP')

build() {
	cd "$srcdir"/nginx-$pkgver
	opts=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@')
	IFS=$'\n' opts=( $(xargs -n1 <<< "$opts") )
	./configure "${opts[@]}" --with-http_xslt_module=dynamic
	make modules
}

package() {
	cd "$srcdir"/nginx-$pkgver/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
