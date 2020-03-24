# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
# Contributor: Bogdan <d0xi at inbox dot ru>
pkgname=cheat
pkgver=3.7.1
pkgrel=1
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('arm' 'armv6h' 'armv7h' 'x86_64')
url="https://github.com/cheat/cheat"
license=('MIT' 'CC0 1.0 Universal')
makedepends=('go-pie' 'git')
optdepends=('bash-completion: for bash completions'
            'fzf: Fuzzy Finder integration for bash-completion'
            'fish: for fish completions')
conflicts=("python-$pkgname" "$pkgname-bash-git" "$pkgname-git")
replaces=("python-$pkgname")
backup=("etc/$pkgname/conf.yml")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        'conf.yml'
        "git+https://github.com/$pkgname/cheatsheets.git"
        "https://raw.githubusercontent.com/$pkgname/cheatsheets/master/.github/LICENSE.txt")
sha256sums=('a24cdd2ab82da6115d0daeeeabedb933f9e40ab48ffeec712f442dba945ed856'
            'efffbe20041efc3d49ffe596ab5abe60a10adf70219c2ddecdf1caf350972212'
            'SKIP'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

prepare() {

	# Add /etc/cheat/ to config file path
	cd "$pkgname-$pkgver"
	sed -i '43 i\
			path.Join("/etc/cheat/conf.yml"),' internal/config/paths.go
}

build() {
	cd "$pkgname-$pkgver"
	GOOS=linux \
	GOARCH=$(go env GOHOSTARCH) \
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
	install -Dm755 "scripts/$pkgname.bash" \
		"$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm755 "scripts/$pkgname.fish" -t "$pkgdir/usr/share/fish/completions"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/$pkgname-LICENSE"

	install -dm755 "$pkgdir/usr/share/$pkgname/cheatsheets/community"
	find "$srcdir/cheatsheets" \
		-maxdepth 1 \
		-type f \
		-perm 644 \
		-exec \
			install -m644 "{}" \
			"$pkgdir/usr/share/$pkgname/cheatsheets/community/" \;
	install -Dm644 "$srcdir/conf.yml" -t "$pkgdir/etc/$pkgname"
	install -Dm644 "$srcdir/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/cheatsheets-LICENSE"
}
