# Maintainer: Florijan Hamzic <florijanh@gmail.com>

_pkgname=gnome-text-editor
pkgname=${_pkgname}-without-save-dialog
pkgver=42.2
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
b2sums=('9e40aa5f723d4aa6c8a48c95172c81deff9e873d9c5222e8c63a053c2367341545339f64da4a4600f04ce64f56b43e4909895ff43d41c44b6fa49a4b02c914ad'
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
