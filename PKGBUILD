# Maintainer: envolution
# Contributor: Jan Cholasta <grubber at grubber cz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=slade
pkgver=3.2.7
pkgrel=11
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL-2.0-only' 'LicenseRef-wxWindows')
#slade -------------
depends=(
  'bzip2'
  'fluidsynth'
  'libwebp'
  'ftgl'
  'glu'
  'gtk3'
  'libgl'
  'lua'
  'mpg123'
  'sfml'
  'webkit2gtk-4.1'
  'wxwidgets-gtk3'
  'zlib'
  'sdl2-compat'
  'pcre2'
  'curl'
  'expat'
  'libsecret'
  'gspell'
  'xz')
makedepends=(
  'git'
  'cmake'
  'p7zip')

# pull in commits up to Aug 18 2025 (specific to pkgver 3.2.7)
if [[ $pkgver == 3.2.7 ]]; then
    _specify_git="#commit=62467e4ea9f41ac04e28bfed266731da22ff874c"
else
    _specify_git="#tag=${pkgver}"
fi

source=("git+https://github.com/sirjuddington/SLADE.git${_specify_git}")
sha256sums=('c51da7928e58a2aad849fb75ce914f4a0d6623d09dc0e35098e9f5ba3a1c6e66'
            '11bfcbbbb10515d9fd31f52477166bc37725e704dc7f3baf6cad30b92e1defe8')

#wxwidgets -------------------
makedepends+=(
  cmake
  git
  glu
  gst-plugins-base
  nanosvg
  qt5-base
  libmspack
  libnotify
  sdl2
  webkit2gtk-4.1)
depends+=(bash
  cairo
  fontconfig
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-bad-libs
  gstreamer
  gtk3
  libglvnd
  libjpeg-turbo
  libnotify
  libmspack
  libpng
  libsm # cmake target
  libtiff
  libx11
  libxkbcommon
  libxtst
  pango
  sdl2
  wayland
  wxwidgets-common)
source+=(git+https://github.com/wxWidgets/wxWidgets#tag=v3.2.8.1)
#</wxwidgets>

#sfml2 - https://github.com/sirjuddington/SLADE/pull/1761
depends+=(sfml2)
#</sfml2>

build() {
  # Build wxwidgets-gtk
  cd "$srcdir"
  cmake -B build-wxwidgets -S wxWidgets \
    -DCMAKE_INSTALL_PREFIX=/usr/share/slade3 \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON -DwxUSE_GLCANVAS_EGL=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.30
  cmake --build build-wxwidgets

  # Generate translation files (Makefile needed for this step)
  cd wxWidgets
  ./configure --prefix=/usr --disable-tests
  make -C locale allmo
  cd "$srcdir"

  # Build slade
  export WX_CONFIG="$srcdir/build-wxwidgets/wx-config"
  export PKG_CONFIG_PATH="$srcdir/build-wxwidgets/lib/pkgconfig:$PKG_CONFIG_PATH"
  export LD_LIBRARY_PATH="$srcdir/build-wxwidgets/lib:/opt/sfml2/lib:$LD_LIBRARY_PATH"

  cd SLADE
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_RPATH="/usr/share/slade3/lib:/opt/sfml2/lib" \
    -DwxWidgets_CONFIG_EXECUTABLE="$WX_CONFIG"
  cmake --build build
}

package() {
  # Install slade
  cd "$srcdir/SLADE/build"
  make install DESTDIR="$pkgdir"

  # Install wxwidgets to /usr/share/slade3
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build-wxwidgets
  install -Dm644 wxWidgets/docs/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/wxwidgets-LICENSE
  rm -rf "$pkgdir/usr/share/slade3/include"
  rm -rf "$pkgdir/usr/share/slade3/lib/cmake"
  rm -rf "$pkgdir/usr/share/slade3/lib/wx/config"
  rm -rf "$pkgdir/usr/share/slade3/lib/pkgconfig"

  # Rename slade executable and create wrapper script
  mv "$pkgdir/usr/bin/slade" "$pkgdir/usr/bin/slade3.bin"
  cat >"$pkgdir/usr/bin/slade" <<'EOF'
#!/bin/sh
GDK_BACKEND=x11 exec /usr/bin/slade3.bin "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/slade"
}
# vim:set ts=2 sw=2 et:
