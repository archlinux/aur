# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeng at proton dot me>

pkgname=mods-git
pkgver=1.7.0.r28.g0e7d29c
pkgrel=1
pkgdesc="Render markdown on the CLI, with pizzazz!"
arch=('i686' 'x86_64')
url="https://github.com/charmbracelet/mods"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("mods=$pkgver")
conflicts=('mods' 'mods-bin')
source=("git+https://github.com/charmbracelet/mods.git")
sha256sums=('SKIP')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -modcacherw"

pkgver() {
	cd "mods"

	_tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
	_rev=$(git rev-list --count $_tag..HEAD)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
	cd "mods"
	go mod tidy
	go build \
		./
	./mods man >"mods.1"
	for shell in bash fish zsh; do
		./mods completion "$shell" >"$shell-completion"
	done
}

check() {
	cd "mods"

	go test \
		./...
}

package() {
	cd "mods"

	install -Dm755 "mods" -t "$pkgdir/usr/bin"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/mods"
	install -Dm644 "mods.1" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "examples" -d "$pkgdir/usr/share/doc/mods"
	install -Dm644 "examples.md" -t "$pkgdir/usr/share/doc/mods"
	install -Dm644 "features.md" -t "$pkgdir/usr/share/doc/mods"
	install -Dm644 "bash-completion" "$pkgdir/usr/share/bash-completion/completions/mods"
	install -Dm644 "fish-completion" "$pkgdir/usr/share/fish/vendor_completions.d/mods.fish"
	install -Dm644 "zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_mods"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/mods"
}
