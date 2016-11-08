# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Thorsten Toepper <atsutane at freethoughts dot de>
# Contributor: William Giokas <1007380@gmail.com>

# This PKGBUILD was prepared for pacman 4.1 by William. Thank you. :-)

pkgname=i3-git
pkgver=4.13.r3.g4ccac59
pkgrel=1
pkgdesc='An improved dynamic tiling window manager'
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
source=('git://github.com/i3/i3')
sha1sums=('SKIP')

_gitname='i3'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  autoreconf --force --install

  rm -rf build
  mkdir -p build && cd build

  ../configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-sanitizers

  # See https://lists.archlinux.org/pipermail/arch-dev-public/2013-April/024776.html
  make CPPFLAGS+="-U_FORTIFY_SOURCE"
}

package() {
  cd "$_gitname/build"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

