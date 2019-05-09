# Contributor: Rasi <rasi@xssn.at>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ncmpc-git
pkgver=0.34.1.g93dcece
pkgrel=1
pkgdesc="A fully featured MPD client, which runs in a terminal (using ncurses)."
arch=('i686' 'x86_64')
url="http://www.musicpd.org/clients/ncmpc/"
license=('GPL')
depends=('ncurses' 'glib2' 'libmpdclient' 'python' 'expat')
makedepends=('git' 'meson')
conflicts=('ncmpc' 'ncmpc-svn')
source=("$pkgname::git+https://github.com/MusicPlayerDaemon/ncmpc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's/^v//g;s|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"
  meson --prefix /usr . output
  meson configure -Dasync_connect=true \
                  -Dchat_screen=true \
                  -Dcolors=false \
                  -Dhelp_screen=true \
                  -Dkey_screen=true \
                  -Dlibrary_screen=true \
                  -Dlirc=auto \
                  -Dlocale=auto \
                  -Dlyrics_screen=true \
                  -Dmanual=true \
                  -Dmouse=enabled \
                  -Dmultibyte=true \
                  -Dnls=auto \
                  -Doutputs_screen=true \
                  -Dregex=enabled \
                  -Dsearch_screen=true \
                  -Dsong_screen=true output
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR=$pkgdir ninja -C output install
  rm $pkgdir/usr/share/doc/${pkgname%-*}/{AUTHORS,COPYING,NEWS}
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

