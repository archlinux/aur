# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=vibecheck
_uuid=vibecheck@selfref.dev
pkgname=gnome-shell-extension-vibecheck
pkgver=1.0.0
pkgrel=1
pkgdesc="GNOME Shell extension showing remaining Claude plan usage in the top bar and on a desktop card"
arch=('any')
url="https://github.com/SelfRef/vibecheck"
license=('MIT')
depends=('gnome-shell')
optdepends=('claude-code: usage data source and sign-in')
makedepends=('nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be831f7ce39ac58ed0548869d3b641f271f357e3094ab53847fb408fc5b4929d')

prepare() {
	cd "$_pkgbase-$pkgver"
	pnpm install --frozen-lockfile
}

build() {
	cd "$_pkgbase-$pkgver"
	pnpm build
}

check() {
	cd "$_pkgbase-$pkgver"
	pnpm test
}

package() {
	cd "$_pkgbase-$pkgver/dist"
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	cp -r --no-preserve=ownership . "$_dest"
	rm -r "$_dest"/{session-check.js,smoke-test.js,schemas}
	install -Dm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
