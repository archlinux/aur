# Maintainer: Carsten Haitzler <raster@rasterman.com>

_pkgname=efl
pkgname=($_pkgname-git-asan)
pkgver=1.26.99.66907.g7743b17dba
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version - Asan debug build"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'MIT' 'custom')
depends=('curl' 'fontconfig' 'fribidi' 'harfbuzz'
         'gst-plugins-base-libs' 'lua52' 'libgl' 'libinput'
         'libpulse' 'libsndfile' 'libspectre' 'libraw' 'librsvg' 'libwebp'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxkbcommon' 'libxrandr'
         'libxss' 'libunwind' 'mesa' 'poppler' 'openjpeg2' 'libjpeg-turbo'
         'libpng' 'libtiff' 'giflib' 'lz4' 'zlib' 'systemd-libs' 'openssl'
         'glibc' 'libutil-linux' 'dbus'
         'shared-mime-info' 'mailcap' 'ttf-font' 'scim'
         'wayland' 'libxkbcommon-x11' 'pulseaudio')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot' 'procps-ng' 'ccache' 'wayland-protocols')
optdepends=('gst-plugins-base: Video and thumbnail codecs'
            'gst-plugins-good: Video and thumbnail codecs'
            'gst-plugins-bad: Video and thumbnail codecs'
            'gst-plugins-ugly: Video and thumbnail codecs'
            'gst-libav: Video and thumbnails with ffmpeg/libav'
            'libreoffice: Office document thumbnails')
provides=("$_pkgname=$pkgver" $_pkgname-git=$pkgver elementary{,-git}=$pkgver "evas_generic_loaders=$pkgver")
conflicts=("$_pkgname" $_pkgname-git elementary{,-git} elementary_test{,-git} evas_generic_loaders{,-git})
options=('!strip' 'ccache')
source=("git+https://git.enlightenment.org/enlightenment/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(grep version meson.build | head -1 | sed s/version//g | tr ":'," "   " | awk '{print $1}')

  printf "%s.%s.g%s" "$v_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export ASAN_OPTIONS="detect_leaks=0:abort_on_error=1::new_delete_type_mismatch=0"

  MEM=`free -m | head -2 | tail -1 | awk '{printf("%s", $7);}'`
  if test "$MEM" -lt 300; then MEM=300; fi
  J=`expr $MEM / 300`
  CPUS=`echo /sys/devices/system/cpu/cpu[0-9]* | wc -w`
  if test "$J" -gt $CPUS; then J=$CPUS; fi
  if test "$J" -lt 1; then J=1; fi
  echo "Free Mem: $MEM M, using $J threads for build"

  unset CPPFLAGS
  export CFLAGS="-O0 -g3"
  export CXXFLAGS="-O0 -g3"
  rm -rf build
  meson --prefix=/usr \
    -Db_sanitize=address \
    -Dfb=true \
    -Ddrm=true \
    -Dwl=true \
    -Dnetwork-backend=connman \
    -Dlua-interpreter=lua \
    -Dbindings= \
    -Dbuild-examples=false \
    -Dbuild-tests=false \
    . build
  ninja -j $J -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING licenses/COPYING.{BSD,SMALL}
}
