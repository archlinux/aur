# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml <>

pkgname=hurl-rs
pkgver=4.0.0
_commit="3cad4e38b48811398681ae3a52a37b961e0a2a39"  # git rev-list -n1 ${pkgver}
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2' 'openssl')
makedepends=('cargo' 'git' 'python')
checkdepends=('cargo' 'python' 'python-flask' 'python-lxml' 'python-beautifulsoup4' 'libnetfilter_conntrack' 'squid')
conflicts=('hurl' 'hurl-bin')
options=('!lto')
changelog=CHANGELOG.md
source=("${pkgname}::git+${url}#commit=${_commit}?signed")
sha256sums=('SKIP')
validpgpkeys=('2A8D14993928B676E424009F1283A2B4A0DCAF8D') # hurl-bot <bot@hurl.dev> : https://github.com/hurl-bot.gpg

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

	[[ "$(target/release/hurl -V)" = "hurl ${pkgver} "* ]]

	# run servers required for integration tests as background processes
	trap '((${#PIDS[@]})) && kill ${PIDS[@]} && wait ${PIDS[@]} && PIDS=()' RETURN ERR EXIT
	cd integration || return
	{
		python3 server.py &
		PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8000; do sleep 1; done 2>/dev/null
		python3 ssl/server.py 8001 ssl/server/cert.selfsigned.pem false &
		PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8001; do sleep 1; done 2>/dev/null
		python3 ssl/server.py 8002 ssl/server/cert.pem false &
		PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8002; do sleep 1; done 2>/dev/null
		python3 ssl/server.py 8003 ssl/server/cert.selfsigned.pem true &
		PIDS+=($!)
		until echo -n >/dev/tcp/localhost/8003; do sleep 1; done 2>/dev/null
		squid -d 2 -N -f <(printf '%s\n' 'cache deny all' 'cache_log /dev/null' 'access_log /dev/null' 'http_access allow all' 'http_port 127.0.0.1:3128' 'request_header_add From-Proxy Hello' 'reply_header_add From-Proxy Hello' 'shutdown_lifetime 1 seconds' "pid_filename ${srcdir}/squid.pid") &
		PIDS+=($!)
		until echo -n >/dev/tcp/localhost/3128; do sleep 1; done 2>/dev/null
	}
	cd ../ || return

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features --workspace
}

package() {
	cd "$pkgname"
	install -Dv target/release/hurl{,fmt} -t "$pkgdir/usr/bin"
	install -Dvm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir/usr/share/man/man1"
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
	install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}
