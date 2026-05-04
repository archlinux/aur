# Maintainer: sfs <sfslinux@gmail.com>

pkgname=atril-light-poppler-opt
_atrilname=atril
_atrilver=1.23.0
_popplername=poppler
_popplerver=26.05.0
pkgver=${_atrilver}_poppler${_popplerver}
pkgrel=1
pkgdesc="MATE document viewer 1.23.0 with bundled Poppler runtime in /opt/poppler"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL')
depends=(
  'cairo'
  'curl'
  'dbus'
  'dconf'
  'desktop-file-utils'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'gtk3'
  'libjpeg'
  'libsecret'
  'zlib'
)
makedepends=(
  'cmake'
  'djvulibre'
  'glib2-devel'
  'itstool'
  'patchelf'
  'poppler-data'
)
optdepends=(
  'djvulibre: DjVu support'
  'libgxps: XPS support'
  'texlive-bin: DVI support'
  'yelp: for reading help documents'
)
provides=('atril' 'poppler-glib' 'libpoppler.so' 'libpoppler-glib.so')
conflicts=('atril' 'atril-gtk3')
replaces=('atril')
options=('!libtool' '!emptydirs')
install=atril-light-poppler-opt.install
source=(
  "https://poppler.freedesktop.org/${_popplername}-${_popplerver}.tar.xz"
  "https://github.com/mate-desktop/${_atrilname}/releases/download/v${_atrilver}/${_atrilname}-${_atrilver}.tar.xz"
  'atril-gtk3.desktop'
)
sha256sums=(
  '6fef27ff04f37db43054c86bcdff6128c9fb1f6af4ef3c8b369a7e9abd68d0bb'
  '3c8da6ed596e59168797ce31136a64520567d6cb15e74ba91b251f9f596ffced'
  '9da0755a5d35feddc250955f06f38d668e8b629dd9b491fe58293e5b2af70f77'
)

prepare() {
  mkdir -p poppler-build
}

build() {
  local file_prefix_map="-ffile-prefix-map=${srcdir}=."

  cd "${srcdir}/poppler-build"
  cmake "${srcdir}/${_popplername}-${_popplerver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="${CFLAGS} ${file_prefix_map}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${file_prefix_map}" \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/poppler \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPKG_CONFIG_INSTALL_DIR=lib/pkgconfig \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DENABLE_GTK_DOC=OFF \
    -DBUILD_GTK_TESTS=OFF \
    -DENABLE_QT5=OFF \
    -DENABLE_QT6=OFF \
    -DENABLE_BOOST=OFF \
    -DENABLE_NSS3=OFF \
    -DENABLE_GOBJECT_INTROSPECTION=OFF \
    -DENABLE_LIBOPENJPEG=none \
    -DENABLE_GPGME=OFF \
    -DENABLE_LCMS=OFF
  make
  make DESTDIR="${srcdir}/poppler-staged" install
  sed -i \
    -e "s|^prefix=.*|prefix=${srcdir}/poppler-staged/opt/poppler|" \
    -e "s|^libdir=.*|libdir=${srcdir}/poppler-staged/opt/poppler/lib|" \
    -e "s|^includedir=.*|includedir=${srcdir}/poppler-staged/opt/poppler/include|" \
    "${srcdir}/poppler-staged/opt/poppler/lib/pkgconfig"/*.pc

  cd "${srcdir}/${_atrilname}-${_atrilver}"
  export PKG_CONFIG_PATH="${srcdir}/poppler-staged/opt/poppler/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  export CFLAGS="${CFLAGS} ${file_prefix_map}"
  export CXXFLAGS="${CXXFLAGS} ${file_prefix_map}"
  pkg-config --exists poppler-glib
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/${_atrilname} \
    --with-gtk=3.0 \
    --disable-gtk-doc \
    --enable-djvu \
    --disable-static \
    --disable-caja \
    --without-smclient-backend \
    --without-matedesktop
  make
}

package() {
  cd "${srcdir}/${_atrilname}-${_atrilver}"
  make DESTDIR="${pkgdir}" install

  install -Dm755 -d "${pkgdir}/opt/poppler/lib"
  cp -a "${srcdir}/poppler-staged/opt/poppler/lib"/libpoppler.so* "${pkgdir}/opt/poppler/lib/"
  cp -a "${srcdir}/poppler-staged/opt/poppler/lib"/libpoppler-glib.so* "${pkgdir}/opt/poppler/lib/"

  local lib
  for lib in "${pkgdir}/opt/poppler/lib"/libpoppler{,-glib}.so.*.*.*; do
    [[ -f ${lib} && ! -L ${lib} ]] || continue
    patchelf --set-rpath '$ORIGIN' "${lib}"
  done

  local pdf_backend="${pkgdir}/usr/lib/atril/3/backends/libpdfdocument.so"
  test -f "${pdf_backend}"
  patchelf --set-rpath /opt/poppler/lib "${pdf_backend}"

  install -Dm644 "${srcdir}/atril-gtk3.desktop" "${pkgdir}/usr/share/applications/atril.desktop"
}
