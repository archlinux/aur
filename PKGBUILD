# Maintainer: eNV25 <env252525@gmail.com>

pkgname=('psiphon-console-client' 'psiphon-server')
pkgbase=psiphon-tunnel-core
pkgver=2.0.30
pkgrel=1
pkgdesc="Psiphon Internet censorship circumvention system."
arch=('i686' 'x86_64')
_gomod="github.com/Psiphon-Labs/psiphon-tunnel-core"
url="https://$_gomod"
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

if (( $(vercmp "$(go version | cut -d' ' -f3)" go1.21) >= 0 )); then
	export GOFLAGS+=" -tags=PSIPHON_DISABLE_QUIC "
fi

build() {
	function echorun {
		echo "$@"
		"$@"
	}

	mkdir -vp "$srcdir/go/src/$(dirname "$_gomod")"
	ln -srvf "$srcdir/$pkgbase-$pkgver/" "$srcdir/go/src/$_gomod"

	export GOPATH="$srcdir/go/"

	echorun go build \
		-o bin/psiphon-console-client \
		"$_gomod/ConsoleClient"
	echorun go build \
		-o bin/psiphon-server \
		"$_gomod/Server"
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
	ln -srf "$pkgdir/usr/bin/psiphon-server" "$pkgdir/usr/bin/psiphond"
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
sha256sums=('e6a533288ae5f9595ac6080dbc1fe5c267ea4db839f1667bc77b5920ae2e33fd')
