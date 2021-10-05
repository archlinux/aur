# Maintainer:  Guillaume Binet <gbin@gootz.net>

pkgname=sixel-tmux-git
_gitname=sixel-tmux
pkgver=8050_2.0.r3043.gbc340a30
pkgrel=1
pkgdesc="A terminal multiplexer that display graphics one way or another!"
url="https://github.com/csdvrx/sixel-tmux.git"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ncurses' 'libevent')
makedepends=('git')
optdepends=('libutempter: Record user sessions to utmp and wtmp files [add to depends array and rebuild to enable]')
#depends+=('libutempter') && _addconfigureflags="--enable-utempter"
provides=('tmux')
conflicts=('tmux')
source=('git+https://github.com/csdvrx/sixel-tmux.git'
        'LICENSE'
        'ac-271.patch')
md5sums=('SKIP'
         '71601bc37fa44e4395580b321963018e'
         '6963a00dc940ec8c7f45e0770fa7e63e')

pkgver() {
  cd ${_gitname}
  # Upstream reissues tags, which breaks 'describe --long'. Prefix with rev count to compensate.
  printf "%s_%s" \
    $(git rev-list --count HEAD) \
    $(git describe --long) | sed -e 's:\([^-]*-g\):r\1:' -e 's:-:.:g'
}

prepare() {
  cd ${_gitname}
  patch --forward --strip=1 --input="${srcdir}/ac-271.patch"
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
