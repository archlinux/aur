# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-dtk2-qt6-git
pkgver=6.0.1.r0.g0000000
pkgrel=1
pkgdesc='Qt6 port of DTK2, requires GXDE DTK6 to work.'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(LGPL-3.0-or-later GPL-3.0-or-later)
_mods=(dtk2widget-qt6 gxde-qt6-integration)
depends=(gxde-dtk6-git qt6-base qt6-svg qt6-multimedia gsettings-qt6
         librsvg cairo glib2 layer-shell-qt wayland libx11 libxext libxi libxcb xcb-util
         startup-notification gcc-libs glibc)
makedepends=(git qt6-tools qt6-scxml)
source=("dtk2widget-qt6::git+$url/dtk2widget-qt6.git#branch=qt6"
        "gxde-qt6-integration::git+$url/gxde-qt6-integration.git#branch=qt6")
sha256sums=(SKIP SKIP)

pkgver() {
  local _count=0 _m
  for _m in "${_mods[@]}"; do
    _count=$((_count + $(git -C "$_m" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$(sed -n 's/^VERSION *= *//p' dtk2widget-qt6/src/src.pro)" "$_count" \
    "$(git -C dtk2widget-qt6 rev-parse --short=7 HEAD)"
}

prepare() {
  local _m _tag
  for _m in "${_mods[@]}"; do
    _tag=$(git -C "$_m" describe --tags --abbrev=0)
    msg2 "$_m -> $_tag"
    git -C "$_m" checkout -q --detach "refs/tags/$_tag"
  done
}

_fix_pc() {
  sed -i -e 's|^Requires: dtkcore$|Requires: dtk6core|' \
         -e 's|^Libs: -ldtk2widget|Libs: -L${libdir} -ldtk2widget|' "$1"
}

build() {
  local _stage="$srcdir/stage"
  mkdir -p "$srcdir/pc"
  export LD_LIBRARY_PATH="$_stage/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  export PKG_CONFIG_PATH="$srcdir/pc${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"

  local _qmake=(
    PREFIX=/usr
    LIB_INSTALL_DIR=/usr/lib
    CONFIG+=no_qt_rpath
    QMAKE_CFLAGS_RELEASE="$CFLAGS"
    QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  )

  mkdir -p build-dtk2widget-qt6
  ( cd build-dtk2widget-qt6 && qmake6 -r ../dtk2widget-qt6 "${_qmake[@]}" && make )
  make -C build-dtk2widget-qt6 INSTALL_ROOT="$_stage" install
  sed -e "s|^prefix=.*|prefix=$_stage/usr|" "$_stage/usr/lib/pkgconfig/dtk2widget.pc" > "$srcdir/pc/dtk2widget.pc"
  _fix_pc "$srcdir/pc/dtk2widget.pc"

  mkdir -p build-gxde-qt6-integration
  ( cd build-gxde-qt6-integration && qmake6 -r ../gxde-qt6-integration "${_qmake[@]}" && make )
}

package() {
  make -C build-dtk2widget-qt6 INSTALL_ROOT="$pkgdir" install
  make -C build-gxde-qt6-integration INSTALL_ROOT="$pkgdir" install
  _fix_pc "$pkgdir/usr/lib/pkgconfig/dtk2widget.pc"
}
