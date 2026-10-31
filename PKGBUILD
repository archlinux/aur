# Maintainer: Kelly Guo <guo40020@gmail.com>

pkgname=atk-logic
pkgver=1.0.6.6
pkgrel=1
pkgdesc="ALIENTEK logic analyzer software (ATK-Logic)"
arch=('x86_64')
url="https://github.com/alientek-openedv/atk-logic"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'libusb'
  'libx11'
  'python'
  'qt5-base'
  'qt5-declarative'
  'qt5-graphicaleffects'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'qt5-x11extras'
)
makedepends=('autoconf' 'automake' 'git' 'libtool' 'pkgconf' 'qt5-tools')
_commit=0dff562d24436def2bec3791684f1911997b9e35
_decoder_commit=783fec96047f5859c2122ac79123a6929a35f75f
source=(
  "atk-logic::git+https://github.com/alientek-openedv/atk-logic.git#commit=$_commit"
  "atk_libsigrokdecode::git+https://github.com/alientek-openedv/atk_libsigrokdecode.git#commit=$_decoder_commit"
  'atk-decoder-system-python.patch'
  'QBreakpadHandler.h'
  'atk-logic.sh'
  'atk-logic.desktop'
  '60-atk-logic.rules'
)
sha256sums=('ccb243057539d77c286204f80665e23c9888bd8c363e1da2f4df388e4fe905d9'
            '2aef4fc1a30ef0de093095d6977b02cf47b571db51de5d4142cf99d321d30fc2'
            'd0e57dc382865bdc73662cc7faae666f2b8a9ffe50e201648022ce6aedacee0f'
            '4cfdaf954b45227f0468b8008116fd27e2e32f5749fd50c7ce4768a218db0436'
            'e31bfb946cbb159496fd5ac2971a29f1940657f09b827a813c9ec77536b285f2'
            '80ae6d3187e096118bbe15789647a11342fcc46a6d52b9ff29ead950e0fa455f'
            '2778b3e5a2489b385850fbfe13aa2b9bae4947002ee07b141dbd9364cabbeb31')

prepare() {
  cd atk_libsigrokdecode
  # Upstream points PYTHONHOME at the app directory (a bundled Python on Windows);
  # on Linux that breaks the system interpreter.
  patch -Np1 -i ../atk-decoder-system-python.patch
  sh ./autogen.sh
}

build() {
  cd "$srcdir/atk_libsigrokdecode"
  ./configure --enable-static --with-pic
  make

  # atk_decoder.c (the API ATK-Logic uses) is not part of upstream's autotools build
  ${CC:-gcc} $CFLAGS -fPIC -std=gnu99 -I. \
    $(pkg-config --cflags glib-2.0 python3-embed) \
    -c atk_decoder.c -o atk_decoder.o
  ar rcs libatk_decoder.a atk_decoder.o

  mkdir -p "$srcdir/include"
  cp atk_decoder.h "$srcdir/QBreakpadHandler.h" "$srcdir/include/"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  qmake-qt5 "$srcdir/atk-logic/ATK-Logic.pro" \
    CONFIG-=debug_and_release CONFIG+=release CONFIG+=link_pkgconfig \
    QT+=x11extras \
    PKGCONFIG+="libusb-1.0 glib-2.0 python3-embed x11" \
    INCLUDEPATH+="$srcdir/include" \
    SOURCES+="$srcdir/atk-logic/pv/utils/qtlockedfile/qtlockedfile_unix.cpp" \
    LIBS+="$srcdir/atk_libsigrokdecode/libatk_decoder.a $srcdir/atk_libsigrokdecode/.libs/libsigrokdecode.a -lm" \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  local _app="$pkgdir/opt/atk-logic"

  install -Dm755 build/ATK-Logic "$_app/ATK-Logic"

  # The app looks for decoders, sample captures and manuals next to its binary
  cp -r atk-logic/runtime/decoders atk-logic/runtime/test "$_app/"
  install -Dm644 -t "$_app" atk-logic/runtime/ATK-Logic_*.pdf
  find "$_app/decoders" -name __pycache__ -type d -prune -exec rm -rf {} +
  python -m compileall -q -d /opt/atk-logic/decoders "$_app/decoders"

  install -Dm755 atk_libsigrokdecode/.libs/libirmp.so.0.0.0 "$_app/lib/libirmp.so.0.0.0"
  ln -s libirmp.so.0.0.0 "$_app/lib/libirmp.so.0"
  ln -s libirmp.so.0.0.0 "$_app/lib/libirmp.so"

  install -Dm755 atk-logic.sh "$pkgdir/usr/bin/atk-logic"
  install -Dm644 atk-logic.desktop "$pkgdir/usr/share/applications/atk-logic.desktop"
  install -Dm644 atk-logic/resource/icon/icon.png "$pkgdir/usr/share/pixmaps/atk-logic.png"
  install -Dm644 60-atk-logic.rules "$pkgdir/usr/lib/udev/rules.d/60-atk-logic.rules"
}
