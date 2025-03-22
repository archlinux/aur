# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="gtk"
pkgver=4.16.12
_name="${_basename}${pkgver%%.*}"
pkgname="lib32-${_name}"
pkgrel=2
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
# 'lib32-libsysprof-capture>=3.38' 'wayland-protocols>=1.41'
makedepends=('gcc-libs' 'glib2-devel' 'meson>=1.2' 'shaderc' 'vulkan-headers'
             'wayland-protocols>=1.32')
provides=("lib${_basename}-${pkgver%%.*}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz"
        '0001-HACK-Don-t-use-objcopy-for-resource-embedding.patch'
        "${pkgname}-querymodules."{hook,script})
sha256sums=('ef31bdbd6f082c4401634a20c850b0050c9bf252ef1e079764ee95a2a0c4c95a'
            'fc14603646b033567b198e09c739b972088a8d01c1f0c65eeba0e8cba121cea1'
            'a069303826e98d64db67f986b9d98a7e927693020f2f1d0b51da5dfa361bebb6'
            '1c96fb5f09baf59987e4b97bf3af37ea8feedcc753b48c91ffc6bff080461f21')
b2sums=('298c6f41e6100f9ebf7b51bf93c55102c82b4eac53bb834744ae545b2ee2ac83c7bd271e0c64ff03031d61042259695528ea36e8a1efac704bbe73dac77e7f7f'
        'a672c99d673648a8af5c7e808642ce3ec91fecf336afddfbe0d4723c21cdf03787334754b0590de8617fc9eb10e71e25c2d91234857b1d10a9fe058ecbc72560'
        '4a24408c117f6bfe96377d2fa10c5ed82efbe77487ab60fc5b260f44cf0197d50ada16225e0cc09e6bef98ebf4722d3312a85e9e7aad2d1e576b5954ec7e277b'
        'f0372ba65b6203e569da5bc8b262e76f2b7f2682de3eca5006953e4de2e99785d9793044d2f5350cd2b863cb1760780deb36651a7ab20bc7ab317d1eeafcd07f')

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

  rm -rf "${pkgdir}/usr/"{bin,include,share}

  install -vDm644 "${pkgname}-querymodules.hook"   "${pkgdir}/usr/share/libalpm/hooks/${pkgname}-querymodules.hook"
  install -vDm644 "${pkgname}-querymodules.script" "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-querymodules"
}
