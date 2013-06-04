# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=efl-git
_pkgname=efl
pkgver=1.7.99.22314.383bb37
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version (Ecore, Eldbus, Edje, Eet, Eeze, Efreet, Eina, Eio, Embryo, Emotion, Eo, Ephysics, Ethumb, & Evas)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('bullet' 'curl' 'lua' 'shared-mime-info' 'libxkbcommon' 'wayland'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxss' 'libxrandr' 'libxp'
         'libgl' 'giflib' 'libtiff' 'libpng' 'libpulse' 'libexif' 'gstreamer0.10-base'
         'fribidi' 'harfbuzz' 'fontconfig')
makedepends=('git')
optdepends=('python2: compare Eina benchmarks'
            'gstreamer0.10-good: Access more types of video in Emotion'
            'gstreamer0.10-bad: Access more types of video in Emotion'
            'gstreamer0.10-ugly: Access more types of video in Emotion'
            'gstreamer0.10-ffmpeg: Access video with ffmpeg in Emotion'
            'evas_generic_loaders-git: More video/graphic/icon loaders for Evas')
provides=("ecore=$pkgver" "eldbus=$pkgver" "edje=$pkgver" "eet=$pkgver" "eeze=$pkgver"
          "efreet=$pkgver" "eina=$pkgver" "eio=$pkgver" "embryo=$pkgver" "emotion=$pkgver"
          "ephysics=$pkgver" "ethumb=$pkgver" "evas=$pkgver"
          "efl=$pkgver" 'efl_x11' 'efl-svn')
conflicts=('ecore' 'edje' 'eet' 'eeze' 'efreet' 'eina' 'eio' 'embryo' 'emotion' 'ethumb' 'evas'
           'efl' 'efl_x11' 'efl-svn')
options=('!libtool' 'debug')
install=efl.install
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  local _ver=$(grep -m 1 EFL_VERSION configure.ac | grep -o "[[:digit:]]*" | tr '\n' '.')

  echo $_ver$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
# set python scripts to run with python2
  sed -i 's/env python$/python2/g' "$srcdir/$_pkgname/src/scripts/eina/eina-bench-cmp"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
	--prefix=/usr \
	--with-x11=xlib \
	--with-opengl=full \
	--with-tests=none \
	--enable-systemd \
	--enable-harfbuzz \
	--enable-wayland \
	--enable-xinput22 \
	--enable-fb \
	--disable-tslib

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir" install

# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 licenses/COPYING.BSD "$pkgdir/usr/share/licenses/$pkgname/COPYING.BSD"
  install -Dm644 licenses/COPYING.SMALL "$pkgdir/usr/share/licenses/$pkgname/COPYING.SMALL"
}
