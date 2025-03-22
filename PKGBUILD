# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="gtk"
pkgver=4.16.12
_name="${_basename}${pkgver%%.*}"
pkgname="lib32-${_name}"
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (32-bit)"
url="https://www.gtk.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}>=${pkgver}" 'lib32-cairo>=1.18.2' 'lib32-fontconfig'
         'lib32-fribidi>=1.0.6' 'lib32-gdk-pixbuf2>=2.30' 'lib32-glib2>=2.80'
         'lib32-glibc' 'lib32-graphene>=1.10' 'lib32-gst-plugins-bad-libs'
         'lib32-gst-plugins-base-libs' 'lib32-gstreamer>=1.24' 
         'lib32-harfbuzz>=8.4' 'lib32-libcloudproviders>=0.3.1'
         'lib32-colord>=0.1.9' 'lib32-libcups' 'lib32-libepoxy>=1.4'
         'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libtiff' 'lib32-libx11'
         'lib32-libxcursor' 'lib32-libxdamage' 'lib32-libxext'
         'lib32-libxfixes' 'lib32-libxi' 'lib32-libxinerama'
         'lib32-libxkbcommon>=0.2' 'lib32-libxrandr' 'lib32-pango>=1.56'
         'lib32-tinysparql' 'lib32-vulkan-icd-loader' 'lib32-wayland>=1.23')
# 'lib32-libsysprof-capture>=3.38' 'lib32-wayland-protocols>=1.41'
makedepends=('gcc-libs' 'glib2-devel' 'meson>=1.2' 'shaderc' 'vulkan-headers'
             'wayland-protocols>=1.32')
provides=("lib${_basename}-${pkgver%%.*}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz"
        '0001-HACK-Don-t-use-objcopy-for-resource-embedding.patch')
sha256sums=('ef31bdbd6f082c4401634a20c850b0050c9bf252ef1e079764ee95a2a0c4c95a'
            'fc14603646b033567b198e09c739b972088a8d01c1f0c65eeba0e8cba121cea1')
b2sums=('298c6f41e6100f9ebf7b51bf93c55102c82b4eac53bb834744ae545b2ee2ac83c7bd271e0c64ff03031d61042259695528ea36e8a1efac704bbe73dac77e7f7f'
        'a672c99d673648a8af5c7e808642ce3ec91fecf336afddfbe0d4723c21cdf03787334754b0590de8617fc9eb10e71e25c2d91234857b1d10a9fe058ecbc72560')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/0001-HACK-Don-t-use-objcopy-for-resource-embedding.patch"
}

build() {
  export CFLAGS+=" -m32 -DG_DISABLE_CAST_CHECKS"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    --cross-file lib32
    -D x11-backend=true
    -D wayland-backend=true
    -D broadway-backend=true
    -D media-gstreamer=enabled
    -D print-cpdb=disabled
    -D print-cups=enabled
    -D vulkan=enabled
    -D cloudproviders=enabled
    -D sysprof=disabled # TODO
    -D tracker=enabled
    -D colord=enabled
    # -D f16c=enabled # ?
    # -D accesskit=disabled
    -D introspection=disabled
    -D documentation=false
    -D screenshots=false
    -D man-pages=false
    -D build-demos=false
    -D build-testsuite=false
    -D build-examples=false
    -D build-tests=false    
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   meson test -C "${_pkgsrc}/build" --print-errorlogs
# }

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
