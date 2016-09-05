# Maintainer: Philipp Classen <philipp.classen@posteo.de>
#
# Forked version of i3 with Michael Forster's patch:
# - See pull request: https://github.com/i3/i3/pull/2178
#
# Sources:
# - i3 is from https://github.com/MForster/i3/tree/tiling-drag (branch: tiling-drag)
# - PKGBUILD forked from aur/i3-git
#

pkgname=i3-mouse-dragging-git
pkgver=4.11.r274.ge9ad036
pkgrel=1
pkgdesc='A fork of the i3wm tiling window manager allowing dragging tiled windows with the mouse'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git')
groups=('i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor'
         'libxkbcommon-x11' 'xcb-util-xrm')
makedepends=('git' 'asciidoc' 'docbook-xsl' 'pkgconfig')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
options=('docs' '!strip' 'debug')
source=('git://github.com/MForster/i3')
sha1sums=('SKIP')

_gitname='i3'

pkgver() {
  cd "$srcdir/$_gitname"
  git checkout tiling-drag > /dev/null
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  git checkout tiling-drag
  make
  make -C man
}

package() {
  cd "$_gitname"
  git checkout tiling-drag

  make DESTDIR="$pkgdir/" install

  install -d "${pkgdir}/usr/share/man/man1/"
  install -m644 man/*.1 "${pkgdir}/usr/share/man/man1/"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  make clean
}

# vim:set ts=2 sw=2 et:

