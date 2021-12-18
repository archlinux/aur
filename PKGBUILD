# Maintainer: Diab Neiroukh <lazerl0rd at thezest dot dev>

pkgbase="zestginx"
pkgver="1.21.4"
pkgrel=1
arch=("any")
pkgname=("zestginx" "zestginx-src")
pkgdesc="A modern, performant, and secure NGINX distribution packed with features."
url="https://github.com/ZestProjects/zestginx"
license=("custom")
depends=(
	"geoip"
	"libatomic_ops"
	"liburing"
	"libxcrypt"
	"mailcap"
	"mimalloc"
	"pcre"
	"zstd"
)
makedepends=(
	"cmake"
	"git"
	"rust-nightly"
)
source=(
	"git+$url.git"
	"https://nginx.org/LICENSE"
	"logrotate"
	"service"
)
b2sums=(
	"SKIP"
	"fbd993990b43a4476d0963287bdc5f55f73fa5ce828f11977cf1abeedd478729a95861d930e27c6a1b0e78b16397164395afc4473fd34e050cadd32b94336beb"
	"6a8f31fe0c0a91487ae6ff209b0e43f0619ecc4a9eeaaede8c478ce041ac9b0fd94125fab064c9451800e3f5a6002ee80e92541032e3dfc426552bf4fa12dc00"
	"7ed09ce30b7fff528b4c11f95d3ca66cdf8f570a200851525a45235f35ea4719d495134670b0cad03049448e51bd574fd0719508ed232fa526687f5297b7c3be"
)
backup=(
	"etc/logrotate.d/nginx"
	"etc/nginx/fastcgi.conf"
	"etc/nginx/fastcgi_params"
	"etc/nginx/koi-utf"
	"etc/nginx/koi-win"
	"etc/nginx/nginx.conf"
	"etc/nginx/scgi_params"
	"etc/nginx/uwsgi_params"
	"etc/nginx/win-utf"
)

prepare()
{
	cd "$pkgbase"
	git checkout "release-$pkgver"
	git submodule update --init
	cd ..

	cp -r "$pkgbase"{,"-src"}
	rm -rf "$pkgbase-src/.git"
}

build()
{
	cd "$pkgbase"
	./configure \
		--prefix="/etc/nginx" \
		--conf-path="/etc/nginx/nginx.conf" \
		--sbin-path="/usr/bin/nginx" \
		--pid-path="/var/run/nginx.pid" \
		--lock-path="/var/run/lock/nginx.lock" \
		--user="http" \
		--group="http" \
		--http-log-path="/var/log/nginx/access.log" \
		--error-log-path="stderr" \
		--http-client-body-temp-path="/var/lib/nginx/client-body" \
		--http-proxy-temp-path="/var/lib/nginx/proxy" \
		--http-fastcgi-temp-path="/var/lib/nginx/fastcgi" \
		--http-scgi-temp-path="/var/lib/nginx/scgi" \
		--http-uwsgi-temp-path="/var/lib/nginx/uwsgi" \
		--with-ld-opt="-lmimalloc"
	make
}

package_zestginx()
{
	provides=("nginx")
	replaces=("nginx-zest-git")
	conflicts=("nginx")

	cd "$pkgbase"
	make DESTDIR="$pkgdir" install

	sed -e "s|\<user\s\+\w\+;|user html;|g" \
		-e "44s|html|/usr/share/nginx/html|" \
		-e "54s|html|/usr/share/nginx/html|" \
		-i "$pkgdir/etc/nginx/nginx.conf"

	rm "$pkgdir/etc/nginx/"*".default"
	rm "$pkgdir/etc/nginx/mime.types"
	install -d "$pkgdir/var/lib/nginx"
	install -dm700 "$pkgdir/var/lib/nginx/proxy"
	chmod 755 "$pkgdir/var/log/nginx"
	chown "root":"root" "$pkgdir/var/log/nginx"
	install -d "$pkgdir/usr/share/nginx"
	mv "$pkgdir/etc/nginx/html" "$pkgdir/usr/share/nginx/"
	install -Dm644 "../logrotate" "$pkgdir/etc/logrotate.d/nginx"
	install -Dm644 "../service" "$pkgdir/usr/lib/systemd/system/nginx.service"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rmdir "$pkgdir/var/run"
	install -d "$pkgdir/usr/share/man/man8"
	gzip -9c "docs/man/nginx.8" > "$pkgdir/usr/share/man/man8/nginx.8.gz"

	for i in "indent" "ftdetect" "syntax"; do
		install -Dm644 "contrib/vim/$i/nginx.vim" \
			"$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
	done
}

package_zestginx-src()
{
	pkgdesc="The source code of Zestginx, which is useful for building dynamic modules."
	replaces=("nginx-zest-src-git")
	depends=()

	install -d "$pkgdir/usr/src"
	cp -r "$pkgbase-src" "$pkgdir/usr/src/$pkgname"
}
