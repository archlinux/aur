# Maintainer: ThecaTTony <thecattony at gmx dot com>

pkgname=nginx-mod-length-hiding-filter
pkgver=1.1.1
pkgrel=3

_modname=nginx-length-hiding-filter-module
_nginxver=1.20.0

pkgdesc='Nginx module to append random generated string to the end of HTML response'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('nginx')
url='https://github.com/nulab/nginx-length-hiding-filter-module'
license=('MIT')

source=(https://nginx.org/download/nginx-$_nginxver.tar.gz
	https://github.com/nulab/nginx-length-hiding-filter-module/archive/$pkgver.tar.gz)

sha512sums=('06433bde23610ab27deeb6bf8c78148e4249b603d194c81e71a08fc159caead07ea659510286fb6d02668d53b9afcdaabdde8692480ae83de4a531adc1b930ca'
            '3eebd28808241daf26081126249174704a08aca9c0ff42e00875f7439de49e53e3cdb40e956e388ccb8b8bd5fff0103e97f6f38aa0d84d22f2f6f56295f60bec')

build() {
	cd "$srcdir"/nginx-"$_nginxver"
	opts=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's@^[^:]+: @@')
	IFS=$'\n' opts=( $(xargs -n1 <<< "$opts") )
	./configure "${opts[@]}" \
		--add-dynamic-module=../"$_modname"-"$pkgver"
	make modules
}

package() {
	cd "$srcdir"/nginx-"$_nginxver"/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
