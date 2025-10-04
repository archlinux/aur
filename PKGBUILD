#shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgname=gnome-shell-extension-touchup-git
pkgver=r254.f15b2ee
pkgrel=1
pkgdesc="An extension for Gnome Shell that enhances the user experience for devices with a touchscreen."
arch=('any')
url="https://github.com/mityax/gnome-extension-touchup.git"
license=('LicenseRef-unknown')
depends=('gnome-shell')
makedepends=(
	'nodejs'
	'npm'
	'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
source=("touchup::git+$url")
sha256sums=('SKIP')

# Enable use of pnpm/yarn instead of npm
if command -v pnpm >/dev/null 2>&1; then
	alias npm=pnpm
elif command -v yarn >/dev/null 2>&1; then
	alias npm=yarn
fi

pkgver() {
	cd touchup
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd touchup
	npm install
}

build() {
	cd touchup
	npm run build:release
}

package() {
	cd touchup
	_uuid=$(jq -r .uuid src/metadata.json)
	_version=$(jq -r '."version-name"' src/metadata.json)

	install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
	bsdtar -xvf "dist/${_uuid//\@/}.v${_version}.shell-extension.zip" -C \
		"$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
}
