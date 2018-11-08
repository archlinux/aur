# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Matt Arsenault <arsenm2@rpi.edu>

pkgname=gitg-git
pkgver=3.30.1.r30.gf7b4e604
pkgrel=1
pkgdesc='A GIT repository viewer based on GTK+ - git checkout'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/GNOME/gitg/'
license=('GPL')
depends=('gtksourceview3' 'git' 'desktop-file-utils' 'libgit2-glib' 'libgee' 'webkit2gtk' 'libpeas' 'gtkspell3')
makedepends=('meson' 'intltool' 'vala' 'gobject-introspection' 'gnome-common')
provides=('gitg')
conflicts=('gitg')
install=gitg-git.install
source=('git+https://gitlab.gnome.org/GNOME/gitg.git'
	'git+https://gitlab.gnome.org/GNOME/libgd.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd gitg/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	arch-meson gitg build
	ninja -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
	python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
	python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"
}