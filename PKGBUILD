# Tracks the next branch of the i3 repo

pkgname=i3-next-git
pkgver=4.18.r322.gcf09cc79
pkgrel=1
pkgdesc='An improved dynamic tiling window manager'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git')
groups=('i3-vcs')
depends=(xcb-util-cursor xcb-util-keysyms xcb-util-wm xcb-util-xrm libev yajl startup-notification
         pango libxkbcommon-x11)
makedepends=(asciidoc xmlto)
optdepends=('dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl: i3-save-tree and i3-dmenu-desktop'
            'perl-anyevent-i3: Features like saving the layout.'
            'perl-json-xs: Features like saving the layout.')
options=('docs' '!strip' 'debug')
source=('git://github.com/i3/i3.git#branch=next')
sha1sums=('SKIP')

_gitname='i3'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$_gitname"

  autoreconf -fvi
}

build() {
  cd "$_gitname"

  rm -rf build
  mkdir -p build && cd build

  ../configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-sanitizers

  make
}

package() {
  cd "$_gitname/build"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
