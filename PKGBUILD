# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="gtk"
pkgver=4.18.6
_name="${_basename}${pkgver%%.*}"
pkgname="lib32-${_name}"
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (32-bit)"
url="https://www.gtk.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
# 'lib32-libsysprof-capture>=3.38'
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
makedepends=('glib2-devel' 'lib32-gcc-libs' 'meson>=1.2' 'shaderc'
             'vulkan-headers' 'wayland-protocols>=1.41')
provides=("lib${_basename}-${pkgver%%.*}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz"
        '0001-HACK-Don-t-use-objcopy-for-resource-embedding.patch'
        "${pkgname}-querymodules."{hook,script})
sha256sums=('e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03cc7becefffd0fa'
            'fc14603646b033567b198e09c739b972088a8d01c1f0c65eeba0e8cba121cea1'
            '0d8697c9ec95117f5bf333f5a4469b5061de4b206d0699d328988c5683742eaa'
            '1c96fb5f09baf59987e4b97bf3af37ea8feedcc753b48c91ffc6bff080461f21')
b2sums=('8666ae72e35a9cc0686082ee054fab62ef737651015cdda85613a7d087d7649621203f98b72bf69bbd0f8191c065a26130030c6c48cfcb0b6ba1de775ff4e162'
        'a672c99d673648a8af5c7e808642ce3ec91fecf336afddfbe0d4723c21cdf03787334754b0590de8617fc9eb10e71e25c2d91234857b1d10a9fe058ecbc72560'
        'bfc5e42867cf1f709561e477d1d7620c16764e46ea18b419c1093aea208e305f6e8635c541a3bde57468d3539e4c8ad47eb9886e5ad05197be1b9c2d0475e0c9'
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

  install -vDm644 "${pkgname}-querymodules.hook"   "${pkgdir}/usr/share/libalpm/hooks/${_name}-querymodules-32.hook"
  install -vDm755 "${pkgname}-querymodules.script" "${pkgdir}/usr/share/libalpm/scripts/${_name}-querymodules-32"
}
