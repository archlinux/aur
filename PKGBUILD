# Maintainer:  Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>

pkgname=tmux-tcl-git
_gitname=tmux
pkgver=2.2.r48.gf7af299
pkgrel=1
pkgdesc="A terminal multiplexer (with optional TCL scripting)"
url="http://ershov.github.io/tmux"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ncurses' 'libevent' 'tcl')
makedepends=('git')
optdepends=('libutempter: Record user sessions to utmp and wtmp files (add to depends array and rebuild to enable)')
#depends+=('libutempter')
provides=('tmux')
conflicts=('tmux' 'tmux-git')
source=('tmux-tcl::git+https://github.com/ershov/tmux.git'
        'LICENSE')
md5sums=('SKIP'
         '71601bc37fa44e4395580b321963018e')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long | sed -e 's:\([^-]*-g\):r\1:' -e 's:-:.:g'
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%%-git}"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/tmux/LICENSE"

  # install example config files
  install -Dm755 example_tmux.conf     "$pkgdir/usr/share/tmux/example_tmux.conf"
  install -Dm755 example_tcl_tmux.conf "$pkgdir/usr/share/tmux/example_tcl_tmux.conf"
  install -Dm755 example_tcl_tmux.tcl  "$pkgdir/usr/share/tmux/example_tcl_tmux.tcl"
}
