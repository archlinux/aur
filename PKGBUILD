# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=vibecheck
_uuid=vibecheck@selfref.dev
pkgname=gnome-shell-extension-vibecheck-git
pkgver=1.0.0.r1.g5cab59d
pkgrel=1
pkgdesc="GNOME Shell extension showing remaining Claude plan usage in the top bar and on a desktop card"
arch=('any')
url="https://github.com/SelfRef/vibecheck"
license=('MIT')
depends=('gnome-shell')
optdepends=('claude-code: usage data source and sign-in')
makedepends=('git' 'nodejs' 'pnpm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	pnpm install --frozen-lockfile
}

build() {
	cd "$_pkgbase"
	pnpm build
}

check() {
	cd "$_pkgbase"
	pnpm test
}

package() {
	cd "$_pkgbase/dist"
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	cp -r --no-preserve=ownership . "$_dest"
	rm -r "$_dest"/{session-check.js,smoke-test.js,schemas}
	install -Dm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
