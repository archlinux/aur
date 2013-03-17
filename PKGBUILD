# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=efl-git
_pkgname=efl
pkgver=1.7.99.x
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version (Ecore, EDBus, Edje, Eet, Eeze, Efreet, Eina, Eio, Embryo, Emotion, Eo, Ephysics, Ethumb, & Evas)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('bullet' 'curl' 'systemd' 'lua' 'shared-mime-info'
         'libxkbcommon' 'wayland'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxss' 'libxrandr' 'libxp'
         'libgl' 'giflib' 'libtiff' 'libpng' 'libpulse' 'libexif'
         'gstreamer0.10-base-plugins'
         'fribidi' 'harfbuzz' 'fontconfig')
makedepends=('git')
optdepends=('python2: compare Eina benchmarks'
            'evas_generic_loaders-git: More video/graphic/icon loaders for Evas'
            'gstreamer0.10-good-plugins: Access more types of video in Emotion'
            'gstreamer0.10-bad-plugins: Access more types of video in Emotion'
            'gstreamer0.10-ugly-plugins: Access more types of video in Emotion'
            'gstreamer0.10-ffmpeg: Access video with ffmpeg in Emotion'
           )
provides=('ecore=$pkgver' 'ecore-svn' 'edbus' 'edbus-svn' 'edje=$pkgver' 'edje-svn'
          'eet=$pkgver' 'eet-svn' 'eeze=$pkgver' 'eeze-svn' 'efreet=$pkgver' 'efreet-svn'
          'eina=$pkgver' 'eina-svn' 'eio=$pkgver' 'eio-svn' 'embryo=$pkgver' 'embryo-svn'
          'emotion=$pkgver' 'emotion-svn' 'ephysics' 'ephysics-svn'
          'ethumb=$pkgver' 'ethumb-svn' 'evas=$pkgver' 'evas-svn' 'efl-svn')
conflicts=('ecore' 'edbus' 'edje' 'eet' 'eeze' 'efreet' 'eina' 'eio'
           'embryo' 'emotion' 'ephysics' 'ethumb' 'evas' 'efl-svn')
options=('!libtool' 'debug')
install=efl.install
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(grep -m 1 EFL_VERSION configure.ac | grep -o "[[:digit:]]*" | tr '\n' '.')$(git rev-list --count HEAD)
}

prepare() {
# set python scripts to run with python2
  sed -i 's/env python/python2/g' "$srcdir/$_pkgname/src/scripts/eina/eina-bench-cmp"
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
