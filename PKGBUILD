# Maintainer: David Thurstenson <thurstylark@gmail.com>
# Contributor: Ingo Bürk <admin at airblader dot de>

pkgname=i3-gaps-fullscreen-next-git
pkgver=4.19.1.r177.g4ea30ca9
pkgrel=2
pkgdesc='A fork of a fork of i3wm tiling window manager, with multi-monitor fullscreen workaround for VMWare, mpv, etc.'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/i3/tree/gaps-next'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3-git' 'i3-gaps')
groups=('i3' 'i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11')
makedepends=('git' 'bison' 'flex' 'asciidoc' 'xmlto' 'meson')
optdepends=('i3lock: For locking your screen.'
            'i3status: To display system information with a bar.')
options=('docs')
source=('git://github.com/Airblader/i3#branch=gaps-next'
        'wm-fullscreen-monitors.patch')
sha1sums=('SKIP'
          '409e143bd326216337195850a08b1b590cba8502')

pkgver() {
  cd "${srcdir}/i3"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/i3"
  patch -p1 < "../wm-fullscreen-monitors.patch"
}

build() {
  cd "i3"
  arch-meson \
    -Ddocs=true \
    -Dmans=true \
  ../build
  meson compile -C ../build
}

package() {
  cd "i3"
  DESTDIR="$pkgdir" meson install -C ../build

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:set ts=2 sw=2 et:

