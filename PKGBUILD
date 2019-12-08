# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Jameson Pugh <imntreal at gmail dot com>
# Co-Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=cheat
pkgver=3.0.7
pkgrel=3
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('x86_64')
url="https://github.com/cheat/cheat"
license=('MIT')
makedepends=('go-pie' 'git')
optdepends=('fzf: for Fuzzy Finder integration'
            'bash-completion: for bash completions'
            'fish: for fish completions')
conflicts=('cheat-bash-git' 'cheat-git')
replaces=('python-cheat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheat/cheat/archive/$pkgver.tar.gz"
        'conf.yml'
        'git+https://github.com/cheat/cheatsheets.git')
sha256sums=('ca503a7125a753cea84da6367f28dd07153513ecabef8d9761c1bc3c543ce240'
            '1c3a6ebb65d3a91f9f9711dfaf81463f6b68b9e73fe341720946dd31b311d35b'
            'SKIP')

prepare() {

	# create gopath
	mkdir -p "$srcdir/gopath"
	export GOPATH="$srcdir/gopath"

	# fetch dependencies
	msg "Fetching Go dependencies"
	cd "$srcdir/$pkgname-$pkgver"
	go get -d ./...
}

build() {
	cd "$pkgname-$pkgver"
	GOOS=linux \
	GOARCH=amd64 \
	go build \
		-v \
		-trimpath \
		-buildmode=pie \
		-gcflags "all=-trimpath=$srcdir" \
		-asmflags "all=-trimpath=$srcdir" \
		-ldflags "-extldflags $LDFLAGS" \
		-o "./dist/$pkgname" "./cmd/$pkgname"

	# Clean mod cache for makepkg -C
	go clean -modcache
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "dist/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm755 scripts/fzf.bash -t "$pkgdir/usr/share/$pkgname"
	install -Dm755 "scripts/$pkgname-autocompletion.bash" \
		"$pkgdir/usr/share/bash-completion/completions/cheat"
	install -Dm755 "scripts/$pkgname-autocompletion.fish" \
		"$pkgdir/usr/share/fish/completions/cheat.fish"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "${pkgdir}/usr/share/cheat/cheatsheets/community"
    find "$srcdir/cheatsheets" \
        -maxdepth 1 \
        -type f \
        -perm 644 \
        -exec \
            install -m644 "{}" \
            "$pkgdir/usr/share/$pkgname/cheatsheets/community/" \;
	install -Dm644 "$srcdir/conf.yml" -t "$pkgdir/etc/cheat"
}
