# Maintainer: Christophe Noisel <cnoisel at proton.me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: herb  <herb@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=planner
pkgver=0.14.90
pkgrel=7
pkgdesc='Project management application for GNOME'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/Planner'
depends=('glib2>=2.50', # glib, gmodule, gobject
	'gtk3>=3.10', # gtk3, gail
	'libxml2>=2.6.27',
	'libxslt>=1.1.2', #libxslt, libexslt
	'libgda>=5.0')
makedepends=('meson')
options=('!emptydirs')
_commit="9e50bb29c7bf5ad6498172d7e29671e7734fc42a" # = master as of 2022-10-13
source=("git+https://gitlab.gnome.org/World/planner.git#commit=$_commit")
sha256sums=('SKIP')

# https://wiki.archlinux.org/title/Meson_package_guidelines#Template

build() {
	# 'git clone' done in "./planner" directory :
	arch-meson planner build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}

post_install() {
	glib-compile-schemas "usr/share/glib-2.0/schemas"
	update-mime-database "usr/share/mime"
	gtk-update-icon-cache -qtf "usr/icons/hicolor"
	update-desktop-database -q "usr/share/applications"
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  post_install "$1"
}
