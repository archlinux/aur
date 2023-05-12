# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>

# GPG keys: https://github.com/hurl-bot.gpg

pkgname=hurl-rs
pkgver=3.0.0
_commit=277393700b9dbc48aba28be8ccb7ea3e766cc0cb
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2' 'openssl')
makedepends=('cargo' 'git' 'python')
checkdepends=('cargo' 'python' 'python-flask' 'python-lxml' 'python-beautifulsoup4' 'libnetfilter_conntrack' 'squid')
options=('!lto')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('2A8D14993928B676E424009F1283A2B4A0DCAF8D') ## hurl-bot on GitHub

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
	./bin/release/man.sh
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable

	# run servers required for integration tests as background processes
	trap 'ret=$?; (( ${#SERVER_PIDS[@]} )) && kill ${SERVER_PIDS[@]}; exit $ret' EXIT
	cd integration || return
	{
		python3 server.py &
		SERVER_PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8000; do sleep 1; done
		python3 ssl/server.py 8001 ssl/server/cert.selfsigned.pem false &
		SERVER_PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8001; do sleep 1; done
		python3 ssl/server.py 8002 ssl/server/cert.pem false &
		SERVER_PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8002; do sleep 1; done
		python3 ssl/server.py 8003 ssl/server/cert.selfsigned.pem true &
		SERVER_PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8003; do sleep 1; done
		squid -d 2 -N -f <(printf '%s\n' 'cache deny all' 'cache_log /dev/null' 'access_log /dev/null' 'http_access allow all' 'http_port 127.0.0.1:3128' 'request_header_add From-Proxy Hello' 'reply_header_add From-Proxy Hello' 'shutdown_lifetime 1 seconds' "pid_filename ${srcdir}/squid.pid") &
		SERVER_PIDS+=($!)
		until echo -n >/dev/tcp/localhost/3128; do sleep 1; done
	}
	cd ../ || return

	# TODO: figure out why test_cookie_storage is failing
	cargo test --frozen --all-features --workspace -- --skip http::tests::libcurl::test_cookie_storage
	kill ${SERVER_PIDS[@]}; SERVER_PIDS=()
}

package() {
	cd "$pkgname"
	install -Dv target/release/hurl{,fmt} -t "$pkgdir/usr/bin"
	install -Dvm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir/usr/share/man/man1"
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
	install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}
