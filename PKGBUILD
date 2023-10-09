# Maintainer: Christophe Noisel <cnoisel at proton.me>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Lubosz <lubosz at gmail dot com>

pkgname=planner-git
pkgver=0.14.91
pkgrel=1
pkgdesc='Project management application for GNOME (lastest version from git)'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/Planner'
depends=('glib2>=2.56', # glib, gmodule, gobject
	'gtk3>=3.22', # gtk3, gail
	'libxml2>=2.6.27',
	'libxslt>=1.1.23', #libxslt, libexslt
	'libgda>=5.0') # database export feature is enabled by arch-meson
makedepends=('git' 'meson')
conflicts=('planner')
provides=('planner')
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/World/planner.git")
sha256sums=('SKIP')
install=planner.install

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

pkgver() {
	git -C 'planner' describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
