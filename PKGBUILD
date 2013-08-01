# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=efl-git
_pkgname=${pkgname%-*}
pkgver=1.7.99.22911.4d54c97
pkgrel=2
pkgdesc="Enlightenment Foundation Libraries - Development version (Ecore, Eldbus, Edje, Eet, Eeze, Efreet, Eina, Eio, Embryo, Emotion, Eo, Ephysics, Ethumb, & Evas)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('bullet' 'curl' 'lua' 'shared-mime-info' 'libxkbcommon' 'wayland'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxss' 'libxrandr' 'libxp'
         'libgl' 'libwebp' 'libpulse' 'libexif' 'gstreamer0.10-base'
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
          "$_pkgname=$pkgver" 'efl_x11')
conflicts=('ecore' 'edje' 'eet' 'eeze' 'efreet' 'eina' 'eio' 'embryo' 'emotion' 'ethumb' 'evas'
           "$_pkgname" 'efl_x11')
options=('!libtool' 'debug')
install="$_pkgname.install"
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

  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --with-tests=none \
    --with-x11=xlib \
    --with-opengl=full \
    --enable-wayland \
    --enable-fb \
    --disable-tslib \
    --enable-image-loader-webp \
    --enable-systemd \
    --enable-harfbuzz \
    --enable-xinput22 \
    --enable-multisense

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COMPLIANCE "$pkgdir/usr/share/licenses/$pkgname/COMPLIANCE"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 licenses/COPYING.BSD "$pkgdir/usr/share/licenses/$pkgname/COPYING.BSD"
  install -Dm644 licenses/COPYING.SMALL "$pkgdir/usr/share/licenses/$pkgname/COPYING.SMALL"
  sed -n '1,/.details/p' licenses/COPYING.LGPL > "$pkgdir/usr/share/licenses/$pkgname/COPYING.LGPL"
  ln -s ../common/GPL2/license.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.GPL"
}

