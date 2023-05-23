# Maintainer: pancho horrillo <pancho at pancho dot name>
#
# Updated from the changes present in xiliuya <xiliuya at 163 dot com> PKGBUILD (AUR/emacs29-git)

# `Starting the Emacs 29 release cycle` announcement on emacs-devel:
# https://lists.gnu.org/archive/html/emacs-devel/2022-11/msg01774.html

pkgname=emacs29-pgtk-trampolines-git
pkgver=29.0.91.166361
pkgrel=1
pkgdesc='An extensible, customizable, free/libre text editor - and more (emacs-29 release branch).'
arch=(x86_64)
url=http://www.gnu.org/software/emacs/
license=(GPL3)
depends=(
	acl
	alsa-lib
	cairo
	dbus
	giflib
	gnutls
	gpm
	gtk3
	harfbuzz
	jansson
	lcms2
	libgccjit
	libjpeg-turbo
	libotf
	libpng
	librsvg
	libsm
	libsystemd
	libtiff
	libwebp
	libxml2
	libxpm
	m17n-lib
	sqlite3
	texinfo
	tree-sitter
	zlib
)
makedepends=(
	git
	texlive-core
)
provides=(emacs)
conflicts=(emacs emacs-nox emacs-git)
replaces=(emacs emacs-nox emacs-git)
source=($pkgname::git+https://git.savannah.gnu.org/git/emacs.git#branch=emacs-29)
b2sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"
	printf '%s.%s'                                                  \
		"$(awk -F ', ' '/AC_INIT/ { print $2 }' configure.ac )"		\
		"$(git rev-list --count HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	[[ -x configure ]] || ./autogen.sh git && ./autogen.sh autoconf
	mkdir -p "$srcdir/$pkgname"/build
}

build() {
	local _conf=(
		--prefix=/usr
		--sysconfdir=/etc
		--libexecdir=/usr/lib
		--localstatedir=/var
		--program-transform-name='s/^\([ec]tags\)$/\1.emacs/'
		--with-modules
		--with-native-compilation=aot
		--with-pgtk
		--with-sound=alsa
		--with-x-toolkit=gtk3
		--without-compress-install
		--without-gconf
		--without-gsettings
		--without-m17n-flt
		--without-xaw3d
		--without-xim
	)
	cd "$srcdir/$pkgname"/build
	../configure "${_conf[@]}"
	# https://www.reddit.com/r/emacs/comments/y4vc9n/alpha_emacs_29_for_windows_with_aot_trampolines/
	make trampolines
	make html
	make pdf
}

_check() {
	cd "$srcdir/$pkgname"/build
	make check
}

package() {
	cd "$srcdir/$pkgname"/build
	make DESTDIR="$pkgdir"/ install{,-html,-pdf}
}
