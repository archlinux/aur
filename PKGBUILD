# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Cillian Berragan <cjberragan@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

_pkgname=nyxt-browser
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='A keyboard-driven web browser designed for power users'
arch=('i686' 'x86_64')
url='https://nyxt.atlas.engineer'
license=('custom:BSD')
conflicts=('nyxt')
provides=('nyxt')
source=($_pkgname::git+https://github.com/atlas-engineer/nyxt.git)
sha256sums=('SKIP')
# If someday Next works with other Lisps, replace 'sbcl' with 'common-lisp'.
makedepends=('git' 'sbcl' 'cl-asdf')
depends=('enchant'
         'glib-networking'
         'gobject-introspection-runtime'
         'gsettings-desktop-schemas'
         'libfixposix'
         'webkit2gtk-4.1')
optdepends=('gstreamer: for HTML5 audio/video'
            'gst-plugins-base: for HTML5 audio/video'
            'gst-plugins-good: for HTML5 audio/video'
            'gst-plugins-bad: for HTML5 audio/video'
            'gst-plugins-ugly: for HTML5 audio/video')
# Binary will not run otherwise.
options=('!strip' '!makeflags')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  make all
}

package() {
  cd "$srcdir/$_pkgname"
  make install PREFIX=/usr DESTDIR="${pkgdir}"
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 licenses/* "$pkgdir"/usr/share/licenses/$pkgname/
}
