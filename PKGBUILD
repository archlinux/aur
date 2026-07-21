# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: wobbol <no@spam.com>
# Contributor: Jakob Riepler <aur@chaosfield.at>
# Contributor: Trevor Bergeron <aur@sec.gd>

pkgname=nginx-mod-rtmp-git
_pkgname=nginx-rtmp-module
pkgver=1263.b59d6c8
pkgrel=1
pkgdesc='Module for nginx that adds RTMP, HLS, and MPEG-DASH support'
arch=(i686 x86_64)
url="https://github.com/sergey-dryabzhinsky/$_pkgname"
license=(BSD)
depends=(nginx openssl)
makedepends=(git
             nginx-src)
provides=("$_pkgname"
          "${pkgname%-git}")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	rm -f nginx
	cp -a /usr/src/nginx .
}

pkgver() {
	cd "$_pkgname"
	printf "%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd nginx
	./configure --with-compat --add-dynamic-module="../$_pkgname"
	make modules
}

package() {
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_pkgname/LICENSE"
	install -Dm0755 -t "$pkgdir/usr/lib/nginx/modules/" nginx/objs/ngx_rtmp_module.so
}
