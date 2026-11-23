# Maintainer: sfslinux <sfslinux@gmail.com>
#
# EasyPaint built from source against Hokku (the Cosmoe fork that provides the
# Haiku/BeOS API on Linux). Unlike the AppImage, nothing is vendored: ICU,
# pango, cairo, the image codecs, X11/Wayland and the rest are taken from the
# system packages, so the payload is just EasyPaint plus the Cosmoe runtime it
# actually needs.
pkgname=easypaint
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple bitmap graphics editor (Cosmoe/Hokku-based, built from source)"
arch=('x86_64')
url="https://github.com/idumych/EasyPaint"
license=('MIT')
depends=(
  'brotli' 'bzip2' 'cairo' 'expat' 'fontconfig' 'freetype2' 'fribidi'
  'gcc-libs' 'glib2' 'glibc' 'graphite' 'gsettings-desktop-schemas'
  'harfbuzz' 'hicolor-icon-theme'
  'icu' 'jbigkit' 'libdatrie' 'libdeflate' 'libffi' 'libjpeg-turbo'
  'libpng' 'libthai' 'libtiff' 'libwebp' 'libx11' 'libxau' 'libxcb'
  'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxkbcommon-x11' 'libxrandr' 'libxrender' 'pango'
  'pcre2' 'pixman' 'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd'
)
optdepends=('noto-fonts: default UI and fallback font')
makedepends=('git' 'meson' 'ninja' 'pkgconf')
provides=('easypaint')
options=('!debug' '!lto')

# Hokku is the Cosmoe fork the upstream AppImage is built with. Pin it so the
# build is reproducible; bump together with EasyPaint when needed.
_hokku_commit=517999b3ab8263c8ed49a492558f8ef0749fa515
source=(
  "hokku::git+https://github.com/idumych/hokku.git#commit=$_hokku_commit"
  "EasyPaint::git+https://github.com/idumych/EasyPaint.git#tag=v$pkgver"
  'easypaint-ui-font.cpp'
  'utf8-keys.patch'
  'EasyPaint.ru.catkeys'
  'README.ru.md'
  'README.en.md'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '77d003aafd34715e783d1ed6a2acb97eda7809bbc80df0429fe661d01dd4456b'
  '522b2bd5f9053fa246616cca5de4d3df16171e604d9e6f17454455efbda27954'
  'f2589da74f91b90a2fa0c284c6dfafcefab4a6baf559fea418f6f47d10ab5e53'
  '66341583934b813de59ef3593e9509734aa390e81cb1fc8afe74aeb1465203f0'
  'cd457bae34776579fdb8f4d0e6166995ba6945f509cd23f7df5db69880585d16'
)

prepare() {
  if ! git -C "$srcdir/hokku" apply --reverse --check \
      "$srcdir/utf8-keys.patch" 2>/dev/null; then
    patch -p1 -d "$srcdir/hokku" -i "$srcdir/utf8-keys.patch"
  fi
}

# Small package: xz -9e instead of the default zstd.
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
  # list does not cover.
  make COSMOE_ROOT="$srcdir/cosmoe/usr" \
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
    -Wl,-rpath,'$ORIGIN/../lib' -o "$srcdir/easypaint-ui-font"
}

package() {
  local dest="$pkgdir/usr/lib/$pkgname"

  install -d "$dest"/{bin,lib/addons/Translators,lib/addons/control_look,share/cosmoe}

  install -m755 "$srcdir/EasyPaint/EasyPaint" "$dest/bin/EasyPaint"
  install -m755 "$srcdir/easypaint-ui-font" "$dest/bin/easypaint-ui-font"

  # Cosmoe/Hokku shared libraries used by the app and its add-ons. Everything
  # else is linked from the system packages in depends/.
  install -m755 "$srcdir/cosmoe/usr/lib"/{libbe.so,libtracker.so,libcosmoe-x11.so,libcosmoe-wayland.so} "$dest/lib/"

  # Only the image translators EasyPaint uses.
  local t
  for t in BMP GIF ICO JPEG PNG PPM TGA TIFF WebP; do
    install -m755 "$srcdir/cosmoe/usr/lib/addons/Translators/${t}Translator.so" \
      "$dest/lib/addons/Translators/"
  done
  install -m755 "$srcdir/cosmoe/usr/lib/addons/control_look/"{BeControlLook.so,FlatControlLook.so,HaikuDarkModeControlLook.so} \
    "$dest/lib/addons/control_look/"

  cp -a "$srcdir/cosmoe/usr/share/cosmoe/artwork" "$dest/share/cosmoe/"
  cp -a "$srcdir/cosmoe/usr/share/cosmoe/mime_db" "$dest/share/cosmoe/"
  install -m644 "$srcdir/cosmoe/usr/share/cosmoe/"*.png "$dest/share/cosmoe/"

  for c in libbe libtextencoding libtracker \
           BMPTranslator GIFTranslator JPEGTranslator PNGTranslator \
           PPMTranslator TGATranslator TIFFTranslator WebPTranslator; do
    install -d "$dest/share/cosmoe/locale/catalogs/x-vnd.Haiku-$c"
    install -m644 \
      "$srcdir/cosmoe/usr/share/cosmoe/locale/catalogs/x-vnd.Haiku-$c/ru.catalog" \
      "$dest/share/cosmoe/locale/catalogs/x-vnd.Haiku-$c/ru.catalog"
  done

  install -d "$dest/share/cosmoe/locale/catalogs/x-vnd.EasyPaint"
  local _catalog="$srcdir/EasyPaint.ru.catalog"
  LD_LIBRARY_PATH="$srcdir/cosmoe/usr/lib" \
    "$srcdir/cosmoe/usr/bin/linkcatkeys" -s x-vnd.EasyPaint -l ru \
    -o "$_catalog" "$srcdir/EasyPaint.ru.catkeys"
  install -m644 "$_catalog" \
    "$dest/share/cosmoe/locale/catalogs/x-vnd.EasyPaint/ru.catalog"

  # Launcher: point the loader and the translation kit at the private Cosmoe
  # runtime in /usr/lib/easypaint.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname-ui-font" <<'EOF'
#!/bin/sh
HERE=/usr/lib/easypaint
export LD_LIBRARY_PATH="$HERE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$HERE/bin/easypaint-ui-font" "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
HERE=/usr/lib/easypaint
export LD_LIBRARY_PATH="$HERE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export TRANSLATORS="$HERE/lib/addons/Translators"
"$HERE/bin/easypaint-ui-font" --auto >/dev/null 2>&1 || true
exec "$HERE/bin/EasyPaint" "$@"
EOF


  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
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
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 "$srcdir/README.en.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.en.md"
  install -Dm644 "$srcdir/README.ru.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.ru.md"

  install -Dm644 "$srcdir/EasyPaint/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/hokku/License.md" \
    "$pkgdir/usr/share/licenses/$pkgname/COSMOE-LICENSE.md"
}
