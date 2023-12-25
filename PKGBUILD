# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=swayosd-percentage-display-git
_pkgname="${pkgname%-percentage-display-git}"
_reponame=SwayOSD
pkgver=r56.25e69ae
pkgrel=1
pkgdesc="A GTK based on screen display for keyboard shortcuts that shows percentages"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/Ferdi265/SwayOSD"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell' 'pulseaudio' 'libinput')
makedepends=('git' 'cargo' 'meson' 'ninja')
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_reponame}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
