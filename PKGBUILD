pkgname=nginx-totp-auth
pkgver=r16.09bf6d9
pkgrel=3
pkgdesc="totp auth for nginx"
arch=(x86_64 i686)
url="https://github.com/davidgfnet/nginx_totp_auth"
license=('')
depends=('spawn-fcgi' 'fcgi' 'libconfig' 'openssl')
makedepends=('git' 'python')
source=('git+https://github.com/davidgfnet/nginx_totp_auth.git'
	'nginx-totp-auth.service'
	'nginx-totp-only-auth.service'
	'remove-password.patch')
sha256sums=('SKIP'
            'cfdf3cbd84be9791800124cd87e1b5ff1d430a7d38309e4b6052e105f51ca245'
            'e24859e92386dbb50661063328d3ac66975367a2772def43e075114667ec35d8'
            '814119238c3030f00f408d7f1e42718c1b31351a55ad7cb96579e41f995488bd')

pkgver() {
	cd "$srcdir/nginx_totp_auth"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/nginx_totp_auth"
	make
	mv server.bin nginx-totp-auth.bin
	patch -p1 <../remove-password.patch
	make
	mv server.bin nginx-totp-only-auth.bin
}

package() {
	cd "$srcdir/nginx_totp_auth"
	install -Dm0755 nginx-totp-auth.bin "$pkgdir"/usr/lib/$pkgname/nginx-totp-auth.bin
	install -Dm0755 nginx-totp-only-auth.bin "$pkgdir"/usr/lib/$pkgname/nginx-totp-only-auth.bin
	install -Dm0644 nginx.config.sample "$pkgdir"/usr/share/doc/$pkgname/nginx.config.sample
	install -Dm0644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
	install -Dm0644 ../nginx-totp-auth.service "$pkgdir"/usr/lib/systemd/system/nginx-totp-auth.service
	install -Dm0644 ../nginx-totp-only-auth.service "$pkgdir"/usr/lib/systemd/system/nginx-totp-only-auth.service
}
