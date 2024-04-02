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
_actual_pkgver=1.00
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
	# "c-intercal: test with C-INTERCAL syslib" <- checkdepends
	"perl-net-interface: INET" 
	"perl-socket6: IPv6 support for INET package"
	"perl-io-socket-inet6: IPv6 support for INET package"
	"perl-curses: UI-Curses"
	"perl-term-readline-gnu: UI-Line"
	"perl-gtk3: UI-X"
	"perl-gtk2: UI-X (alternative for perl-gtk3)")
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
sha256sums=(06129dcb4e5db418ac93a6d2c927f15ace7a574c8c8d5220c8adb89dfff54dad)

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
	cd CLC-INTERCAL-Docs/doc/examples/
	install -Dm0644 -t "$pkgdir/usr/share/clc-intercal/examples/" *.*i
	install -Dm0644 -t "$pkgdir/usr/share/clc-intercal/examples/quantum/" quantum/*.*i
	cd -

	# HTML docs
	cd CLC-INTERCAL-Docs/blib/htmldoc/
	install -Dm0644 -t "$pkgdir/usr/share/doc/clc-intercal/htmldoc/" *.html
	cd -

	# HTML examples
	cd CLC-INTERCAL-Docs/blib/htmlexamples
	install -Dm0644 -t "$pkgdir/usr/share/doc/clc-intercal/htmlexamples/" *.html *.css
	install -Dm0644 -t "$pkgdir/usr/share/doc/clc-intercal/htmlexamples/quantum/" quantum/*.html
	cd -

	# Additionally Vim syntax file
	cd bonus/vim
	install -Dm0644 -t "$pkgdir/usr/share/vim/vimfiles/ftdetect" ftdetect/*.vim
	install -Dm0644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" syntax/*.vim
	cd -

	# Finally COPYING file
	# OBTW every "$src/COPYING" and "$src/CLC-INTERCAL-*/COPYING" are identifical
	install -Dm0644 -t "$pkgdir/usr/share/licenses/clc-intercal/" COPYING
}
