# Maintainer: n1ghtmar3 <vlad@n1ghtmar3.ru>

pkgname=st-n1
_pkgname=st
pkgver=0.8.1
pkgrel=1
pkgdesc="Simple terminal with Xresources, scrollback and alpha support"
arch=('i686' 'x86_64')
url="https://st.suckless.org/"
license=('MIT')
depends=('libxext' 'libxft' )
makedepends=('ncurses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_patches=("https://st.suckless.org/patches/alpha/st-alpha-0.8.1.diff"
		  "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.diff"
		  "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-0.8.diff"
		  "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-0.8.diff"
		  "https://st.suckless.org/patches/xresources/st-xresources-20180309-c5ba9c0.diff")

source=("http://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz"
		"${_patches[@]}")
		  
md5sums=('92135aecdba29300bb2e274a55f5b71e'
         '267b426c0e69aab81adbba2ce968dbcf'
         'bbe056eaed5914f55ccea001ca7f05e9'
         '72227737f6cd831afd014a3613bd559d'
         'fa0bf6c0dae5a69e3b1916ce093f6aff'
         '6c1d71ee8f8abfc3976536a17a376d20')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i '/tic /d' Makefile
  patch -Np1 -i "$srcdir/st-alpha-0.8.1.diff"
  patch -Np1 -i "$srcdir/st-scrollback-0.8.diff"
  patch -Np1 -i "$srcdir/st-scrollback-mouse-0.8.diff"
  patch -Np1 -i "$srcdir/st-scrollback-mouse-altscreen-0.8.diff"
  patch -Np1 -i "$srcdir/st-xresources-20180309-c5ba9c0.diff"
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
