pkgname=mangayomi-linux
pkgver=0.9.8
pkgrel=13
pkgdesc="Mangayomi - Manga, Anime and Novel reader (prebuilt zip with auto-compiled QuickJS FFI fix)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')

depends=('gtk3' 'webkit2gtk-4.1' 'mpv' 'libsoup3' 'libepoxy' 'alsa-lib' 'hicolor-icon-theme' 'cairo' 'pango' 'at-spi2-core' 'fontconfig' 'glib2' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'pkgconf')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-bin' 'mangayomi-git')

source=(
  "https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.zip"
  "flutter_qjs::git+https://github.com/ekibun/flutter_qjs.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir/flutter_qjs"
  git submodule update --init --recursive

  # Genera un CMakeLists.txt mirato e pulito per compilare unicamente la libreria C/FFI
  cat <<'EOF' > linux/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(flutter_qjs_plugin LANGUAGES C CXX)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK REQUIRED gtk+-3.0)

include_directories(
  ../cxx
  ../cxx/quickjs
  ${GTK_INCLUDE_DIRS}
)

add_compile_options(-DCONFIG_VERSION="2021-03-27" -D_GNU_SOURCE -DEXPORT)

set(QUICKJS_SOURCES
  ../cxx/quickjs/quickjs.c
  ../cxx/quickjs/libregexp.c
  ../cxx/quickjs/libunicode.c
  ../cxx/quickjs/cutils.c
  ../cxx/quickjs/quickjs-libc.c
  ../cxx/quickjs/libbf.c
)

set(PLUGIN_SOURCES
  ../cxx/ffi.cpp
  ../cxx/quickjs_wrapper.cpp
)

add_library(flutter_qjs_plugin SHARED
  ${QUICKJS_SOURCES}
  ${PLUGIN_SOURCES}
)

target_link_libraries(flutter_qjs_plugin PRIVATE ${GTK_LIBRARIES} -lm -ldl -lpthread)
EOF
}

build() {
  cd "$srcdir/flutter_qjs/linux"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j$(nproc)
}

package() {
  # 1) Directory dell'applicazione
  install -d "$pkgdir/opt/mangayomi"

  # 2) Copia dell'applicazione dallo zip
  cp -r "$srcdir/mangayomi" "$srcdir/data" "$srcdir/lib" "$pkgdir/opt/mangayomi/"

  # 3) Sostituzione della libreria .so con quella appena compilata
  install -m755 "$srcdir/flutter_qjs/linux/build/libflutter_qjs_plugin.so" \
    "$pkgdir/opt/mangayomi/lib/libflutter_qjs_plugin.so"

  chmod 755 "$pkgdir/opt/mangayomi/mangayomi"
  chmod 755 "$pkgdir/opt/mangayomi/lib/"*.so

  # 4) Wrapper script per LD_LIBRARY_PATH
  install -d "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mangayomi"
#!/bin/sh
export LD_LIBRARY_PATH="/opt/mangayomi/lib:${LD_LIBRARY_PATH}"
cd /opt/mangayomi
exec ./mangayomi "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mangayomi"

  # 5) Icona e Desktop Entry
  install -Dm644 \
    "$srcdir/data/flutter_assets/assets/app_icons/icon.png" \
    "$pkgdir/usr/share/pixmaps/mangayomi.png"

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/mangayomi.desktop" <<EOF
[Desktop Entry]
Name=Mangayomi
Comment=Manga, Anime and Novel reader
Exec=mangayomi
Icon=mangayomi
Type=Application
Categories=Graphics;Viewer;
Terminal=false
EOF
}
