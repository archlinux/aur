# Maintainer: Devin Cofer <ranguvar{AT]archlinux[DOT}us>

pkgname=bbconf-cvs
pkgver=20090721
pkgrel=1
pkgdesc="All-in-one GUI configurator for the Blackbox WM and bbkeys, development version"
arch=('i686' 'x86_64')
url="http://bbconf.sourceforge.net/"
license=('GPL2')

depends=('blackbox' 'qt3')
optdepends=("bbkeys: To configure bbkeys's behavior here too")
provides=('bbconf')
conflicts=('bbconf')

_cvsroot=":pserver:anonymous@bbconf.cvs.sourceforge.net:/cvsroot/bbconf"
_cvsmod="bbconf"

_iostrfix=('bbconf/plugins/keybindings/my_kaccel.cpp' 'bbconf/plugins/keybindings/my_kkeydialog.cpp')


options=('!libtool')
build() {
	msg "Performing source checkout..."
	if [ -d "$_cvsmod/CVS" ]; then
		cd "$_cvsmod"
		cvs -z3 update -d || return 1
		cd ..
	else
		cvs -z3 -d $_cvsroot co -D $pkgver -f "$_cvsmod" || return 1
	fi
	msg "Source checkout finished."
	rm -rf "$_cvsmod-build"
	cp -r "$_cvsmod" "$_cvsmod-build" || return 1
	cd "$_cvsmod-build"

	sed -i 's/-1.7//g' bootstrap || return 1  # It wants an old version of the autotools.
	# iostream.h doesn't work (new versions of GCC)
	for file in "${_iostrfix[@]}"; do sed -i 's/iostream.h/iostream/g' "$file"; done || return 1

	./bootstrap || return 1  # Run autotools
	# Needs Qt spoon-fed to it...
	./configure --prefix="/usr" --with-qt-dir="/opt/qt" --with-qt-includes="/opt/qt/include" \
	            --with-qt-libraries="/opt/qt/lib" || return 1
	make || return 1
}
package() {
	cd "$srcdir/$_cvsmod-build"

	make DESTDIR="$pkgdir" install || return 1

	rm -rf "$srcdir/$_cvsmod-build"
}
