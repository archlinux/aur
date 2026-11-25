# Maintainer: sfslinux <sfslinux@gmail.com>
#
# Split build: hokku-lib contains the shared Cosmoe/Hokku libraries and
# addons; hokku-runtime contains headers, tools and data. easypaint and
# ringbinder contain only the applications. All are built from pinned
# Hokku/EasyPaint/Ringbinder checkouts in one PKGBUILD.

pkgname=('easypaint' 'hokku-runtime' 'hokku-lib' 'ringbinder')
_easypaint_version=0.2.0
_ringbinder_version=1.3.0
pkgver=0.2.0+1.3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/idumych/EasyPaint"
license=('MIT')
makedepends=('git' 'hokku-runtime' 'python')
options=('!debug' '!lto' 'staticlibs')

# Hokku is the Cosmoe fork the upstream AppImages are built with. Pin it so
# the build is reproducible; bump together with the applications when needed.
_hokku_commit=517999b3ab8263c8ed49a492558f8ef0749fa515
_ringbinder_commit=77f02358acbfcc4b162da5c9e655edcb13d44c4c
source=(
  "hokku::git+https://github.com/idumych/hokku.git#commit=$_hokku_commit"
  "EasyPaint::git+https://github.com/idumych/EasyPaint.git#tag=v$_easypaint_version"
  "ringbinder::git+https://github.com/idumych/ringbinder.git#commit=$_ringbinder_commit"
  'easypaint-ui-font.cpp'
  'utf8-keys.patch'
  'EasyPaint.ru.catkeys'
  'ringbinder-localize.py'
  'Ringbinder.ru.catkeys'
  'README.ru.md'
  'README.en.md'
  'Ringbinder.README.ru.md'
  'Ringbinder.README.en.md'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '77d003aafd34715e783d1ed6a2acb97eda7809bbc80df0429fe661d01dd4456b'
  '522b2bd5f9053fa246616cca5de4d3df16171e604d9e6f17454455efbda27954'
  'f2589da74f91b90a2fa0c284c6dfafcefab4a6baf559fea418f6f47d10ab5e53'
  'dd97ffab6e15c7a11f044068970f8f422a856f60a547b679dcdeefbd7bc1244c'
  'bc9187c6693e40a6217c8250272131303d7c8f18c78ec8447afc7f17f2e692c1'
  'acd6eed3f102fc723e8a52e6ee4005875ea98c4d53cc1262f2ba43fb791e0544'
  'f6032cfc75596f0341919f23a6179080fe1e26b495f50ed243633dfe845d7992'
  '872433aa9cdcf44c5fefeafcb2fb6c349aac45048abff42a277602859cac985c'
  'fcf31c09973db1a04920433feba5fafc319df2d44b02728623b0de916685857f'
)

prepare() {
  if ! git -C "$srcdir/hokku" apply --reverse --check \
      "$srcdir/utf8-keys.patch" 2>/dev/null; then
    patch -p1 -d "$srcdir/hokku" -i "$srcdir/utf8-keys.patch"
  fi
  python3 "$srcdir/ringbinder-localize.py" patch "$srcdir/ringbinder"
}

# Small packages: xz -9e instead of the default zstd.
PKGEXT='.pkg.tar.xz'
COMPRESSXZ=(xz -c -z -9e -)

build() {
  cd "$srcdir/hokku"
  meson setup build \
    --prefix=/usr --libdir=lib --buildtype=release \
    -Denable_apps=false -Denable_unit_test_compile=false \
    -Dlabwc_hokku=disabled
  ninja -C build
  DESTDIR="$srcdir/cosmoe" meson install -C build --no-rebuild

  cd "$srcdir/EasyPaint"
  # Accelerant.h lives in os/add-ons/graphics, which the app's COSMOE_DIRS
  # list does not cover. The runtime libraries live in /usr/lib/hokku/lib.
  # Clean first: the upstream Makefile only relinks when sources are newer.
  make COSMOE_ROOT="$srcdir/cosmoe/usr" clean >/dev/null
  make COSMOE_ROOT="$srcdir/cosmoe/usr" \
    COSMOE_RPATH=/usr/lib/hokku/lib \
    CXXFLAGS="$CXXFLAGS -I$srcdir/cosmoe/usr/include/os/add-ons/graphics" \
    LDFLAGS="$LDFLAGS" -j"$(nproc)"
  # Portable pixel-code unit tests (no Haiku headers needed).
  make COSMOE_ROOT="$srcdir/cosmoe/usr" test

  local _include=(-I"$srcdir/cosmoe/usr/include")
  local _d
  for _d in config os os/app os/game os/interface os/kernel os/locale \
            os/media os/net os/storage os/support os/translation \
            os/be_apps/Tracker private/interface private/shared \
            private/support posix; do
    _include+=(-I"$srcdir/cosmoe/usr/include/$_d")
  done
  ${CXX:-g++} $CXXFLAGS $LDFLAGS -std=c++17 "${_include[@]}" \
    $(pkg-config --cflags gio-2.0 pango) \
    "$srcdir/easypaint-ui-font.cpp" \
    -Wl,--as-needed -Wl,-z,relro -Wl,-z,now \
    -L"$srcdir/cosmoe/usr/lib" -lbe \
    $(pkg-config --libs gio-2.0 pango) \
    -Wl,-rpath,'$ORIGIN/../lib' -o "$srcdir/hokku-ui-font"

  cd "$srcdir/ringbinder"
  make COSMOE_ROOT="$srcdir/cosmoe/usr" clean >/dev/null
  make COSMOE_ROOT="$srcdir/cosmoe/usr" \
    COSMOE_RPATH=/usr/lib/hokku/lib \
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS" -j"$(nproc)"
  make COSMOE_ROOT="$srcdir/cosmoe/usr" test
}

package_hokku-lib() {
  pkgdesc="Shared Cosmoe/Hokku libraries and addons"
  url="https://github.com/idumych/hokku"
  depends=(
    'brotli' 'bzip2' 'cairo' 'expat' 'fontconfig' 'freetype2' 'fribidi'
    'gcc-libs' 'glib2' 'glibc' 'graphite'
    'harfbuzz' 'icu' 'jbigkit' 'libdatrie' 'libdeflate' 'libffi' 'libjpeg-turbo'
    'libpng' 'libthai' 'libtiff' 'libwebp' 'libx11' 'libxau' 'libxcb'
    'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxkbcommon'
    'libxkbcommon-x11' 'libxrandr' 'libxrender' 'pango'
    'pcre2' 'pixman' 'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd'
  )

  local dest="$pkgdir/usr/lib/hokku"
  install -d "$dest/lib"

  install -m755 "$srcdir/cosmoe/usr/lib"/{libbe.so,libtracker.so,libcosmoe-x11.so,libcosmoe-wayland.so} \
    "$dest/lib/"
  install -m644 "$srcdir/cosmoe/usr/lib/liblocalestub.a" "$dest/lib/"
  cp -a "$srcdir/cosmoe/usr/lib/addons" "$dest/lib/"

  install -Dm644 "$srcdir/hokku/License.md" \
    "$pkgdir/usr/share/licenses/hokku-lib/COSMOE-LICENSE.md"
}

package_hokku-runtime() {
  pkgdesc="Shared Cosmoe/Hokku headers, tools, artwork and catalogs"
  url="https://github.com/idumych/hokku"
  depends=(
    'bash' 'brotli' 'bzip2' 'cairo' 'expat' 'fontconfig' 'freetype2' 'fribidi'
    'gcc-libs' 'glib2' 'glibc' 'graphite' 'gsettings-desktop-schemas'
    'harfbuzz' 'hicolor-icon-theme' 'hokku-lib'
    'icu' 'jbigkit' 'libdatrie' 'libdeflate' 'libffi' 'libjpeg-turbo'
    'libpng' 'libthai' 'libtiff' 'libwebp' 'libx11' 'libxau' 'libxcb'
    'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxkbcommon'
    'libxkbcommon-x11' 'libxrandr' 'libxrender' 'pango'
    'pcre2' 'pixman' 'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd'
  )
  optdepends=('noto-fonts: default UI and fallback font')

  local dest="$pkgdir/usr/lib/hokku"
  install -d "$dest"/{bin,include,share/cosmoe}

  cp -a "$srcdir/cosmoe/usr/include/." "$dest/include/"
  cp -a "$srcdir/cosmoe/usr/bin/." "$dest/bin/"

  cp -a "$srcdir/cosmoe/usr/share/cosmoe/artwork" "$dest/share/cosmoe/"
  cp -a "$srcdir/cosmoe/usr/share/cosmoe/mime_db" "$dest/share/cosmoe/"
  cp -a "$srcdir/cosmoe/usr/share/cosmoe/locale" "$dest/share/cosmoe/"
  install -m644 "$srcdir/cosmoe/usr/share/cosmoe/"*.png "$dest/share/cosmoe/"

  install -m755 "$srcdir/hokku-ui-font" "$dest/bin/hokku-ui-font"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/hokku-ui-font" <<'EOF'
#!/bin/sh
HERE=/usr/lib/hokku
export LD_LIBRARY_PATH="$HERE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$HERE/bin/hokku-ui-font" "$@"
EOF

  install -Dm644 "$srcdir/README.en.md" \
    "$pkgdir/usr/share/doc/hokku-runtime/README.en.md"
  install -Dm644 "$srcdir/README.ru.md" \
    "$pkgdir/usr/share/doc/hokku-runtime/README.ru.md"
  install -Dm644 "$srcdir/hokku/License.md" \
    "$pkgdir/usr/share/licenses/hokku-runtime/COSMOE-LICENSE.md"
}

package_easypaint() {
  pkgdesc="A simple bitmap graphics editor (Cosmoe/Hokku-based, built from source)"
  url="https://github.com/idumych/EasyPaint"
  depends=('bash' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'hokku-lib')
  optdepends=('hokku-runtime: Hokku catalogs, artwork and hokku-ui-font')
  provides=('easypaint')

  local dest="$pkgdir/usr/lib/easypaint"
  install -d "$dest/bin"

  install -m755 "$srcdir/EasyPaint/EasyPaint" "$dest/bin/EasyPaint"

  local _catalog="$srcdir/EasyPaint.ru.catalog"
  LD_LIBRARY_PATH="$srcdir/cosmoe/usr/lib" \
    "$srcdir/cosmoe/usr/bin/linkcatkeys" -s x-vnd.EasyPaint -l ru \
    -o "$_catalog" "$srcdir/EasyPaint.ru.catkeys"
  install -d "$pkgdir/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.EasyPaint"
  install -m644 "$_catalog" \
    "$pkgdir/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.EasyPaint/ru.catalog"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/easypaint-ui-font" <<'EOF'
#!/bin/sh
exec /usr/bin/hokku-ui-font "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/easypaint" <<'EOF'
#!/bin/sh
HERE=/usr/lib/easypaint
RUNTIME=/usr/lib/hokku
export LD_LIBRARY_PATH="$RUNTIME/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export TRANSLATORS="$RUNTIME/lib/addons/Translators"
if command -v hokku-ui-font >/dev/null 2>&1; then
  hokku-ui-font --auto >/dev/null 2>&1 || true
fi
exec "$HERE/bin/EasyPaint" "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/easypaint.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=EasyPaint
GenericName=Bitmap graphics editor
GenericName[ru]=Растровый графический редактор
GenericName[uk]=Растровий графічний редактор
GenericName[de]=Bitmap-Grafikeditor
GenericName[es]=Editor de gráficos de mapa de bits
GenericName[fr]=Éditeur d'images matricielles
GenericName[it]=Editor di grafica raster
GenericName[pl]=Edytor grafiki rastrowej
GenericName[pt_BR]=Editor de imagens bitmap
GenericName[zh_CN]=位图图形编辑器
GenericName[ja]=ビットマップグラフィックエディター
Comment=A simple bitmap graphics editor
Comment[ru]=Простой растровый графический редактор
Comment[uk]=Простий растровий графічний редактор
Comment[de]=Ein einfacher Bitmap-Grafikeditor
Comment[es]=Un editor sencillo de gráficos de mapa de bits
Comment[fr]=Un éditeur simple d'images matricielles
Comment[it]=Un semplice editor di grafica raster
Comment[pl]=Prosty edytor grafiki rastrowej
Comment[pt_BR]=Um editor simples de imagens bitmap
Comment[zh_CN]=一个简单的位图图形编辑器
Comment[ja]=シンプルなビットマップグラフィックエディター
Exec=easypaint %F
Icon=easypaint
Terminal=false
Categories=Graphics;2DGraphics;RasterGraphics;
StartupWMClass=EasyPaint
EOF

  install -Dm644 "$srcdir/EasyPaint/packaging/appimage/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/easypaint.png"

  install -Dm644 "$srcdir/README.en.md" \
    "$pkgdir/usr/share/doc/easypaint/README.en.md"
  install -Dm644 "$srcdir/README.ru.md" \
    "$pkgdir/usr/share/doc/easypaint/README.ru.md"

  install -Dm644 "$srcdir/EasyPaint/LICENSE" \
    "$pkgdir/usr/share/licenses/easypaint/LICENSE"
}

package_ringbinder() {
  pkgdesc="A tabbed personal organizer (Cosmoe/Hokku-based, built from source)"
  url="https://github.com/idumych/ringbinder"
  depends=('bash' 'curl' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'hokku-lib')
  optdepends=(
    'ca-certificates: HTTPS certificate verification for Google sync'
    'hokku-runtime: Hokku catalogs, artwork and build tools'
  )
  provides=('ringbinder')

  local croot="$srcdir/cosmoe/usr"
  local dest="$pkgdir/usr/lib/ringbinder"
  install -d "$dest/bin"

  install -m755 "$srcdir/ringbinder/Ringbinder" "$dest/bin/Ringbinder"

  local catalog="$srcdir/Ringbinder.ru.catalog"
  LD_LIBRARY_PATH="$croot/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
    "$croot/bin/linkcatkeys" -s x-vnd.Ringbinder -l ru \
    -o "$catalog" "$srcdir/Ringbinder.ru.catkeys"
  install -d "$pkgdir/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.Ringbinder"
  install -m644 "$catalog" \
    "$pkgdir/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.Ringbinder/ru.catalog"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/ringbinder" <<'EOF'
#!/bin/sh
HERE=/usr/lib/ringbinder
RUNTIME=/usr/lib/hokku
export LD_LIBRARY_PATH="$RUNTIME/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export TRANSLATORS="$RUNTIME/lib/addons/Translators"
exec "$HERE/bin/Ringbinder" "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ringbinder.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Ringbinder
GenericName=Personal organizer
GenericName[ru]=Личный органайзер
GenericName[uk]=Особистий органайзер
GenericName[de]=Persönlicher Organizer
GenericName[es]=Organizador personal
GenericName[fr]=Organiseur personnel
GenericName[it]=Organizzatore personale
GenericName[pl]=Osobisty organizer
GenericName[pt_BR]=Organizador pessoal
GenericName[zh_CN]=个人记事本
GenericName[ja]=個人用オーガナイザー
Comment=A tabbed personal organizer: diary, tasks, contacts, calls, year planner, notes and anniversaries
Comment[ru]=Личный органайзер с вкладками: дневник, задачи, контакты, звонки, годовой план, заметки и юбилеи
Comment[uk]=Особистий органайзер із вкладками: щоденник, завдання, контакти, дзвінки, річний план, нотатки та ювілеї
Comment[de]=Persönlicher Organizer mit Registerkarten: Tagebuch, Aufgaben, Kontakte, Anrufe, Jahresplan, Notizen und Jubiläen
Comment[es]=Organizador personal con pestañas: diario, tareas, contactos, llamadas, plan anual, notas y aniversarios
Comment[fr]=Organiseur personnel à onglets : journal, tâches, contacts, appels, planning annuel, notes et anniversaires
Comment[it]=Organizzatore personale a schede: diario, attività, contatti, chiamate, piano annuale, note e anniversari
Comment[pl]=Osobisty organizer z zakładkami: dziennik, zadania, kontakty, połączenia, plan roczny, notatki i rocznice
Comment[pt_BR]=Organizador pessoal com abas: diário, tarefas, contatos, chamadas, planejamento anual, notas e aniversários
Comment[zh_CN]=带标签页的个人记事本：日记、任务、联系人、通话、年度计划、笔记和纪念日
Comment[ja]=タブ付き個人用オーガナイザー：日記、タスク、連絡先、通話、年間計画、メモ、記念日
Exec=ringbinder
Icon=ringbinder
Terminal=false
Categories=Office;Calendar;ContactManagement;
Keywords=organizer;diary;calendar;planner;todo;contacts;notes;
StartupWMClass=Ringbinder
EOF

  install -Dm644 "$srcdir/ringbinder/packaging/appimage/ringbinder.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/ringbinder.png"

  install -Dm644 "$srcdir/Ringbinder.README.en.md" \
    "$pkgdir/usr/share/doc/ringbinder/README.en.md"
  install -Dm644 "$srcdir/Ringbinder.README.ru.md" \
    "$pkgdir/usr/share/doc/ringbinder/README.ru.md"
  install -Dm644 "$srcdir/ringbinder/LICENSE" \
    "$pkgdir/usr/share/licenses/ringbinder/LICENSE"
}
