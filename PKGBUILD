# Maintainer: Eldred Habert <arch@(my first name).fr>
# Former maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=hister
pkgver=0.20.0
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
depends=('sqlite')
makedepends=('go' 'npm')
optdepends=('postgresql: Alternate database backend')
install=hister.install
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        hister.override.service
        systemd-user.patch
        hister.sysusers)
sha256sums=('211743f169766ce9a8d7b8a4ebd69a9e5d3bd656150e76c7a0e2fe4e1321a623'
            'f5713114859925e53bd9f99d26072bcf07946011545d1e69fbaf09a7623e7e23'
            '44253a839af41fad0d7c2700cc842089b7f8dd0455f8b58d33d4c98a06039538'
            '5f4f3e82c42ba517d0caaa1deb4d3532c4f26cc60e42861bff1c5c6dacf34e9f')
backup=(etc/hister/{hister.env,config.yml})

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export GOPATH="$srcdir"
	export GOFLAGS="-modcacherw"

	go mod download -x
	npm install --workspaces --include=optional
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CGO_ENABLED=1
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="$srcdir"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go generate
	go build -o hister -tags netgo,osusergo,libsqlite3 \
	         -ldflags "-s -w -X main.version=$pkgver" .

	for _shell in bash zsh fish; do
		./hister completion $_shell > hister.$_shell
	done

	# We install in a location suitable for vendor installs.
	sed -i 's,/usr/local/,/usr/,g' contrib/systemd/hister.service
	# Create a separate user service file (taking in the above modification).
	cp contrib/systemd/hister{,-user}.service
	patch --force --forward -p1 <"$srcdir/systemd-user.patch"

	./hister config create >config.yml
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dsm755 hister "$pkgdir/usr/bin/hister"
	install -Dm644 contrib/systemd/hister.service    "$pkgdir/usr/lib/systemd/system/hister.service"
	install -Dm644 "$srcdir/hister.override.service" "$pkgdir/usr/lib/systemd/system/hister.service.d/00-arch.conf"
	install -Dm644 contrib/systemd/hister-user.service "$pkgdir/usr/lib/systemd/user/hister.service"
	install -Dm644 "$srcdir/hister.override.service"   "$pkgdir/usr/lib/systemd/user/hister.service.d/00-arch.conf"
	sed -i 's/DynamicUser=.*/DynamicUser=no/'          "$pkgdir/usr/lib/systemd/user/hister.service.d/00-arch.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 /dev/null  "$pkgdir/etc/hister/hister.env"
	install -Dm644 config.yml "$pkgdir/etc/hister/config.yml"

	install -Dm644 hister.bash "$pkgdir/usr/share/bash-completion/completions/hister"
	install -Dm644 hister.zsh  "$pkgdir/usr/share/zsh/site-functions/_hister"
	install -Dm644 hister.fish "$pkgdir/usr/share/fish/vendor_completions.d/hister.fish"
}
