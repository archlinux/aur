#shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgname=gnome-shell-extension-window-calls-extended-git
pkgver=r35.e9888df
pkgrel=1
pkgdesc="GNOME Extension for getting windows list in wayland"
arch=('any')
url="https://github.com/hseliger/window-calls-extended.git"
license=('LicenseRef-unknown')
depends=('gnome-shell')
makedepends=(
	'git'
	'jq'
)
provides=("${pkgname%-git}" 'gnome-shell-extension-window-calls')
conflicts=("${pkgname%-git}" 'gnome-shell-extension-window-calls')
replaces=("${pkgname%-git}" 'gnome-shell-extension-window-calls')
source=("window-calls::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd window-calls
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd window-calls
	gnome-extensions pack --force
}

package() {
	cd window-calls
	_uuid=$(jq -r .uuid metadata.json)

	install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
	bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
		"$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
}
