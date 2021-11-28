# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=boxedwine-git
pkgver=21.0.1.r36.ge2021c45
pkgrel=1
pkgdesc="An emulator that runs 16-bit and 32-bit Windows applications"
arch=('x86_64')
url="http://www.boxedwine.org"
license=('GPL2')
depends=('minizip' 'openssl' 'sdl2')
makedepends=('apache' 'apr-util' 'cmake' 'git' 'glu' 'libmysqlclient' 'postgresql'
             'unixodbc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/danoon2/Boxedwine.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'c9686d8694796b110bfa2876684ef1a42e657fd12781c7180e893328c5b7d79c')

pkgver() {
  cd "$srcdir/Boxedwine"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/Boxedwine"
  mkdir -p project/linux/bin
}

build() {
  cd "$srcdir/Boxedwine"

  pushd project/linux

  # buildPocoLib.sh
  cmake -H../../lib/poco -B./linux_build \
    -DENABLE_SEVENZIP=OFF \
    -DENABLE_XML=OFF \
    -DENABLE_JSON=OFF \
    -DENABLE_DATA=OFF \
    -DENABLE_DATA_SQLITE=OFF \
    -DENABLE_DATA_MYSQL=OFF \
    -DENABLE_DATA_ODBC=OFF \
    -DENABLE_MONGODB=OFF \
    -DENABLE_REDIS=OFF \
    -DENABLE_PDF=OFF \
    -DENABLE_ZIP=OFF \
    -DENABLE_APACHECONNECTOR=OFF \
    -DENABLE_CPPPARSER=OFF \
    -DENABLE_ENCODINGS=OFF \
    -DENABLE_PAGECOMPILER=OFF \
    -DENABLE_PAGECOMPILER_FILE2PAGE=OFF \
    -DENABLE_TESTS=OFF \
    -DENABLE_JWT=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build ./linux_build

  # build.sh
  gcc -std=c++17 \
  -Wall \
  -Wno-delete-incomplete \
  -Wno-unused-result \
  -Wno-unknown-pragmas \
  -Wno-unused-local-typedefs \
  -Wno-unused-variable \
  -Wno-unused-function \
  -Wno-unused-but-set-variable \
  -I../../include \
  -I../../lib/poco/Net/include \
  -I../../lib/poco/Crypto/include \
  -I../../lib/poco/Util/include \
  -I../../lib/poco/Foundation/include \
  -I../../lib/poco/NetSSL_OpenSSL/include \
  -I../../lib/glew/include \
  -I../../lib/imgui \
  ../../lib/imgui/imgui.cpp \
  ../../lib/pugixml/src/*.cpp \
  ../../lib/imgui/imgui_draw.cpp \
  ../../lib/imgui/imgui_widgets.cpp \
  ../../lib/imgui/examples/imgui_impl_opengl2.cpp \
  ../../lib/imgui/examples/imgui_impl_sdl.cpp \
  ../../lib/imgui/addon/imguitinyfiledialogs.cpp \
  ../../source/sdl/*.cpp \
  ../../source/sdl/singleThreaded/*.cpp \
  ../../lib/glew/src/glew.cpp \
  ../../source/ui/*.cpp \
  ../../source/ui/controls/*.cpp \
  ../../source/ui/data/*.cpp \
  ../../source/ui/opengl/*.cpp \
  ../../source/ui/utils/*.cpp \
  ../../platform/sdl/*.cpp \
  ../../platform/linux/*.cpp \
  ../../source/emulation/cpu/*.cpp \
  ../../source/emulation/cpu/common/*.cpp \
  ../../source/emulation/cpu/normal/*.cpp \
  ../../source/emulation/softmmu/*.cpp \
  ../../source/io/*.cpp \
  ../../source/kernel/*.cpp \
  ../../source/kernel/devs/*.cpp \
  ../../source/kernel/proc/*.cpp \
  ../../source/kernel/sys/*.cpp \
  ../../source/kernel/loader/*.cpp \
  ../../source/util/*.cpp \
  ../../source/opengl/sdl/*.cpp \
  ../../source/opengl/*.cpp \
  -L./linux_build/lib \
  -lPocoNetSSL \
  -lPocoNet \
  -lPocoCrypto \
  -lPocoUtil \
  -lPocoFoundation \
  -lssl \
  -lcrypto \
  -lpthread \
  -lm \
  -lz \
  -lminizip \
  -lGL \
  -lstdc++ \
  -lstdc++fs \
  -DBOXEDWINE_RECORDER \
  -DBOXEDWINE_ZLIB \
  -DBOXEDWINE_HAS_SETJMP \
  -DSDL2=1 \
  "-DGLH=<SDL_opengl.h>" \
  -DBOXEDWINE_OPENGL_SDL \
  `sdl2-config --cflags --libs` \
  -DSIMDE_SSE2_NO_NATIVE \
  -DPOCO_UTIL_NO_JSONCONFIGURATION \
  -DPOCO_UTIL_NO_XMLCONFIGURATION \
  -DBOXEDWINE_POSIX \
  -DBOXEDWINE_OPENGL_IMGUI_V2 \
  -o "bin/${pkgname%-git}"
  popd
}

package() {
  cd "$srcdir/Boxedwine"
  install -Dm755 "project/linux/bin/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}
