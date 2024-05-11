# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Dmitry Korzhevin <dkorzhevin AT gmail DOT com>
# Contributor: C.Coutinho <kikijump[at]gmail[dot]com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: TDY <tdy@gmx.com>

pkgname=tmux-git
_gitname=tmux
pkgver=10201_3.4.r33.g3823fa2c
pkgrel=1
pkgdesc="A terminal multiplexer"
url="https://github.com/tmux/tmux/wiki"
arch=('i686' 'x86_64' 'aarch64')
license=('BSD-2-Clause' 'BSD-3-Clause' 'ISC')
depends=('glibc' 'ncurses' 'libevent')
makedepends=('git')
#depends+=('libutempter') && _addconfigureflags+="--enable-utempter "
#depends+=('libutf8proc') && _addconfigureflags+="--enable-utf8proc "
#depends+=('systemd-libs') && _addconfigureflags+="--enable-systemd "
#depends+=('libsixel') && _addconfigureflags+="--enable-sixel "
provides=('tmux')
conflicts=('tmux')
source=('git+https://github.com/tmux/tmux.git')
md5sums=('SKIP')

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
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '2,14p' compat/daemon-darwin.c > "${pkgdir}/usr/share/licenses/${pkgname}/ISC-LICENSE"
  sed -n '18,45p' compat/daemon-darwin.c > "${pkgdir}/usr/share/licenses/${pkgname}/BSD-2-Clause-LICENSE"
  sed -n '5,33p' compat/bitstring.h > "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause-LICENSE"

  # install example config file
  install -Dm755 example_tmux.conf "${pkgdir}/usr/share/tmux/example_tmux.conf"
}
