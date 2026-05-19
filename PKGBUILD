# Maintainer: Marko Zajc <marko at zajc period tel>

pkgname=nginx-mod-shapow
pkgver=2.2
pkgrel=0

_modname="${pkgname#nginx-mod-}"

pkgdesc="Nginx module to keep bots out with a proof-of-work challenge"
arch=('x86_64')
makedepends=('nginx' 'nginx-src')
url="https://git.zajc.tel/shapow.git/about"
license=('AGPL-3.0-only')

source=(https://files.zajc.tel/public/builds/$_modname/$pkgver/$_modname-src-$pkgver.tar.xz)
sha256sums=('d954551f2567bcc05509e4d902b2c115eec974b9ea1263fe6678d6f7b015f255')
backup=('etc/nginx/modules.d/19-shapow.conf')

prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src

	sed -i 's|^#define NGX_HTTP_SHAPOW_RESOURCE_ROOT .*|#define NGX_HTTP_SHAPOW_RESOURCE_ROOT "/usr/share/'$pkgname'"|' \
		"$srcdir/$_modname/src/config.h";
}

build() {
	cd build
	auto/configure \
		--with-ld-opt="$LDFLAGS" \
		--with-compat \
		--add-dynamic-module=../$_modname
	make modules
}

package() {
	if [[ "$BUILDTOOL" == devtools ]]; then
		local nginx_dep="nginx=$(nginx -v 2>&1 | sed 's|.*/||')"
		depends+=($nginx_dep)
	else
		depends+=(nginx)
	fi

	install -Dm644 "$srcdir"/$_modname/README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
	install -Dm644 "$srcdir"/$_modname/screenshot.png "$pkgdir"/usr/share/licenses/$pkgname/screenshot.png
	install -Dm644 "$srcdir"/$_modname/resources/challenge.html "$pkgdir"/usr/share/$pkgname/challenge.html
	install -Dm644 "$srcdir"/$_modname/resources/challenge.css "$pkgdir"/usr/share/$pkgname/challenge.css
	install -Dm644 "$srcdir"/$_modname/resources/challenge.js "$pkgdir"/usr/share/$pkgname/challenge.js
	install -Dm644 "$srcdir"/$_modname/resources/challenge-worker.js "$pkgdir"/usr/share/$pkgname/challenge-worker.js
	install -dm0755 "$pkgdir"/etc/nginx/modules.d

	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
		echo "load_module \"/usr/lib/nginx/modules/$mod\";" >> "$pkgdir/etc/nginx/modules.d/19-shapow.conf"
	done
}
