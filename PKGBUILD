# Maintainer: hyperpuncher
pkgname=stuff-git
pkgver=r0
pkgrel=1
pkgdesc='lightweight file manager'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/stuff'
license=('MIT AND Zlib AND ISC')
depends=('dbus' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'sdl3'
	'sdl3_image' 'sdl3_ttf' 'systemd-libs' 'ttf-font' 'udisks2' 'wayland' 'xdg-utils')
optdepends=('polkit-agent: authentication prompts for protected storage operations'
	'xdg-desktop-portal: application chooser and desktop font settings')
provides=("stuff=$pkgver")
conflicts=('stuff')
makedepends=('git' 'just' 'odin>=dev_2026_10')
options=('!debug')
source=("stuff::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/stuff" || return 1
	local _version
	if _version=$(git describe --tags --long --match 'v[0-9]*' --abbrev=7 2>/dev/null); then
		printf '%s\n' "${_version#v}" | sed 's/-/.r/;s/-/./g'
	else
		printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$srcdir/stuff" || return 1
	just release
}

package() {
	cd "$srcdir/stuff" || return 1
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
