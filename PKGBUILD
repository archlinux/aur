# Maintainer: eNV25 <env252525@gmail.com>

pkgname=('psiphon-console-client' 'psiphon-server')
pkgbase=psiphon-tunnel-core
pkgver=2.0.20
pkgrel=1
pkgdesc="Psiphon Internet censorship circumvention system."
arch=('i686' 'x86_64')
url="https://github.com/Psiphon-Labs/psiphon-tunnel-core"
license=('GPL')
makedepends=('go')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
install=psiphon.install

export GO111MODULE=off

export CGO_CPPFLAGS="$CPPFLAGS"
export CGO_CFLAGS="$CFLAGS"
export CGO_CXXFLAGS="$CXXFLAGS"
export CGO_LDFLAGS="$LDFLAGS"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

build() {
	function echorun {
		echo "$@"
		"$@"
	}

	mkdir -p go/
	mkdir -p go/src/github.com/Psiphon-Labs/
	ln -sf "../../../../$pkgbase-$pkgver/" go/src/github.com/Psiphon-Labs/psiphon-tunnel-core

	export GOPATH="$srcdir/go/"

	echorun go build \
		-o bin/psiphon-console-client \
		github.com/Psiphon-Labs/psiphon-tunnel-core/ConsoleClient
	echorun go build \
		-o bin/psiphon-server \
		github.com/Psiphon-Labs/psiphon-tunnel-core/Server
}

package_psiphon-console-client() {
	install -Dm755 "$srcdir/bin/psiphon-console-client" -t "$pkgdir/usr/bin/"
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/psiphon-client.service" <<-'EOF'
		[Unit]
		Description=Psiphon Proxy Client Service

		[Service]
		WorkingDirectory=%E/psiphon/
		ExecStart=/usr/bin/psiphon-console-client -config client.config -formatNotices
		Restart=on-failure

		[Install]
		WantedBy=multi-user.target
	EOF
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/psiphon-client.service" <<-'EOF'
		[Unit]
		Description=Psiphon Proxy Client Service

		[Service]
		WorkingDirectory=%E/psiphon/
		ExecStart=/usr/bin/psiphon-console-client -config client.config -formatNotices
		Restart=on-failure

		[Install]
		WantedBy=default.target
	EOF
}

package_psiphon-server() {
	conflicts=('psiphond')
	provides=('psiphond')
	install -Dm755 "$srcdir/bin/psiphon-server" -t "$pkgdir/usr/bin/"
	ln -sf psiphon-server "$pkgdir/usr/bin/psiphond"
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/psiphon-server.service" <<-'EOF'
		[Unit]
		Description=Psiphon Proxy Server Service

		[Service]
		WorkingDirectory=%E/psiphon/
		ExecStart=/usr/bin/psiphond run
		Restart=on-failure

		[Install]
		WantedBy=multi-user.target
	EOF
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/psiphon-server.service" <<-'EOF'
		[Unit]
		Description=Psiphon Proxy Server Service

		[Service]
		WorkingDirectory=%E/psiphon/
		ExecStart=/usr/bin/psiphond run
		Restart=on-failure

		[Install]
		WantedBy=default.target
	EOF
}

# sums
sha256sums=('fb19a312566647ba10cc075e6d04c616202c52d8922d19b43f83f3447bca7506')
