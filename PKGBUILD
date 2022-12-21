# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: dreieck
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=(python2-wxpython3)
pkgver=3.0.2.0
pkgrel=10
pkgdesc="wxWidgets 3 Legacy GTK 3 GUI toolkit for Python 2."
depends=(
  'python2'
  'sdl'
)
provides=(
  "python2-wxpython=${pkgver}"
  "python2-wxpython-gtk3=${pkgver}"
  "python2-wxpython3=${pkgver}"
  "wxpython=${pkgver}"
  "wxpython-gtk3=${pkgver}"
  "wxpython3=${pkgver}"
  "wxpython3-gtk3=${pkgver}"
)
conflicts=(
  'wxpython'
  'wxwidgets3.0' # ABI incompatible
)
replaces=('wxpython')
arch=(
  'i686'
  'x86_64'
)
license=('custom:wxWindows')
url="https://www.wxpython.org"

makedepends=(
  'glu'
  'python2-setuptools'
  'expat'
  'gstreamer0.10-base'
  'libjpeg'
  'libpng'
  'libtiff'
  'python2'
  'sdl'
)

source=(
  "https://downloads.sourceforge.net/wxpython/wxPython-src-${pkgver}.tar.bz2"
  "fix-plot.patch"
  "fix-editra-removal.patch"
)
sha256sums=(
  'd54129e5fbea4fb8091c87b2980760b72c22a386cb3b9dd2eebc928ef5e8df61'
  '2d8b2bdbf55172738c7bf93955e552aac61842800c3b8b0a2e1f07f4314abc65'
  '559b076f206c44e66b33857f49068d66f59a3fc15b97972486e32a8105885554'
)


prepare() {
  cd "${srcdir}"

  # Patch for python2
  msg2 "Patching shabeng-lines for python2 ..."
  local _file
  grep -Erl '(bin/env python$|bin/env python[[:space:]]|bin/python$|bin/python[[:space:]])' * | while read _file; do
    sed -Ei 's|bin/env python$|bin/env python2|' "${_file}"
    sed -Ei 's|bin/env python([[:space:]])|bin/env python2\1|' "${_file}"
    sed -Ei 's|bin/python$|bin/python2|' "${_file}"
    sed -Ei 's|bin/python([[:space:]])|bin/python2\1|' "${_file}"
  done
  ## The following python version fixing command was the original one. It is much slower, but kept here in case the above is not working correctly.
  # find . -type f -exec sed -i 's|env python|env python2|' {} \;

  cd "wxPython-src-${pkgver}/wxPython"
  # Fix plot library (FS#42807)
  msg2 "Applying patch 'fix-plot.patch' ..."
  patch -Np1 -i ../../fix-plot.patch

  # Fix editra removal (FS#63563)
  msg2 "Applying patch  'fix-editra-removal.patch' ..."
  patch -Np2 -i ../../fix-editra-removal.patch
}

_configure_opts=(
    --prefix='/usr'
    --libdir='/usr/lib'
    --includedir='/usr/include'
    --disable-monolithic
    --disable-rpath
    --enable-geometry
    --enable-graphics_ctx
    --enable-optimise
    --enable-sound
    --enable-display
    --enable-unicode
    --with-gtk=3
    --with-python=/usr/bin/python2
    --with-opengl
    --with-gnomeprint
    --with-sdl
)

# Old, non-maintained software. Use older C/C++ standard.
_C_std='gnu++14' # gnu11 # gnu17
_CXX_std='gnu++14' # gnu++11 # gnu++14 # gnu++17

# In case a newer C standard is used, warnings are generated which should not be treated as errors.
_append_to_CFLAGS_after_configure=' -Wno-error=format-security -Wno-error=register -Wno-error=deprecated-declarations -Wno-error=alloc-size-larger-than= -Wno-error=write-strings -Wno-error=return-local-addr -Wno-error=attributes' # Or just use -Wno-error to catch all.
_append_to_CXXFLAGS_after_configure="${_append_to_CFLAGS_after_configure}"

build() {
  cd "${srcdir}/wxPython-src-${pkgver}"

  CFLAGS+=" -std=${_C_std}"
  CXXFLAGS+=" -std=${_CXX_std}"
  export CFLAGS
  export CXXFLAGS

  ./configure "${_configure_opts[@]}"

  CFLAGS+="${_append_to_CFLAGS_after_configure} -std=${_C_std}"
  CXXFLAGS+="${_append_to_CXXFLAGS_after_configure} -std=${_CXX_std}"
  export CFLAGS
  export CXXFLAGS

  make

  cd wxPython
  python2 setup.py WXPORT=gtk3 UNICODE=1 EP_ADD_OPTS=1 EP_FULL_VER=0 NO_SCRIPTS=1 WX_CONFIG="${srcdir}/wxPython-src-${pkgver}/lib/wx/config/gtk3-unicode-3.0 --prefix=/usr --no_rpath" SYS_WX_CONFIG="/usr/lib/wx/config/gtk3-unicode-3.0 --version=3.0.2.0 --toolkit=gtk3 --static=no" build_ext --rpath=/usr/lib build
}

package() {
  cd "${srcdir}/wxPython-src-${pkgver}/"

  make prefix=/usr install DESTDIR="${pkgdir}"

  cd wxPython
  python2 setup.py WXPORT=gtk3 UNICODE=1 EP_ADD_OPTS=1 EP_FULL_VER=0 NO_SCRIPTS=1 WX_CONFIG="/usr/lib/wx/config/gtk3-unicode-3.0 --prefix=/usr --no_rpath" SYS_WX_CONFIG="/usr/lib/wx/config/gtk3-unicode-3.0 --version=3.0.2.0 --toolkit=gtk3 --static=no --unicode" build_ext --rpath=/usr/lib install --root="${pkgdir}" --prefix=/usr

  # Avoid conflicts
  rm "${pkgdir}/usr/bin" -fr
  rm "${pkgdir}/usr/share" -fr

  install -Dvm644 '../docs/licence.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
