# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=st-fl-git
pkgver=20250501.3e24ac3
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
makedepends=('ncurses' 'libxext' 'git')
provides=(st)
conflicts=(st)
url=https://github.com/DreamMaoMao/st-fl
source=(git+https://github.com/DreamMaoMao/st-fl)
sha256sums=(SKIP)
_gitname="st-fl"
_sourcedir="$_gitname"
_makeopts="--directory=$_sourcedir"
_gitdir=${pkgname%'-git'}
_startdir=$PWD

pkgver() {
	cd "${pkgname%-*}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${pkgname%-*}"
  cp config.suggest.h config.h
}

build() {
  make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  local installopts='--mode 0644 -D --target-directory'
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
  install $installopts "$licdir" "$_sourcedir/LICENSE"
  install $installopts "$docdir" "$_sourcedir/README"
  install $installopts "$shrdir/$pkgname" "$_sourcedir/st.info"
}
