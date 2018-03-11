# Maintainer: fenugrec
# Contributor: Schnouki <thomas.jost@gmail.com>
# patches from universalindentgui
pkgname=universalindentgui-svn
pkgver=r1077
pkgrel=1
pkgdesc="A GUI for GNU Indent, Uncrustify, Artistic Styler, PHP Stylist, Ruby Beautify, HTML Tidy and many other"
url="http://universalindent.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
provides=('universalindentgui')
conflicts=('universalindentgui')
conflicts=('uncrustify<0.66')
depends=('qt4' 'qscintilla-qt4')
makedepends=('subversion')
optdepends=(
	'astyle: a free, fast and small automatic formatter for C, C++, C# and Java',
	'indent: the GNU pretty-printer',
	'tidyhtml: a tool to tidy down your HTML code',
	'uncrustify: source code beautifier for C-like languages'
	'ruby: needed for some scripts'
	'python: needed for some scripts'
	'gawk: needed for some scripts'
)

_svnmod=universalindent-code
source=("$_svnmod::svn://svn.code.sf.net/p/universalindent/code/trunk"
	"universalindentgui.desktop"
	"universalindentgui.png"
	"noupdatecheck.patch"
	"fix_about_dialog.patch"
	"qscintilla.patch"
	"uncrust66_leftright.patch"
	)

sha256sums=('SKIP'
            'e6ed8674345d76c1f3e5ab4d6f23b64bfa7ba77141436ff325d72a28cb672a06'
            'cc01fcc94cc2067e499b15189a2ac56a901562218951bd77650cf8f81bcf440d'
            'b5b4d6b5604fbaaa8578a97e3a59c709bb0e1861ffaae1add3ca4452c76b5686'
            '254e237064e8422b4d219fadfaa8486a5a69b3561b8aa81df8faf3c13272e7c5'
            'a06a47f5a9abbb4dded6fc2977c257fa99eec348805cc27f9b93793d42fdd422'
            '55f985d32d56d83c29404456e24e274d73168c2fab3486c3f520603689e0b6d3')

prepare() {
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  fi
  
  cd "$srcdir/$_svnmod"
  #patch -Np1 -i ../../no-strip.patch src/UniversalIndentGUI.pro #disable QT stripping
  patch -p1 -i ../noupdatecheck.patch
  patch -p1 -i ../fix_about_dialog.patch
  patch -p1 -i ../qscintilla.patch
  patch -p1 -i ../uncrust66_leftright.patch
}

pkgver() {
  cd "$srcdir/$_svnmod"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  qmake-qt4 UniversalIndentGUI.pro

  make
}

package() {
  install -Dm644 universalindentgui.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png
  install -Dm644 universalindentgui.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  cd "$srcdir/$_svnmod-build"
  make INSTALL_ROOT=${pkgdir} install
}
