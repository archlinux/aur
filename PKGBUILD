# Maintainer: Koen Hendriks <aur@koenhendriks.nl>

pkgname=laneway-git
pkgver=0.6.1.r0.g2b3f6e5
pkgrel=1
pkgdesc='A terminal board for Jira'
arch=('x86_64' 'aarch64')
url='https://github.com/cornedor/laneway'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('laneway')
conflicts=('laneway')
options=('!lto')
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local tag
	if tag=$(git describe --long --tags 2>/dev/null); then
		printf '%s' "$tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd "$pkgname"
	go mod download -modcacherw
}

build() {
	cd "$pkgname"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
	go build -ldflags "-linkmode=external -X main.version=$pkgver" -o build/laneway .
	local shell
	for shell in bash zsh fish; do
		./build/laneway completion "$shell" >"build/laneway.$shell"
	done
}

check() {
	cd "$pkgname"
	go test -mod=readonly -modcacherw ./...
}

package() {
	cd "$pkgname"
	install -Dm755 build/laneway "$pkgdir/usr/bin/laneway"
	install -Dm644 build/laneway.bash "$pkgdir/usr/share/bash-completion/completions/laneway"
	install -Dm644 build/laneway.zsh "$pkgdir/usr/share/zsh/site-functions/_laneway"
	install -Dm644 build/laneway.fish "$pkgdir/usr/share/fish/vendor_completions.d/laneway.fish"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/guide" docs/guide/*.md
}
