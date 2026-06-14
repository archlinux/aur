# Maintainer: Josef Andersson <josefandersson@tuta.io>
#
# Builds the saur binary from source with bun and installs it. This is a VCS (-git) package;
# update `url`/`source` to the published repo before uploading to the AUR.

pkgname=saur-git
_binname=saur
pkgver=1.0.0
pkgrel=1
pkgdesc="A safer AUR helper with Claude security review baked in"
arch=('x86_64' 'aarch64')
url="https://git.josf.dev/josefandersson/saur"
license=('MIT')
depends=('claude-code')          # runtime: the `claude` CLI (authenticated)
makedepends=('bun' 'git')
provides=('saur')
conflicts=('saur')
source=("${_binname}::git+https://git.josf.dev/josefandersson/saur.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_binname"
	printf "%s.r%s.g%s" \
		"$(awk -F'\"' '/"version"/{print $4; exit}' package.json)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$_binname"
	bun install --frozen-lockfile
	bun build src/main.ts --compile --outfile "$_binname"
}

check() {
	cd "$_binname"
	bun test
}

package() {
	cd "$_binname"
	install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
