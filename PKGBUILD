# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=efl-git
pkgver=20130215
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version (Ecore, EDBus, Edje, Eet, Eeze, Efreet, Eina, Eio, Embryo, Emotion, Eo, Ephysics, Ethumb, & Evas)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('bullet' 'curl' 'dbus' 'udev' 'lua' 'shared-mime-info'
         'fribidi' 'harfbuzz' 'fontconfig'
         'mesa' 'giflib' 'libtiff' 'libpng' 'libpulse' 'libexif'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxss' 'libxrandr' 'libxp'
         'gstreamer0.10-base-plugins')
makedepends=('git')
optdepends=('python2: compare Eina benchmarks'
            'evas_generic_loaders-git: More video/graphic/icon loaders for Evas'
            'gstreamer0.10-good-plugins: Access more types of video in Emotion'
            'gstreamer0.10-bad-plugins: Access more types of video in Emotion'
            'gstreamer0.10-ugly-plugins: Access more types of video in Emotion'
            'gstreamer0.10-ffmpeg: Access video with ffmpeg in Emotion')
conflicts=('ecore' 'ecore-svn' 'edbus' 'edbus-svn' 'edje' 'edje-svn'
           'eet' 'eet-svn' 'eeze' 'eeze-svn' 'efreet' 'efreet-svn'
           'eina' 'eina-svn' 'eio' 'eio-svn' 'embryo' 'embryo-svn'
           'emotion' 'emotion-svn' 'ephysics' 'ephysics-svn'
           'ethumb' 'ethumb-svn' 'evas' 'evas-svn' 'efl-svn')
provides=('ecore' 'ecore-svn' 'edbus' 'edbus-svn' 'edje' 'edje-svn'
          'eet' 'eet-svn' 'eeze' 'eeze-svn' 'efreet' 'efreet-svn'
          'eina' 'eina-svn' 'eio' 'eio-svn' 'embryo' 'embryo-svn'
          'emotion' 'emotion-svn' 'ephysics' 'ephysics-svn'
          'ethumb' 'ethumb-svn' 'evas' 'evas-svn' 'efl-svn')
install=efl.install
options=('!libtool' '!emptydirs' '!strip')
         
_gitroot="git://git.enlightenment.org/core/efl.git"
_gitname="efl"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

# set python scripts to run with python2
  sed -i 's/env python/python2/g' \
    "$srcdir/$_gitname-build/src/scripts/eina/eina-bench-cmp"

  ./autogen.sh --prefix=/usr \
	--with-x11=xlib \
	--with-opengl=full \
	--with-tests=none \
	--enable-harfbuzz \
	--enable-fb \
	--disable-tslib

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make -j1 DESTDIR="$pkgdir" install

# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 licenses/COPYING.BSD \
	"$pkgdir/usr/share/licenses/$pkgname/COPYING.BSD"
  install -Dm644 licenses/COPYING.SMALL \
	"$pkgdir/usr/share/licenses/$pkgname/COPYING.SMALL"

# remove build directory
  rm -r "$srcdir/$_gitname-build"
}
