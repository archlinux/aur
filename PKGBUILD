# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Former Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Former Maintainer: Matrix <thysupremematrix at tuta dot io>
# Contributor: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10
_pkgname=gstreamer
pkgver=0.10.36
pkgrel=20
pkgdesc="GStreamer Multimedia Framework"
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL')
url='https://gstreamer.freedesktop.org'
depends=('libxml2' 'glib2')
makedepends=('intltool' 'python3' 'pkg-config' 'gtk-doc' 'bison' 'flex' 'glib2-devel' 'automake' 'autoconf' 'libtool')
source=("https://gstreamer.freedesktop.org/src/gstreamer/${_pkgname}-${pkgver}.tar.xz"
        'tests-remove-silly-test_fail_abstract_new-check.patch'
        'bison3.patch')
sha256sums=('9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da'
            'd3d3f4f04453831fdb4244bfe174a38c4e6f9f4da5c8c9050dcfa1a6097aad52'
            'ed154e280abf59b24d98a8ab0fe868b449b26aa61f7ae3813fab8ac615fcaefa')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i ../tests-remove-silly-test_fail_abstract_new-check.patch
  patch -Np1 -i ../bison3.patch
  sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
  sed -e 's/static volatile gsize gonce_data/static gsize gonce_data/g' -i gst/gstutils.h
  
  # Create local symlinks to required glib tools if needed
  if [ ! -f /usr/bin/glib-mkenums ]; then
    mkdir -p tools
    cat > tools/glib-mkenums <<'EOF'
#!/bin/sh
exec /usr/bin/glib-mkenums-2.0 "$@"
EOF
    chmod +x tools/glib-mkenums
  fi
  
  if [ ! -f /usr/bin/glib-genmarshal ]; then
    mkdir -p tools
    cat > tools/glib-genmarshal <<'EOF'
#!/bin/sh
exec /usr/bin/glib-genmarshal-2.0 "$@"
EOF
    chmod +x tools/glib-genmarshal
  fi
  
  # Run autogen script
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${_pkgname}-${pkgver}
  
  # Add our tools directory to the PATH if it exists
  if [ -d "$PWD/tools" ]; then
    export PATH="$PWD/tools:$PATH"
  fi
  
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libexecdir=/usr/lib \
              --disable-gtk-doc \
              --disable-static \
              --disable-introspection
  
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # Remove unversioned gst-* binaries to avoid possible conflicts
  cd "${pkgdir}/usr/bin"
  for bins in `ls *-0.10`; do
    rm -f ${bins/-0.10/}
  done
}
