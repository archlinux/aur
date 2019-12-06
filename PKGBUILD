# Maintainer: Carsten Haitzler <raster@rasterman.com>
# Contributor: Gavin Fernandes <gavinfernandes2012@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=efl
pkgname=$_pkgname-git
pkgver=1.23.99.64536.g19f6be78c4
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'MIT' 'custom')
depends=('avahi' 'curl' 'fontconfig' 'fribidi'
         'gst-plugins-base-libs' 'luajit' 'libexif' 'libgl' 'libinput'
         'libpulse' 'libspectre' 'libraw' 'librsvg' 'libwebp' 'libxcomposite'
         'libxcursor' 'libxinerama' 'libxkbcommon' 'libxp' 'libxrandr'
         'libxss' 'libunwind' 'mesa' 'openjpeg2' 'poppler'
         'shared-mime-info' 'mailcap' 'ttf-font' 'scim'
         'wayland' 'wayland-protocols' 'libxkbcommon-x11'
         'pulseaudio')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot' 'python2' 'procps-ng')
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

  local v_ver=$(grep version meson.build | head -1 | sed s/version//g | tr ":'," "   " | awk '{print $1}')

  printf "%s.%s.g%s" "$v_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  # fix -mfpu= flags that break a build e.g. for neon on armv7 due to
  # basically makepkg.conf being "bad' with default CFLAGS having
  # -mfpu=vfpv3-d16
  export CFLAGS=`echo -n $CFLAGS | sed 's/-mfpu=vfpv3-d16/-mfpu=neon-vfpv4/g'`
  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  MEM=`free -m | head -2 | tail -1 | awk '{printf("%s", $7);}'`
  if test "$MEM" -lt 300; then MEM=300; fi
  J=`expr $MEM / 300`
  CPUS=`echo /sys/devices/system/cpu/cpu[0-9]* | wc -w`
  if test "$J" -gt $CPUS; then J=$CPUS; fi
  if test "$J" -lt 1; then J=1; fi
  echo "Free Mem: $MEM M, using $J threads for build"

  rm -rf build
  meson --prefix=/usr \
    -Dfb=true \
    -Ddrm=true \
    -Dwl=true \
    -Dnetwork-backend=connman \
    -Devas-loaders-disabler=json \
    -Dbindings= \
    -Dbuild-examples=false \
    -Dbuild-tests=false \
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
