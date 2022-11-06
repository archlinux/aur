# Maintainer: Christophe Noisel <cnoisel at proton.me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: herb  <herb@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=planner
pkgver=0.14.90
pkgrel=8
pkgdesc='Project management application for GNOME'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/Planner'
depends=('glib2>=2.50', # glib, gmodule, gobject
	'gtk3>=3.22', # gtk3, gail
	'libxml2>=2.6.27',
	'libxslt>=1.1.23', #libxslt, libexslt
	'libgda>=5.0')
makedepends=('git' 'meson')
options=('!emptydirs')
_commit="3cd61d8813894ee566d9c2559ec45ff39d3dbe46" # 05 Nov, 2022
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
