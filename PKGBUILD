# Maintainer: yhshzh0 <yhshzh0@gmail.com>

pkgname=tang-dynasty-wayland
pkgver=5.15.17
pkgrel=1
pkgdesc='Native Wayland compatibility runtime and launcher for Tang Dynasty'
arch=('x86_64')
url='https://www.anlogic.com/'
license=('LGPL-3.0-only')
depends=(
  'tang-dynasty-bin=2026.1.SP3' 'bash' 'glibc' 'glib2' 'libgcc' 'libstdc++'
  'wayland' 'libxkbcommon' 'libglvnd' 'libx11' 'libxcomposite'
  'dbus' 'fontconfig' 'freetype2'
)
makedepends=(
  'perl' 'python' 'pkgconf' 'wayland-protocols' 'libxcb' 'libxrender'
  'libxi' 'libxkbcommon-x11' 'xcb-util' 'xcb-util-image'
  'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'libdrm' 'mesa'
)
optdepends=('fcitx5-qt: Fcitx5 input method integration')
options=('!lto' '!debug' '!strip')

_prefix='/opt/tang-dynasty-wayland'
source=(
  "https://download.qt.io/archive/qt/5.15/$pkgver/submodules/qtbase-everywhere-opensource-src-$pkgver.tar.xz"
  "https://download.qt.io/archive/qt/5.15/$pkgver/submodules/qtwayland-everywhere-opensource-src-$pkgver.tar.xz"
  'tang-dynasty-wayland.sh'
  'tang-dynasty-wayland.desktop'
)
sha256sums=(
  'db1513cbb3f4a5bd2229f759c0839436f7fe681a800ff2bc34c4960b09e756ff'
  '55512f387399271c00d564db50f24e5dd028a3e7526e0ebf456735d72c40e3df'
  '27c63301589b59db01d1715a6855ba8fd7e519897ca66392304efdd4b602018e'
  '1e11794a6f71544de6ea87a54baad73e74ac57cf64214d22168278a8ecd7b28d'
)

build() {
  mkdir -p "$srcdir/build-qtbase" "$srcdir/build-qtwayland"
  cd "$srcdir/build-qtbase"
  "$srcdir/qtbase-everywhere-src-$pkgver/configure" \
    -prefix "$_prefix" -opensource -confirm-license \
    -release -shared -nomake examples -nomake tests \
    -opengl desktop -xcb -dbus-linked -no-feature-vulkan \
    QMAKE_CFLAGS="$CFLAGS" QMAKE_CXXFLAGS="$CXXFLAGS" QMAKE_LFLAGS="$LDFLAGS"
  make

  cd "$srcdir/build-qtwayland"
  "$srcdir/build-qtbase/bin/qmake" \
    "$srcdir/qtwayland-everywhere-src-$pkgver/qtwayland.pro" \
    -- -no-feature-wayland-server
  make
}

package() {
  cd "$srcdir/build-qtwayland"
  # QtBase is a build dependency only: retain the vendor's customized Qt at runtime.
  install -dm755 "$pkgdir$_prefix/lib" "$pkgdir$_prefix/plugins"
  cp -a --no-preserve=ownership lib/libQt5WaylandClient.so* "$pkgdir$_prefix/lib/"
  local directory
  for directory in platforms wayland-decoration-client \
    wayland-graphics-integration-client wayland-shell-integration; do
    cp -a --no-preserve=ownership "plugins/$directory" "$pkgdir$_prefix/plugins/"
  done

  # Expose only the optional input plugin, not the system Qt platform plugins.
  install -dm755 "$pkgdir$_prefix/plugins/platforminputcontexts"
  ln -s /usr/lib/qt/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so \
    "$pkgdir$_prefix/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so"

  install -Dm755 "$srcdir/tang-dynasty-wayland.sh" \
    "$pkgdir/usr/bin/tang-dynasty-wayland"
  ln -s tang-dynasty-wayland "$pkgdir/usr/bin/td-wayland"
  install -Dm644 "$srcdir/tang-dynasty-wayland.desktop" \
    "$pkgdir/usr/share/applications/tang-dynasty-wayland.desktop"
  install -Dm644 "$srcdir/qtwayland-everywhere-src-$pkgver/LICENSE.LGPL3" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL3"
  install -Dm644 "$srcdir/qtwayland-everywhere-src-$pkgver/LICENSE.GPL3" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL3"
}
