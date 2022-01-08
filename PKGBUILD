# Maintainer: w0rty <mawo97 at gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Abdo Roig-Maranges <abdo.roig@gmail.com>

pkgname=gitlab-glab
_pkgname=${pkgname#gitlab-}
pkgver=1.21.1
pkgrel=2
pkgdesc='Gitlab Cli tool to help work seamlessly with Gitlab from the command line'
arch=(x86_64)
url="https://github.com/profclems/$_pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
options=(!lto)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('878c13d064ca6010437de90ca3711962fd87441fcae39bf01cb0af5aa5efd79e')

build() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	_builddate=${SOURCE_DATE_EPOCH=:$(date -u +%m/%d/%Y)}
	go build \
		-trimpath \
		-buildmode=pie \
		-ldflags "-linkmode=external -extldflags \"$LDFLAGS\" -X main.version=v$pkgver -X main.build=$_builddate -X main.usageMode=prod -s -w" \
		-mod=readonly \
		-modcacherw \
		-o "$_pkgname" \
		./cmd/glab/main.go
	go run ./cmd/gen-docs/docs.go --manpage --path ./
	for s in bash fish zsh; do
		./$_pkgname completion -s $s > $s.completions
	done
}

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "$_pkgname.1"
	install -Dm0644 bash.completions "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm0644 fish.completions "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
	install -Dm0644  zsh.completions "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
