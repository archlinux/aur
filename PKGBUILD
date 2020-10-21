# CLONED FROM 'efl-git' - https://aur.archlinux.org/packages/efl-git/
#
# Maintainer EndlessEden < TODO >
#
# NOTE: This is a <WIP> | Dragons ahead...
#

_pkgname=efl
pkgname=$_pkgname-full-git
pkgver=1.25.99.66347.gd6a6dd54a1
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Full Development version (All optional settings enabled)"
arch=('i686' 'x86_64')
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
         'wayland' 'wayland-protocols' 'libxkbcommon-x11'
         'pulseaudio')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot' 'procps-ng' 'libxpresent')
optdepends=('gst-plugins-base: Video and thumbnail codecs'
            'gst-plugins-good: Video and thumbnail codecs'
            'gst-plugins-bad: Video and thumbnail codecs'
            'gst-plugins-ugly: Video and thumbnail codecs'
            'gst-libav: Video and thumbnails with ffmpeg/libav'
            'libreoffice: Office document thumbnails')
provides=("$_pkgname=$pkgver" elementary{,-git}=$pkgver "evas_generic_loaders=$pkgver" ephysics{,-git}=$pkgver efl-git)
conflicts=("$_pkgname" elementary{,-git} elementary_test{,-git} evas_generic_loaders{,-git})
options=('debug' 'ccache')
source=("git+https://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(grep version meson.build | head -1 | sed s/version//g | tr ":'," "   " | awk '{print $1}')

  printf "%s.%s.g%s" "$v_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  gl_drm=$(cat $srcdir/$_pkgname/src/modules/ecore_evas/engines/drm/meson.build | grep -oc 'engine_gl_drm' )
  if [ $gl_drm -gt 0 ]; then
  	sed -e 's/engine_gl_drm/gl_deps/g' $srcdir/$_pkgname/src/modules/ecore_evas/engines/drm/meson.build > $srcdir/$_pkgname/src/modules/ecore_evas/engines/drm/meson.build
  fi

}

build() {
  cd $_pkgname

  # fix -mfpu= flags that break a build e.g. for neon on armv7 due to
  # basically makepkg.conf being "bad' with default CFLAGS having
  # -mfpu=vfpv3-d16
  export CFLAGS=`echo -n $CFLAGS | sed 's/-mfpu=vfpv3-d16/-mfpu=neon-vfpv4/g'`
  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  # this is so this will build on ALARM on a raspberry pi with 1GB RAM...
  # and ninja doesnt do MAKEFLAKGS or NINJAFLAGS thus have to pass -j N
  MEM=`free -m | head -2 | tail -1 | awk '{printf("%s", $7);}'`
  if test "$MEM" -lt 300; then MEM=300; fi
  J=`expr $MEM / 300`
  CPUS=`echo /sys/devices/system/cpu/cpu[0-9]* | wc -w`
  if test "$J" -gt $CPUS; then J=$CPUS; fi
  if test "$J" -lt 1; then J=1; fi
  echo "Free Mem: $MEM M, using $J threads for build"

#-Dtslib=true \ #Disabled until fixed upstream. tslib cannot be used when framebuffer(fbcon) is enabled.

  rm -rf build
  meson --prefix=/usr \
    -Dfb=true \
    -Ddrm=true \
    -Dwl=true \
    -Dnetwork-backend=connman \
    -Dlua-interpreter=lua \
    -Dbuild-examples=false \
    -Dbuild-tests=false \
    -Dx11=true \
    -Dsdl=true \
    -Dbuffer=true \
    -Dwl-deprecated=true \
    -Ddrm-deprecated=true \
    -Dxpresent=true \
    -Dopengl=full \
    -Dpixman=true \
    -Dwindows-version=win10 \
    -Decore-imf-loaders-disabler='' \
    -Dmono-beta=true \
    -Dhyphen=true \
    -Dvnc-server=true \
    -Delua=true \
    -Dphysics=true \
    -Dglib=true \
    -Davahi=true \
    -Dbindings=cxx,lua,mono \
    . build
  ninja -j $J -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING COPYING.images licenses/COPYING.{BSD,SMALL}
}
