# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=vibecheck
_uuid=vibecheck@selfref.dev
pkgname=gnome-shell-extension-vibecheck
pkgver=1.2.0
pkgrel=1
pkgdesc="GNOME Shell extension showing remaining Claude plan usage in the top bar and on a desktop card"
arch=('any')
url="https://github.com/SelfRef/vibecheck"
license=('MIT')
depends=('gnome-shell')
optdepends=('claude-code: usage data source and sign-in')
makedepends=('nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4587ac72f5dd4f2d6ae8639efdd99a06030765ea9c6c4493a1c1062abb8a680a')

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
