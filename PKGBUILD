# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Dmitry Korzhevin <dkorzhevin AT gmail DOT com>
# Contributor: C.Coutinho <kikijump[at]gmail[dot]com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: TDY <tdy@gmx.com>

pkgname=tmux-git
_gitname=tmux
pkgver=8107_3.0a.r184.g745233d6
pkgrel=2
pkgdesc="A terminal multiplexer"
url="https://github.com/tmux/tmux/wiki"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ncurses' 'libevent')
makedepends=('git')
optdepends=('libutempter: Record user sessions to utmp and wtmp files [add to depends array and rebuild to enable]')
#depends+=('libutempter') && _addconfigureflags="--enable-utempter"
provides=('tmux')
conflicts=('tmux')
source=('git+https://github.com/tmux/tmux.git'
        'LICENSE')
md5sums=('SKIP'
         '71601bc37fa44e4395580b321963018e')

pkgver() {
  cd ${_gitname}
  # Upstream reissues tags, which breaks 'describe --long'. Prefix with rev count to compensate.
  printf "%s_%s" \
    $(git rev-list --count HEAD) \
    $(git describe --long) | sed -e 's:\([^-]*-g\):r\1:' -e 's:-:.:g'
}

prepare() {
  cd ${_gitname}
  ./autogen.sh
}

build() {
  cd ${_gitname}
  ./configure --prefix=/usr ${_addconfigureflags}
  make
}

package() {
  cd ${_gitname}

  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install example config file
  install -Dm755 example_tmux.conf "${pkgdir}/usr/share/tmux/example_tmux.conf"
}
