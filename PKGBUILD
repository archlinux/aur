# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Robert Kieffer <rek2w @ A L U M N I DOT V I R G I N I A DOT E D U>
# Contributor: Rudy Matela <rudy.matela@gmail.com>

# If you want to build the beta (2.2_1) instead of the stable (2.2_0), 
# change elvis source and MD5 to:
# "ftp://ftp.cs.pdx.edu/pub/elvis/unreleased/almost-2.2_1.tar.gz"
# "6959f2f156920db47e4c6324f187e632"
# and pkgver="2.2_1"

_COMPILEWX11=false 		# X11 support disabled by default

pkgname=elvis
pkgver=2.2_1+pre3
pkgrel=1
url="http://elvis.the-little-red-haired-girl.org/"
#url="http://elvis.vi-editor.org/"
pkgdesc="A vi clone with optional X support.  Stable or beta version."
depends=('glibc' 'ncurses' 'fontconfig' 'expat' 'zlib')
arch=('i686' 'x86_64')
license=('PerlArtistic')
replaces=('elvis_patched-withx' 'elvis_slack')
if [ $_COMPILEWX11 = "true" ]; then
    depends=('glibc' 'libx11' 'ncurses' 'fontconfig' 'expat' 'freetype2' 'zlib')
fi
source=("$pkgname-$pkgver.tar.gz::https://github.com/mbert/elvis/archive/refs/tags/v${pkgver//+/-}.tar.gz")
sha256sums=('59a0c561de4dfef40a46162c82dc68c48ac633674250746e0e3a9ffc9cc0878d')

_DESKTOPFILE="[Desktop Entry]\\nType=Application\\nVersion=1.0\\nName=Elvis\\nComment=A simple text editor\\nExec=elvis\\nIcon=$pkgname\\nTerminal=true\\nCategories=Editors;Programming;Accessories"

build() { 
  cd "$srcdir/elvis-${pkgver//+/-}"
	_X11OPT=" --with-x=no"
	if [ $_COMPILEWX11 = "true" ]; then
		_X11OPT=" --with-x"
	fi
  echo -e $_DESKTOPFILE > $pkgname.desktop
  sed -i 's/^extension .sh/& PKGBUILD/' data/elvis.syn
  ./configure --prefix=/usr --verbose $_X11OPT
  sed 's/\<CTAGS\>/ELVTAGS/g; s/ctags\>/elvtags/g; s/ant" elvtags/ant" ctags/' doc/ctags.man >doc/elvtags.man
  make
}

package() { 
  cd "$srcdir/elvis-${pkgver//+/-}"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/elvis/" "$pkgdir/usr/share/man/man1/"
  for i in elvis ref elvtags elvfmt; do
      install -D -s -m755 $i "$pkgdir/usr/bin/"
  done

  cd "$srcdir/elvis-${pkgver//+/-}/data/"
  cp -r *  "$pkgdir/usr/share/elvis/"
  
  cd "$srcdir/elvis-${pkgver//+/-}/doc/"
  install -D -m644 *.html bugs.txt "$pkgdir/usr/share/elvis/"
  for i in elvis ref elvtags elvfmt; do
      cp $i.man $i.1
      install -D -m644 $i.1 "$pkgdir/usr/share/man/man1/"
  done
  
  if [ $_COMPILEWX11 = "true" ]; then
	install -D -m644 "$srcdir/elvis-${pkgver//+/-}/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop"
	install -D -m644 "$srcdir/elvis-${pkgver//+/-}/data/icons/elvis3.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm"
  fi
}
