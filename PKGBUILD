# Maintainer: pancho horrillo <pancho at pancho dot name>

# `Starting the Emacs 28 release cycle` announcement on emacs-devel:
# https://lists.gnu.org/archive/html/emacs-devel/2021-09/msg02290.html

pkgname=emacs28-git
pkgver=28.1.50.151319
pkgrel=1
pkgdesc='The extensible, customizable, self-documenting real-time display editor, emacs-28 release branch'
arch=(x86_64)
url=http://www.gnu.org/software/emacs/
license=(GPL3)
depends=(alsa-lib cairo giflib gnutls gtk3 harfbuzz jansson libjpeg-turbo libgccjit libsystemd libxml2 libxpm)
makedepends=(git xorgproto texlive-core)
provides=(emacs)
conflicts=(emacs emacs-nox emacs-git)
replaces=(emacs emacs-nox emacs-git)
source=($pkgname::git+https://git.savannah.gnu.org/git/emacs.git#branch=emacs-28)
b2sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"
	printf '%s.%s'                                                  \
	    "$(grep AC_INIT configure.ac |                              \
	    sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\?\).\+$/\1/')"  \
	    "$(git rev-list --count HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	[[ -x configure ]] || ./autogen.sh git && ./autogen.sh autoconf
	mkdir -p "$srcdir/$pkgname"/build
}

build() {
	local _confflags=(
	    --prefix=/usr
	    --sysconfdir=/etc
	    --libexecdir=/usr/lib
	    --localstatedir=/var
	    --with-modules
	    --without-libotf
	    --without-m17n-flt
	    --without-gconf
	    --without-gsettings
	    --with-native-compilation
	    --with-x-toolkit=gtk3
	    --without-xaw3d
	    --without-gpm
	    --without-compress-install
	    --program-transform-name='s/^ctags$/ctags.emacs/'
	)
	cd "$srcdir/$pkgname"/build
	../configure "${_confflags[@]}"
	make NATIVE_FULL_AOT=1
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
