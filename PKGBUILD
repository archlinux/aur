# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=angie-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='Actively developing fork of nginx aiming to keep it great with brand new extra functionality.'
arch=("x86_64" "aarch64")
url='https://en.angie.software/'
license=('BSD-2-Clause')

depends=(
	"bash"
	"glibc"
	"libxcrypt-compat"
	"openssl"
	"pcre2"
	"zlib"
)

backup=(
	"etc/angie/angie.conf"
	"etc/angie/fastcgi.conf"
	"etc/angie/fastcgi_params"
	"etc/angie/http.d/default.conf"
	"etc/angie/prometheus_all.conf"
	"etc/angie/scgi_params"
	"etc/angie/uwsgi_params"
	"etc/logrotate.d/angie"
)

_baseurl="https://download.angie.software/angie/ubuntu/24.04/pool/main/a/angie"

source_aarch64=("${_baseurl}/angie_${pkgver}-1~noble_arm64.deb")
source_x86_64=("${_baseurl}/angie_${pkgver}-1~noble_amd64.deb")

sha256sums_x86_64=('5eb3d9adc4b4ef07ed509aa9b2525795ffc527519d7f20f39687e546785bd64c')
sha256sums_aarch64=('2247b27075c9e5f6e06648029891d6780707e7f9920f4c2a87c28f864df4f1df')

package() {

	tar xf "data.tar.zst" -C "$pkgdir"

	cd "${pkgdir}"
	mv "usr/sbin/" "usr/bin/"

	sed -e 's|\<user\s\+\w\+;|user http;|g' \
		-i "$pkgdir/etc/angie/angie.conf"

	install -Dm644 \
		"usr/share/doc/angie/copyright" \
		"usr/share/licenses/angie-bin/LICENSE"

	local log_dir="$pkgdir/var/log/angie"

	mkdir -p $log_dir
	chmod 755 $log_dir
	chown root:root $log_dir
}
