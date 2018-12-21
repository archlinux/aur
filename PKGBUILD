# Maintainer: Carsten Haitzler <raster@rasterman.com>
# Contributor: Gavin Fernandes <gavinfernandes2012@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=efl
pkgname=$_pkgname-git
pkgver=1.21.99.60509.g166d5e4767
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'MIT' 'custom')
depends=('avahi' 'bullet' 'curl' 'fontconfig' 'fribidi'
         'gst-plugins-base-libs' 'luajit' 'libexif' 'libgl' 'libinput'
         'libpulse' 'libspectre' 'libraw' 'librsvg' 'libwebp' 'libxcomposite'
         'libxcursor' 'libxinerama' 'libxkbcommon' 'libxp' 'libxrandr'
         'libxss' 'libunwind' 'mesa' 'openjpeg2' 'poppler' 'wayland'
         'shared-mime-info' 'ttf-font' 'scim' 'libibus' 'glib2'
         'wayland' 'wayland-protocols' 'libxkbcommon-x11')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot')
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
source=("git+https://git.enlightenment.org/core/$_pkgname.git")
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

  MEM=`free -m | head -2 | tail -1 | awk '{printf("%s", $4);}'`
  J=`expr $MEM / 200`
  CPUS=`echo /sys/devices/system/cpu/cpu[0-9]* | wc -w`
  if test "$J" -gt $CPUS; then J=$CPUS; fi
  if test "$J" -lt 1; then J=1; fi
  echo "Free Mem: $MEM M, using $J threads for build"

  rm -rf build
  meson --prefix=/usr \
    -Dopengl=es-egl \
    -Dxinput22=true \
    -Dbuffer=true \
    -Dfb=true \
    -Ddrm=true \
    -Dtslib=false \
    -Dharfbuzz=true \
    -Dwl=true \
    -Dnetwork-backend=connman \
    -Devas-loaders-disabler= \
    -Dmono=false \
    -Dbuild-examples=false \
    -Dbuild-tests=false \
    -Dcxx=false \
    -Decore-imf-loaders-disabler= \
    . build

  ninja -j $J -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install

# compile python files
  python2 -m compileall -q "$pkgdir"
  python2 -O -m compileall -q "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING COPYING.images licenses/COPYING.{BSD,SMALL}
}
