# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=tidb-git
pkgver=9.0.0.alpha.386.gc902ad1f4cb
pkgrel=1
pkgdesc="Distributed NewSQL database compatible with MySQL protocol"
arch=('i686' 'x86_64')
url="https://pingcap.com/"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'git')
source=(git+https://github.com/pingcap/tidb.git
        tidb.service
        tidb.user
        tidb.tmpfile)
backup=(etc/tidb/config.toml)
sha256sums=('SKIP'
            'd7694b2c69447e05b2995c7c09b5735eb9766f5c405311822614971bbcf73544'
            'e8e60176eca71d4f930828e9e152c3bae4db70cff409a7557f12e145700e4a03'
            '30ce83fbec8f102c30e438282bb5b18c026d08480f2386d68f1116c12481bf66')

pkgver() {
	cd "$srcdir"/tidb
	git describe --tags --always | sed 's/-/./g;s/^v//'
}

prepare() {
	mkdir -p src/github.com/pingcap
	cd src/github.com/pingcap
	rm -f tidb
	ln -s "$srcdir/tidb"

	cd tidb
	sed -r \
	    -e 's@"0\.0\.0\.0"@"127.0.0.1"@' \
	    -e 's@^path = "/tmp/tidb"@path = "/var/lib/tidb"@' \
	    -e 's@^socket = "/tmp/tidb-\{Port\}\.sock"@socket = "/run/tidb/tidb.sock"@' \
		-i pkg/config/config.toml.example
}

build() {
	export GOPATH="$srcdir"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	export PATH="$PATH:$GOPATH/bin"
	cd src/github.com/pingcap/tidb
	LDFLAGS= make
}

#check() {
#	export GOPATH="$srcdir"
#	export PATH="$PATH:$GOPATH/bin"
#	cd src/github.com/pingcap/tidb
#	make test
#}

package() {
	export GOPATH="$srcdir"
	export PATH="$PATH:$GOPATH/bin"

	install -Dm644 "$srcdir/tidb/pkg/config/config.toml.example" "$pkgdir"/etc/tidb/config.toml
	install -Dm644 tidb.service "$pkgdir"/usr/lib/systemd/system/tidb.service
	install -Dm644 tidb.user "$pkgdir"/usr/lib/sysusers.d/tidb.conf
	install -Dm644 tidb.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/tidb.conf

	cd src/github.com/pingcap/tidb
	install -Dm755 bin/tidb-server "$pkgdir"/usr/bin/tidb-server
}
