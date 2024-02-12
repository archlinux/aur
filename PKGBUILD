# Maintainer: Rajdeep Malakar <rajdeepm.dev@gmail.com>

pkgname="pkgx-git"
_pkgname="pkgx"
pkgver=1.1.6.996.ga0da42e
pkgrel=4
pkgdesc="the last thing you’ll install"
arch=("x86_64" "arm")
url="https://github.com/pkgxdev/pkgx"
license=("Apache-2.0")
depends=()
makedepends=(
	"deno" # For Compiling
	"git"  # For Cloning
)
provides=("pkgx")
conflicts=("pkgx")
source=("$_pkgname::git+https://github.com/pkgxdev/pkgx.git")
b2sums=("SKIP") # Since it's a VCS Package, it makes no sense to have checksums
options=(!strip)

pkgver() {
	cd "$_pkgname"
	export VER="$(git tag --sort=committerdate | grep -E '[0-9]' | tail -1 | cut -b 2-7)"
	export REV="$(git rev-list --count HEAD)"
	export COMMIT="$(git rev-parse --short HEAD)"
	echo "$VER.$REV.g$COMMIT"
}

build() {
	cd "$_pkgname"
	# Patch version
	echo "export default function() { return '$(git tag --sort=committerdate | grep -E '[0-9]' | tail -1 | cut -b 2-7) (AUR Build, REV $(git rev-list --count HEAD) COMMIT $(git rev-parse --short HEAD))' }" >src/modes/version.ts
	deno task compile
}

check() {
	cd "$_pkgname"
	deno task typecheck
	deno task test
}

package() {
	cd "$srcdir/$_pkgname"
	install -D $_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	install -D LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
