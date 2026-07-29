# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
_pkgname=gst-plugins-base
pkgname=('gstreamer0.10-base' 'gstreamer0.10-base-plugins')
pkgver=0.10.36
pkgrel=15
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL-2.0-or-later')
makedepends=('gstreamer0.10>=0.10.36' 'orc' 'libxv' 'alsa-lib' 'cdparanoia'
             'libvisual' 'libvorbis' 'libtheora' 'pango' 'cairo' 'glib2-devel'
             'libogg' 'libx11' 'libxext' 'libxml2' 'perl' 'zlib')
options=(!emptydirs)
url='https://gstreamer.freedesktop.org/'
source=("https://gstreamer.freedesktop.org/src/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        fix-crash-0-byte-ogg.patch
        colorbalance-fix-abi.patch
        videoscale-fix-negotiation.patch
        ayuv64-lanczos.patch
        enum_headers.patch)
sha256sums=('1fe45c3894903001d4d008b0713dab089f53726dcb5842d5b40c2595a984e64a'
            'a6a01035ea9627737f9c17f72919857ed43ccc7c2cb08b645b43ed89f78d0f4f'
            '7442c5c68068428b8c7ac1d3825ce29f1bb152b75b77047b9e806c7d322b780c'
            'ae27f7be58997217f67898b37b138a485c203389e56b65e6b31c23f769ef39ca'
            '3792dfe80c69f51c0db98533e8fb16707b5dd2ee6933ea6098583af873ceb44a'
            '6c2b99c62741a17c6571fe36f82a263e06608316f9d17172edbf07517787ce88')

prepare() {
  cd "${_pkgname}-${pkgver}"
  sed -i -e '/AC_PATH_XTRA/d' -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
  patch -Np1 -i ../fix-crash-0-byte-ogg.patch
  patch -Np1 -i ../colorbalance-fix-abi.patch
  patch -Np1 -i ../ayuv64-lanczos.patch
  patch -Np1 -i ../videoscale-fix-negotiation.patch
  patch -Np1 -i ../enum_headers.patch

  sed -i 's|g_object_ref (G_OBJECT (interface))|g_object_ref ((GstMixer *)(interface))|' ext/alsa/gstalsamixer.c

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${_pkgname}-${pkgver}"

  CPPFLAGS+=" $(pkg-config --cflags pangocairo pango cairo)"
  LDFLAGS+=" $(pkg-config --libs libxml-2.0)"
  export CPPFLAGS LDFLAGS
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static \
              --enable-experimental \
              --disable-gnome_vfs \
              --disable-gtk-doc \
              --disable-introspection

  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check-exports
  make -C tests/check check CFLAGS="${CFLAGS} -std=gnu17" \
    TESTS='libs/audio libs/fft libs/netbuffer'
}

package_gstreamer0.10-base() {
  pkgdesc="Legacy GStreamer 0.10 base plugin libraries"
  depends=('gstreamer0.10>=0.10.36' 'glib2' 'glibc' 'libx11' 'libxext' 'libxml2'
           'libxv' 'orc' 'perl' 'zlib')
  provides=('libgstapp-0.10.so' 'libgstaudio-0.10.so' 'libgstcdda-0.10.so'
            'libgstfft-0.10.so' 'libgstinterfaces-0.10.so' 'libgstnetbuffer-0.10.so'
            'libgstpbutils-0.10.so' 'libgstriff-0.10.so' 'libgstrtp-0.10.so'
            'libgstrtsp-0.10.so' 'libgstsdp-0.10.so' 'libgsttag-0.10.so'
            'libgstvideo-0.10.so')

  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" SUBDIRS_EXT= install
}

package_gstreamer0.10-base-plugins() {
  pkgdesc="Legacy GStreamer 0.10 base plugins"
  depends=("gstreamer0.10-base=${pkgver}-${pkgrel}" 'alsa-lib' 'cairo' 'cdparanoia'
           'glib2' 'glibc' 'gstreamer0.10' 'libogg' 'libtheora' 'libvisual' 'libvorbis'
           'pango')
  groups=('gstreamer0.10-plugins')

  cd "${_pkgname}-${pkgver}"
  make -C gst-libs DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" install
  make -C gst-libs DESTDIR="${pkgdir}" uninstall
}
