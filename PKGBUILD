# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=app-icon-preview-git
pkgver=3.0.0.r20.gb69145e
pkgrel=1
pkgdesc='Tool for designing applications icons'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/design/app-icon-preview'
license=(GPL3)
depends=(libadwaita)
makedepends=(
	git
	meson
	rust
)
provides=(app-icon-preview)
conflicts=(app-icon-preview)
source=(
	"git+${url}.git"
	"git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git"
)
b2sums=('SKIP' 'SKIP')

prepare() {
	cd app-icon-preview

	git submodule init
	git config 'submodule.hig.url' "${srcdir}/HIG-app-icons"
	git submodule update
}

pkgver() {
	cd app-icon-preview
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson app-icon-preview build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
