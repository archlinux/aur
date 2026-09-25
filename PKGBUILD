# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

# Last GTK3-era release before upstream renamed the pkg-config module
# to gtksourceviewmm-4.0 (current official Arch package, still built
# against gtkmm3 but under the new module name/API). Needed by
# lunduke-edit-git, which links against gtksourceviewmm-3.0 specifically.
# Built from a git checkout (not the release tarball) so the package
# carries real upstream history up to the 3.18.0 tag, the point this
# pin forks from.
pkgname=gtksourceviewmm3
pkgver=3.18.0
pkgrel=1
pkgdesc="C++ bindings for the gtksourceview library (legacy 3.0 API, gtksourceviewmm-3.0 module)"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gtksourceviewmm"
license=('LGPL-2.1-or-later')
depends=('gtkmm3' 'gtksourceview3' 'glibmm')
makedepends=('git' 'mm-common' 'gtkmm3-docs' 'pkgconf')
provides=('gtksourceviewmm-3.0')
source=("git+https://gitlab.gnome.org/GNOME/gtksourceviewmm.git#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
	cd gtksourceviewmm
	mm-common-prepare -cf
	autoreconf -fiv
}

build() {
	cd gtksourceviewmm
	# --enable-maintainer-mode is required for a git checkout: it turns
	# on the gmmproc codegen SUBDIRS that a release tarball ships
	# pre-generated instead (see official Arch gtksourceviewmm PKGBUILD).
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-maintainer-mode
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make M4PATH='/usr/lib/gtkmm-3.0/proc/m4/:/usr/lib/pangomm-1.4/proc/m4/:/usr/lib/atkmm-1.6/proc/m4/'
}

package() {
	cd gtksourceviewmm
	make DESTDIR="${pkgdir}" install doc_subdirs=
}
