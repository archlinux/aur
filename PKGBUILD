pkgname=mangayomi-linux
pkgver=0.9.8
pkgrel=18
pkgdesc="Mangayomi - Manga, Anime and Novel reader (prebuilt zip with auto-compiled QuickJS FFI fix)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')

depends=('gtk3' 'webkit2gtk-4.1' 'mpv' 'libsoup3' 'libepoxy' 'alsa-lib' 'hicolor-icon-theme' 'cairo' 'pango' 'at-spi2-core' 'fontconfig' 'glib2' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja' 'gcc')
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

  # 1. INIEZIONE DUMMY REGISTRAR:
  # Inganniamo il motore Flutter fornendo la funzione di registrazione vuota che si aspetta,
  # evitando così di dover scaricare il Flutter SDK solo per compilare del boilerplate.
  echo 'extern "C" __attribute__((visibility("default"))) void flutter_qjs_plugin_register_with_registrar(void* registrar) {}' >> cxx/ffi.cpp

  # 2. CMAKE SNELLO:
  # Rimuoviamo PkgConfig e GTK. Compiliamo unicamente QuickJS e l'esportazione FFI.
  cat <<'EOF' > linux/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(flutter_qjs_plugin LANGUAGES C CXX)

include_directories(
  ../cxx
  ../cxx/quickjs
)

# Flag di compatibilità applicati solo al codice C
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-int-conversion -Wno-discarded-qualifiers")
add_compile_options(-DCONFIG_VERSION="2021-03-27" -D_GNU_SOURCE -DEXPORT -fvisibility=default)

set(QUICKJS_SOURCES
  ../cxx/quickjs/quickjs.c
  ../cxx/quickjs/libregexp.c
  ../cxx/quickjs/libunicode.c
  ../cxx/quickjs/cutils.c
  ../cxx/quickjs/libbf.c
)

set(FFI_SOURCES
  ../cxx/ffi.cpp
)

add_library(flutter_qjs_plugin SHARED
  ${QUICKJS_SOURCES}
  ${FFI_SOURCES}
)

target_link_libraries(flutter_qjs_plugin PRIVATE -lm -ldl -lpthread)
EOF
}

build() {
  cd "$srcdir/flutter_qjs/linux"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j$(nproc)
}

package() {
  install -d "$pkgdir/opt/mangayomi"
  cp -r "$srcdir/mangayomi" "$srcdir/data" "$srcdir/lib" "$pkgdir/opt/mangayomi/"

  # Sovrascriviamo la libreria rotta dello zip con quella nativa, completa di simboli FFI e Registrar stub
  install -m755 "$srcdir/flutter_qjs/linux/build/libflutter_qjs_plugin.so" \
    "$pkgdir/opt/mangayomi/lib/libflutter_qjs_plugin.so"

  chmod 755 "$pkgdir/opt/mangayomi/mangayomi"
  chmod 755 "$pkgdir/opt/mangayomi/lib/"*.so

  install -d "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mangayomi"
#!/bin/sh
export LD_LIBRARY_PATH="/opt/mangayomi/lib:${LD_LIBRARY_PATH}"
cd /opt/mangayomi
exec ./mangayomi "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mangayomi"

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
