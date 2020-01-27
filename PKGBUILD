# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=cheat
pkgver=3.3.1
pkgrel=2
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('arm' 'armv6h' 'armv7h' 'x86_64')
url="https://github.com/cheat/cheat"
license=('MIT' 'CC0 1.0 Universal')
makedepends=('go-pie' 'git')
optdepends=('fzf: for Fuzzy Finder integration'
            'bash-completion: for bash completions'
            'fish: for fish completions')
conflicts=('python-cheat' 'cheat-bash-git' 'cheat-git')
replaces=('python-cheat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheat/cheat/archive/$pkgver.tar.gz"
        'conf.yml'
        'git+https://github.com/cheat/cheatsheets.git'
        'https://raw.githubusercontent.com/cheat/cheatsheets/master/.github/LICENSE.txt')
sha256sums=('a2104f0c7f9a7c00c4792405763406bac99ba89321fb8fc192619a450f1b4c17'
            '1eb318c8c8ada85bf1d63b88244d644ad0657f7f2a2678099a3ae1f6e6d76a1b'
            'SKIP'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

prepare() {

	# Add /etc/cheat/ to config file path
	cd "$pkgname-$pkgver"
	sed -i '34 i\
			path.Join("/etc/cheat/conf.yml"),' internal/config/path.go

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
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/cheat-LICENSE"

	install -dm755 "$pkgdir/usr/share/cheat/cheatsheets/community"
	find "$srcdir/cheatsheets" \
		-maxdepth 1 \
		-type f \
		-perm 644 \
		-exec \
			install -m644 "{}" \
			"$pkgdir/usr/share/$pkgname/cheatsheets/community/" \;
	install -Dm644 "$srcdir/conf.yml" -t "$pkgdir/etc/cheat"
	install -Dm644 "$srcdir/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/cheatsheets-LICENSE"
}
