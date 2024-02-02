# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=swayosd-git
_pkgname="${pkgname%-git}"
_reponame=SwayOSD
pkgver=r55.a0709bc
pkgrel=1
pkgdesc="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ErikReider/SwayOSD"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell' 'pulseaudio' 'libinput')
makedepends=('git' 'cargo' 'meson' 'ninja' 'sassc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
