# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=angie-bin
pkgver=Angie-1.10.3 # datasource=github-releases depName=webserver-llc/angie
pkgver=${pkgver#Angie-}
_pkgver="${pkgver}-1"
pkgrel=1
pkgdesc='Actively developing fork of nginx aiming to keep it great with brand new extra functionality.'
arch=('x86_64' 'aarch64')
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

_base='https://download.angie.software/angie/ubuntu/24.04/pool/main/a/angie'
_packages=(
	"angie"
	# "angie-module-auth-jwt"
	# "angie-module-auth-ldap"
	# "angie-module-auth-spnego"
	# "angie-module-brotli"
	# "angie-module-cache-purge"
	# "angie-module-cgi"
	# "angie-module-dav-ext"
	# "angie-module-dynamic-limit-req"
	# "angie-module-echo"
	# "angie-module-enhanced-memcached"
	# "angie-module-eval"
	# "angie-module-geoip2"
	# "angie-module-headers-more"
	# "angie-module-http-auth-radius"
	# "angie-module-image-filter"
	# "angie-module-jwt"
	# "angie-module-keyval"
	# "angie-module-lua"
	# "angie-module-modsecurity"
	# "angie-module-ndk"
	# "angie-module-njs"
	# "angie-module-njs-cli"
	# "angie-module-opentracing"
	# "angie-module-otel"
	# "angie-module-perl"
	# "angie-module-postgres"
	# "angie-module-redis2"
	# "angie-module-rtmp"
	# "angie-module-set-misc"
	# "angie-module-subs"
	# "angie-module-testcookie"
	# "angie-module-unbrotli"
	# "angie-module-upload"
	# "angie-module-vod"
	# "angie-module-vts"
	# "angie-module-wamr"
	# "angie-module-wasm"
	# "angie-module-xslt"
	# "angie-module-zip"
	# "angie-module-zstd"
)

source=()
noextract=()
for package in "${_packages[@]}"; do

	source_aarch64+=( "${_base}/${package}_${_pkgver}~noble_arm64.deb" )
	source_x86_64+=( "${_base}/${package}_${_pkgver}~noble_amd64.deb" )

	noextract+=(
		"${package}_${_pkgver}~noble_arm64.deb"
		"${package}_${_pkgver}~noble_amd64.deb"
	)
done

sha256sums_x86_64=('687b139404de391ce888a9cd4bb6bbf3d1332be6483cad5ac2ba2f216c537311')
sha256sums_aarch64=('70026d26ee26ae0e3c3e6917dd902c1c827e8ffcf84fd572890d4bded756431f')

package() {

	local package_arch='amd64'
	if [[ "${CARCH}" = "aarch64" ]]; then
		package_arch='arm64'
	fi

	cd "${srcdir}"

	for package in "${_packages[@]}"; do
		ar x "${package}_${_pkgver}~noble_${package_arch}.deb"
		tar xf "data.tar.zst" -C "$pkgdir"
	done

	cd "${pkgdir}"
	mv "usr/sbin/" "usr/bin/"

	sed -e 's|\<user\s\+\w\+;|user http;|g' \
		-i "$pkgdir/etc/angie/angie.conf"

	install -Dm644 \
		"usr/share/doc/angie/copyright" \
		"usr/share/licenses/${pkgname}/LICENSE"

	local log_dir="$pkgdir/var/log/angie"

	mkdir -p $log_dir
	chmod 755 $log_dir
	chown root:root $log_dir
}
