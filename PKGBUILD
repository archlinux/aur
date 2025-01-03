# Maintainer: envolution
# Contributor: Jan Cholasta <grubber at grubber cz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=slade-git
pkgver=3.2.7+r3091+gbf00e9f8f
pkgrel=3
pkgdesc='SLADE3 Doom editor (git version)'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
  'fluidsynth'
  'freeimage'
  'ftgl'
  'glu'
  'libgl'
  'lua'
  'mpg123'
  'sfml'
  'webkit2gtk-4.1'
  'wxwidgets-gtk3'
  'zlib')
makedepends=('cmake'
  'git'
  'p7zip')
provides=('slade')
conflicts=('slade')
source=('slade::git+https://github.com/sirjuddington/SLADE.git')
sha256sums=('SKIP'
            'b4f2e8ebac43c0fc351a3c94b6fad6862d8cc9cdb55f7a224747d1066a2e09f5')

#wxwidgets -------------------
makedepends+=(cmake
  git
  glu
  gst-plugins-base
  nanosvg
  qt5-base
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
source+=(git+https://github.com/wxWidgets/wxWidgets#tag=v3.2.6)
#</wxwidgets>

pkgver() {
  cd "${srcdir}/slade"
  _version=$(git tag --sort=-v:refname --list | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  #wxwidgets
  cd $srcdir
  cmake -B build-gtk3 -S wxWidgets \
    -DCMAKE_INSTALL_PREFIX=/usr/share/slade3 \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON \
    -DwxUSE_GLCANVAS_EGL=OFF #the primary reason for this package
  cmake --build build-gtk3
  # Run configure to generate the Makefile, cmake doesn't install translations
  cd wxWidgets
  ./configure --prefix=/usr --disable-tests
  make -C locale allmo
  cd $srcdir
  #</wxwidgets>

  #slade
  cd slade
  export CCACHE_SLOPPINESS=pch_defines,time_macros
  cmake -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_RPATH=/usr/share/slade3/lib \
    .
  make
  #</slade>
}

package() {
  cd slade
  make install DESTDIR="$pkgdir"

  #wxwidgets
  cd $srcdir
  DESTDIR="$pkgdir" cmake --install build-gtk3
  rm -r "$pkgdir"/usr/share/slade3/{include,lib/libwx_base*,bin/wxrc*}

  mv "$pkgdir"/usr/bin/slade "$pkgdir"/usr/bin/slade3
  cat >"$pkgdir"/usr/bin/slade <<'EOF'
#!/bin/sh
GDK_BACKEND=x11 exec /usr/bin/slade3 "$@"
EOF
  chmod 755 "$pkgdir"/usr/bin/slade
}

# vim: ts=2 sw=2 et:
