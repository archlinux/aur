# Maintainer: Tanjiro Kamado <tanjiro.kamado at yandex dot com>
pkgname=timingeditor-svn
_pkgN=timingeditor
_ccn=TimingEditor
pkgver=r115
pkgrel=1
pkgdesc="The Timing Editor is a free tool to draw timing diagrams. "
arch=('x86_64')
url="http://timingeditor.sourceforge.net"
license=('GPL2')
groups=()
depends=('wxgtk')
makedepends=('subversion') 
provides=("timingeditor")
conflicts=("timingeditor")
replaces=()
backup=()
options=()
install=
source=(
	'timingeditor-svn::svn+https://svn.code.sf.net/p/timingeditor/code/trunk'
	"wx3.patch"
)
noextract=()
sha256sums=(
	'SKIP'
	'cc0e4f8b477e59185b4d5dd58fef3de4eb48ebdcdddd136aeffa8a28c326cfbb'
	)


pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/${pkgname}"
	patch -p1 -i "$srcdir/wx3.patch"
	#sed -i s/\#include \<wx/svg/dcsvg.h\>/\#include \<wx\/dcsvg.h\>/g TimingView.cpp
	#sed -i s/wxCMD_LINE_PARAM,  NULL, NULL, _T\(\"input file\"\)/wxCMD_LINE_PARAM,  NULL, NULL, wxT_2\(\"input file\"\)/g TimingApp.cpp

}

build() {
	cd "$srcdir/${pkgname}"
        g++ *.cpp -DNDEBUG `wx-config --cxxflags --libs std,aui` -o $_ccn
}


package() {
	_base="$pkgdir/usr/bin"
	cd "$srcdir/${pkgname}"

	mkdir -p "$_base/$_ccn"
	cp "$_ccn" "$_base/$_ccn/"
	rm -rf art/.svn
	cp -r art "$_base/$_ccn/"
	cd "$_base"
	ln -s "$_ccn/$_ccn" "$_pkgN"
}
