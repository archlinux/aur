# Maintainer: Florijan Hamzic <florijanh@gmail.com>

_pkgname=gnome-text-editor
pkgname=${_pkgname}-without-save-dialog
pkgver=44.0
pkgrel=1
pkgdesc='Simple text editor that focuses on session management but without the save dialog on close'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=(GPL3)
provides=(gnome-text-editor)
conflicts=(gnome-text-editor)
depends=(
	enchant
	gtksourceview5
	libadwaita
)
makedepends=(
	itstool
	meson
)
options=(debug)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/${_pkgname}-${_commit}.tar.gz" "avoid_save_dialog_on_close.patch")
b2sums=('0c844163e3754d87aae78c90f78f16ef662597f8a8b8394fdd88f70bbeca06c98ca79d78212f6e3b80d7b366afd21d8edc8019a3f88bca9127040bac49c0c6ed'
        '722af314f923453f61542f9b1bb564d0242fbd0049dc9bc0091c46b78167163a166899ca0657e221a9dcac29a7705d73a8c22309cfade99a09140783a8908089')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p1 -b -i ../avoid_save_dialog_on_close.patch
}

build() {
	arch-meson ${_pkgname}-${_commit} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs || true
}

package() {
	DESTDIR="${pkgdir}" meson install -C build

	rm -rf "${pkgdir}/usr/share/gtksourceview-5"
}
