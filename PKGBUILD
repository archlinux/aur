# Maintainer: Eldred Habert <arch@(my first name).fr>
# Former maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=hister-git
pkgver=0.19.0.r38.g79e6584
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
depends=('sqlite')
makedepends=('go' 'npm' 'git')
optdepends=('postgresql: Alternate database backend')
provides=("hister=$pkgver")
conflicts=('hister')
install=hister.install
options=(!lto)
source=("$pkgname::git+https://github.com/asciimoo/hister.git"
        hister.override.service
        systemd-user.patch
        hister.sysusers)
sha256sums=('SKIP'
            'f5713114859925e53bd9f99d26072bcf07946011545d1e69fbaf09a7623e7e23'
            '6e447007916c143ac4a3389718b3529d54e84d36acdb8d93c070432f966ca4b9'
            '5f4f3e82c42ba517d0caaa1deb4d3532c4f26cc60e42861bff1c5c6dacf34e9f')
backup=(etc/hister/{hister.env,config.yml})

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.g%s" \
			"$(git rev-list --count HEAD)" \
			"$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	export GOPATH="$srcdir"
	export GOFLAGS="-modcacherw"

	go mod download -x
	npm install --workspaces --include=optional
}

build() {
	cd "$srcdir/$pkgname"
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

	./hister create-config >config.yml
}

package() {
	cd "$srcdir/$pkgname"
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
