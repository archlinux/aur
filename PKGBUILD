# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-shell-extension-copyous
pkgname="$_pkgbase-git"
pkgver=2.0.0.r3.g58ed2c4
pkgrel=2
pkgdesc='Modern Clipboard Manager for GNOME'
arch=('any')
url='https://extensions.gnome.org/extension/8834/copyous/'
license=('GPL-3.0')
depends=('gnome-shell' 'libgda6' 'gsound')
makedepends=('git' 'nodejs' 'pnpm')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/boerdereinar/copyous.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	git submodule update --init --recursive
	pnpm install --frozen-lockfile --ignore-scripts
}

build() {
	cd "$_pkgbase"
	RELEASE=1 make build
}

package() {
	cd "$_pkgbase"
	local _uuid='copyous@boerdereinar.dev'
	install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
	bsdtar -xf "dist/$_uuid.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	glib-compile-schemas --strict "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
