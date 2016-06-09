# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=efl
pkgname=$_pkgname-git
pkgver=1.17.99.48513.g1a34d89
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('avahi' 'bullet' 'curl' 'fontconfig' 'fribidi' 'gst-plugins-base-libs' 'luajit' 'libexif'
         'libgl' 'libinput' 'libpulse' 'libspectre' 'libraw' 'librsvg' 'libwebp' 'libxcomposite'
         'libxcursor' 'libxinerama' 'libxkbcommon' 'libxp' 'libxrandr' 'libxss' 'libunwind'
         'openjpeg' 'poppler' 'wayland')
makedepends=('git' 'python2')
optdepends=('geoclue: For elocation'
            'gst-plugins-base: Video and thumbnail codecs'
            'gst-plugins-good: Video and thumbnail codecs'
            'gst-plugins-bad: Video and thumbnail codecs'
            'gst-plugins-ugly: Video and thumbnail codecs'
            'gst-libav: Video and thumbnails with ffmpeg/libav'
            'libreoffice: Office document thumbnails'
            'python2: Compare Eina benchmarks')
provides=("$_pkgname=$pkgver" elementary{,-git}=$pkgver "evas_generic_loaders=$pkgver")
conflicts=("$_pkgname" elementary{,-git} elementary_test{,-git} evas_generic_loaders{,-git})
options=('debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local efl_version=$(grep -m1 EFL_VERSION configure.ac | awk -F [][] '{print $2 "." $4 "." $6}')
  efl_version=$efl_version$(awk 'match($0, /^AC_INIT\(.*\[efl_version-?([^\]]*)\]/, a) {print a[1]}' configure.ac)

  printf "%s.%s.g%s" "$efl_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --with-tests=none \
    --with-opengl=full \
    --disable-egl \
    --enable-wayland \
    --enable-drm \
    --enable-elput \
    --enable-fb \
    --disable-tslib \
    --enable-image-loader-webp \
    --enable-systemd \
    --enable-harfbuzz \
    --enable-xinput22 \
    --enable-multisense \
    --enable-liblz4

  make
}

package() {
  cd $_pkgname

# Workaround for https://phab.enlightenment.org/T3778
  install -d "$pkgdir/usr/lib/evas/utils/"

  make -j1 DESTDIR="$pkgdir" install

# Workaround for https://phab.enlightenment.org/T3848
  install -m755 src/generic/evas/pdf/evas_generic_pdf_loader.libreoffice "$pkgdir/usr/lib/evas/utils/"

# compile python files
  python2 -m compileall -q "$pkgdir"
  python2 -O -m compileall -q "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING COPYING.images licenses/COPYING.{BSD,SMALL}
}
