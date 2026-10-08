# Maintainer: CharOfString <root@charofstring.cc>

pkgbase=gxde-dtk2-git
pkgname=(gxde-dtk2-git gxde-dtk2widget-dev-git)
pkgver=2.5.r0.g0000000
pkgrel=1
pkgdesc='GXDE OS DTK2 fork, modified to work with DTK5'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(LGPL-3.0-or-later GPL-3.0-or-later)
_mods=(dtk2core dde-qt-dbus-factory dtk2widget gxde-qt5integration)
depends=(gxde-dtk5-git qt5-base qt5-svg qt5-x11extras qt5-multimedia
         gsettings-qt5 librsvg cairo glib2 startup-notification wayland
         libx11 libxext libxi libxcb xcb-util gcc-libs glibc)
makedepends=(git qt5-tools)
source=("dtk2core::git+$url/dtk2core.git"
        "dde-qt-dbus-factory::git+$url/dde-qt-dbus-factory.git"
        "dtk2widget::git+$url/dtk2widget.git"
        "gxde-qt5integration::git+$url/gxde-qt5integration.git")
sha256sums=(SKIP SKIP SKIP SKIP)

_ver() {
  sed -n '1s/.*(\([0-9]*:\)\?\([0-9.]*\).*/\2/p' "$1/debian/changelog"
}

pkgver() {
  local _count=0 _m
  for _m in "${_mods[@]}"; do
    _count=$((_count + $(git -C "$_m" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$(_ver dtk2widget)" "$_count" \
    "$(git -C dtk2widget rev-parse --short=7 HEAD)"
}

prepare() {
  local _m _tag
  for _m in "${_mods[@]}"; do
    _tag=$(git -C "$_m" describe --tags --abbrev=0)
    msg2 "$_m -> $_tag"
    git -C "$_m" checkout -q --detach "refs/tags/$_tag"
  done
}

_stage_pc() {
  sed -e "s|^prefix=.*|prefix=$srcdir/stage/usr|" -e 's|^Libs: |Libs: -L${libdir} |' \
    "$srcdir/stage/usr/lib/pkgconfig/$1.pc" > "$srcdir/pc/$1.pc"
}

build() {
  local _stage="$srcdir/stage"
  mkdir -p "$srcdir/pc"
  export LD_LIBRARY_PATH="$_stage/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  export PKG_CONFIG_PATH="$srcdir/pc${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"

  local _qmake=(
    PREFIX=/usr
    LIB_INSTALL_DIR=/usr/lib
    INCLUDEPATH+=/usr/include/qt5
    QMAKE_CFLAGS_RELEASE="$CFLAGS"
    QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  )

  mkdir -p build-dde-qt-dbus-factory
  ( cd build-dde-qt-dbus-factory && qmake-qt5 ../dde-qt-dbus-factory "${_qmake[@]}" && make )
  make -C build-dde-qt-dbus-factory INSTALL_ROOT="$_stage" install
  _stage_pc dframeworkdbus

  local _wver
  _wver=$(_ver dtk2widget)
  mkdir -p build-dtk2widget
  ( cd build-dtk2widget && qmake-qt5 -r ../dtk2widget "${_qmake[@]}" VERSION="$_wver" && make )
  make -C build-dtk2widget INSTALL_ROOT="$_stage" install
  _stage_pc dtkwidget

  mkdir -p build-gxde-qt5integration
  ( cd build-gxde-qt5integration && qmake-qt5 -r ../gxde-qt5integration "${_qmake[@]}" && make )
}

_widget_dev=(usr/lib/libdtkwidget.so
             usr/include/dtk5/DWidget
             usr/lib/pkgconfig/dtkwidget.pc
             usr/lib/cmake/DtkWidget
             usr/lib/qt/mkspecs/modules/qt_lib_dtkwidget.pri)

package_gxde-dtk2-git() {
  optdepends=('gxde-dtk2widget-dev-git: DTK2 widget development files')
  provides=(deepin-qt-dbus-factory)
  conflicts=(deepin-qt-dbus-factory)

  make -C build-dde-qt-dbus-factory INSTALL_ROOT="$pkgdir" install
  make -C build-dtk2widget INSTALL_ROOT="$pkgdir" install
  make -C build-gxde-qt5integration INSTALL_ROOT="$pkgdir" install
  ( cd "$pkgdir" && rm -r "${_widget_dev[@]}" )

  ln -s libdtkcore.so.5 "$pkgdir/usr/lib/libdtkcore.so.2"
}

package_gxde-dtk2widget-dev-git() {
  pkgdesc='GXDE OS DTK2 widget development files'
  depends=("gxde-dtk2-git=$pkgver-$pkgrel")
  conflicts=(gxde-dtk5widget-dev-git)

  local _root="$srcdir/widget-root" _f
  rm -rf "$_root"
  make -C build-dtk2widget INSTALL_ROOT="$_root" install
  for _f in "${_widget_dev[@]}"; do
    install -d "$pkgdir/$(dirname "$_f")"
    mv "$_root/$_f" "$pkgdir/$_f"
  done
}
