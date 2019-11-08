# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Jameson Pugh <imntreal at gmail dot com>
# Co-Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=cheat
pkgver=3.0.5
pkgrel=1
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('x86_64')
url="https://github.com/cheat/cheat"
license=('MIT')
makedepends=('go-pie')
optdepends=('fzf: for Fuzzy Finder integration'
            'bash-completion: for bash completions'
            'fish: for fish completions')
conflicts=('cheat-bash-git' 'cheat-git')
replaces=('python-cheat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheat/cheat/archive/$pkgver.tar.gz"
        'conf.yml'
        'git+https://github.com/cheat/cheatsheets.git')
sha256sums=('67d1eae872657de7a6405c6f288926f5ad3fcb2de17acebaee624a95dd408a20'
            'ddb53e68a39d0f33b210383724721a162f561e8766434fa1cf062c36e5af76c0'
            'SKIP')

prepare() {

	# create gopath
	mkdir -p "$srcdir/gopath"
	export GOPATH="$srcdir/gopath"

	# fetch dependencies
	msg "Fetching Go dependencies"
	cd "$pkgname-$pkgver"
	go get -d ./...
	
	cd "$srcdir/cheatsheets"
	git submodule init
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
	install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 scripts/fzf.bash "$pkgdir/usr/share/$pkgname/fzf.bash"
	install -Dm755 "scripts/$pkgname-autocompletion.bash" \
		"$pkgdir/usr/share/bash-completion/completions/cheat"
	install -Dm755 "scripts/$pkgname-autocompletion.fish" \
		"$pkgdir/usr/share/fish/completions/cheat.fish"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	
	install -dm644 "$pkgdir/usr/share/$pkgname/cheatsheets/community"
	cp "$srcdir/"cheatsheets/* "$pkgdir/usr/share/$pkgname/cheatsheets/community"
	install -Dm744 "$srcdir/conf.yml" "$pkgdir/etc/cheat/conf.yml"
}
