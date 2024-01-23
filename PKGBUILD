# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>

# This is an example of a PKGBUILD for splitting packages. Use this as a
# start to creating your own, and remove these comments. For more information,
# see 'man PKGBUILD'. NOTE: Please fill out the license field for your package!
# If it is unknown, then please put 'unknown'.

pkgname=("clc-intercal"
# 	"clc-intercal-base"
# 	"clc-intercal-docs"
# 	"clc-intercal-icalc"
# 	"clc-intercal-inet"
# 	"clc-intercal-ui-curses"
# 	"clc-intercal-ui-line"
# 	"clc-intercal-ui-x"
# 	"vim-intercal"
	)
pkgbase=clc-intercal
_actual_pkgver=1.-94.-2.4
pkgver="${_actual_pkgver//-/pre}"
pkgrel=1
epoch=
pkgdesc="New INTERCAL compiler (bundle)"
arch=(any)
url="https://uilebheist.srht.site/"
license=('custom')
groups=()
depends=(perl)
makedepends=()
checkdepends=()
optdepends=(
	# "c-intercal: C-INTERCAL syslib" <- checkdepends
	"perl-net-interface: for INET package" 
	"ncurses: UI-Curses"
	"perl-term-readline-gnu: UI-Line"
	"perl-gtk3: UI-X")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_pkgname_with_version="CLC-INTERCAL-${_actual_pkgver}"
_source_dirname="$_pkgname_with_version"
_url_base="https://uilebheist.srht.site/dist/${_pkgname_with_version}/"
source=("${_url_base}${_source_dirname}.tar.gz")
sha256sums=(4cbfa1c084fb53f66908b457668bb9ba086d826212d41a663f646bb65b95d1e8)

build() {
	cd "$_source_dirname"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	perl Makefile.PL
	make
}

check() {
	cd "$_source_dirname"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make -k test # oh... not check
}

package() {
	cd "$_source_dirname"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

	# = OBTW the "make all" on Docs is NOOP

	# Example programs
	(
		cd CLC-INTERCAL-Docs/doc/examples/
		install -Dm0644 -t "$pkgdir/usr/share/clc-intercal/examples/" *.*i
		install -Dm0644 -t "$pkgdir/usr/share/clc-intercal/examples/quantum/" *.*i
	)
	case $? in (0) :;; (*) false; esac

	# HTML docs
	(
		cd CLC-INTERCAL-Docs/blib/
		for _dir in htmldoc htmlexamples; do
			find "$_dir" -type f \! -name .exists -exec install -Dm0644 -t "$pkgdir/usr/share/doc/clc-intercal/$_dir" {} \;
		done
	)
	case $? in (0) :;; (*) false; esac

	# = Additionally Vim syntax file
	(
		cd bonus/vim
		for _dir in ftdetect syntax; do
			find "$_dir" -type f -exec install -Dm0644 -t "$pkgdir/usr/share/vim/vimfiles/$_dir" {} \;
		done
	)
	case $? in (0) :;; (*) false; esac

	# = Finally COPYING file
	# OBTW every "$src/COPYING" and "$src/CLC-INTERCAL-*/COPYING" are identifical
	install -Dm0644 -t "$pkgdir/usr/share/licenses/clc-intercal/" COPYING
}
