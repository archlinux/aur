# Maintainer: Sergey Shatunov <me@aur.rocks>
pkgname=ferretdb
pkgver=2.1.0
pkgrel=1
pkgdesc="FerretDB is a proxy that converts MongoDB queries to SQL and uses PostgreSQL as the database engine."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://www.ferretdb.com/"
license=('Apache-2.0')
makedepends=('go' 'git')
provides=('mongodb')
source=("ferretdb::git+https://github.com/FerretDB/FerretDB.git?signed#tag=v$pkgver"
        'ferretdb@.service'
        'ferretdb.target'
        'ferretdb.sysusers'
        'ferretdb.tmpfiles')
sha256sums=('9cc1884c586e8c59bd771bed4cf7a77266fc300eee2674ab0fecc352eed0da56'
            'b3516e8f231a47a1a3db6da17eca95cecb2d7853851b41680bba7b8eb6c2c651'
            '8bcca7a750e30b46ec3da089515563d214f6b79ee910ff5567e30857e96cb163'
            'deee0ed48bbf015aa230f9cf87764217ddd039dfec19172518db3db902cdda22'
            '7e008a8c1df6bd8cc63168d55d8d0e742e97109d5f7dcddde0ea2bc2b11ddb6a')
validpgpkeys=(
	'968479A1AFF927E37D1A566BB5690EEEBB952194' # GitHub signing key
	'4A015C3F33A17284E0C86FB95D251E1E0E83558A' # Alexey Palazhchenko
)

# Ignore git filters from user's home directory config
export GIT_CONFIG_GLOBAL=/dev/null

prepare() {
	cd "$srcdir/$pkgname"
	echo 'archlinux' > build/version/package.txt
	echo "v$pkgver" > build/version/version.txt
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o bin/ ./cmd/ferretdb/
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 bin/ferretdb "$pkgdir"/usr/bin/ferretdb
	install -Dm644 "$srcdir/ferretdb@.service" "$pkgdir"/usr/lib/systemd/system/ferretdb@.service
	install -Dm644 "$srcdir/ferretdb.target" "$pkgdir"/usr/lib/systemd/system/ferretdb.target
	install -Dm644 "$srcdir/ferretdb.sysusers" "$pkgdir"/usr/lib/sysusers.d/ferretdb.conf
	install -Dm644 "$srcdir/ferretdb.tmpfiles" "$pkgdir"/usr/lib/tmpfiles.d/ferretdb.conf
}
