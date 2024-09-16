# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=swayosd-git
_pkgname="${pkgname%-git}"
_reponame=SwayOSD
pkgver=0.1.0.r0.gdbb8b72
pkgrel=1
pkgdesc="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ErikReider/SwayOSD"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell' 'pulse-native-provider' 'libinput')
makedepends=('git' 'cargo' 'meson' 'ninja' 'sassc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_reponame}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd "${_reponame}"
	cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_reponame}"
	arch-meson --buildtype=release build
	ninja -C build
}

package() {
	cd "${_reponame}"
	meson install -C build --destdir "$pkgdir"
}
