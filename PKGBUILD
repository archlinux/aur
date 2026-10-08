# Maintainer: CharOfString <root@charofstring.cc>

pkgbase=gxde-dtk5-git
pkgname=(gxde-dtk5-git gxde-dtk5widget-dev-git)
pkgver=6.7.43.r4500.g16597fc
pkgrel=1
pkgdesc='GXDE OS fork of the Deepin Tool Kit 5, note that we are conflicted with Deepin DTK5'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(LGPL-3.0-or-later LGPL-2.1-or-later BSD-3-Clause GPL-3.0-or-later)
_mods=(dtk5common dtklog dtk5core dtk5gui dtk5widget dde-qt5platform-plugins dde-qt5integration)
depends=(qt5-base qt5-svg qt5-x11extras qt5-wayland libqt5xdg
         gsettings-qt5 spdlog systemd-libs dbus icu uchardet librsvg
         libx11 libxext libxi xcb-util startup-notification
         gcc-libs glibc)
makedepends=(git cmake ninja qt5-tools qt5-xcb-private-headers kwayland5 extra-cmake-modules treeland-protocols)
source=("dtk5common::git+$url/dtk5common.git"
        "dtklog::git+$url/dtklog.git"
        "dtk5core::git+$url/dtk5core.git"
        "dtk5gui::git+$url/dtk5gui.git"
        "dtk5widget::git+$url/dtk5widget.git"
        "dde-qt5platform-plugins::git+$url/dde-qt5platform-plugins.git"
        "dde-qt5integration::git+$url/dde-qt5integration.git"
        dtk5common-preference-6.7.43.patch)
sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP
            c906d0091d3d5835f987bda03bc597420b7691dbe636bcb5bdf0ba46796fb32a)

pkgver() {
  # 版本号取 dtk5core 的 VERSION，修订号为五个仓库的提交数之和，
  # 任何一个仓库有新提交都会让 pkgver 增长
  local _count=0 _m
  for _m in "${_mods[@]}"; do
    _count=$((_count + $(git -C "$_m" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$(< dtk5core/VERSION)" "$_count" \
    "$(git -C dtk5core rev-parse --short=7 HEAD)"
}

prepare() {
  if ! grep -q disableInWindowBlur dtk5common/configs/org.deepin.dtk.preference.json; then
    patch -Np1 -d dtk5common < dtk5common-preference-6.7.43.patch
  fi

  sed -i "s|/usr/share/dsg/configs/|$srcdir/stage/usr/share/dsg/configs/|" \
    dtk5gui/src/kernel/kernel.cmake
}

build() {
  local _stage="$srcdir/stage" _m
  export LD_LIBRARY_PATH="$_stage/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

  local _common=(
    -G Ninja
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_INSTALL_LIBEXECDIR=lib
    -DCMAKE_PREFIX_PATH="$_stage/usr"
    -DCMAKE_BUILD_TYPE=None
    -DMKSPECS_INSTALL_DIR=lib/qt/mkspecs/modules
    -DDTK5=ON
    -DBUILD_TESTING=OFF
    -DBUILD_EXAMPLES=OFF
    -DBUILD_DOCS=OFF
  )
  local -A _extra=(
    [dtk5common]="-DDTK_VERSION=$(sed -n '1s/.*(\([0-9.]*\).*/\1/p' dtk5common/debian/changelog)"
    [dtklog]="-DBUILD_WITH_SYSTEMD=ON"
    [dtk5core]="-DBUILD_WITH_SYSTEMD=ON -DD_DSG_APP_DATA_FALLBACK=/var/dsg/appdata -DFEATURES_INSTALL_DIR=lib/qt/mkspecs/features"
    [dtk5gui]="-DDTK_DISABLE_EX_IMAGE_FORMAT=ON"
    [dtk5widget]="-DBUILD_PLUGINS=OFF -DDTK_STATIC_TRANSLATION=YES"
    [dde-qt5platform-plugins]="-DQT_XCB_PRIVATE_HEADERS=/usr/include/qtxcb-private"
    [dde-qt5integration]="-DPLUGIN_INSTALL_BASE_DIR=lib/qt/plugins"
  )

  for _m in "${_mods[@]}"; do
    # shellcheck disable=SC2086
    cmake -S "$_m" -B "build-$_m" "${_common[@]}" ${_extra[$_m]}
    cmake --build "build-$_m"
    DESTDIR="$_stage" cmake --install "build-$_m"
  done
}

_widget_dev=(usr/lib/libdtkwidget.so
             usr/include/dtk5/DWidget
             usr/lib/pkgconfig/dtkwidget.pc
             usr/lib/cmake/DtkWidget
             usr/lib/qt/mkspecs/modules/qt_lib_DtkWidget.pri)

package_gxde-dtk5-git() {
  optdepends=('lshw: hardware info in DSysInfo'
              'gxde-dtk5widget-dev-git: DTK5 widget development files')
  provides=(dtkcommon "dtklog=${pkgver%%.r*}" "dtkcore=${pkgver%%.r*}"
            "dtkgui=${pkgver%%.r*}" "dtkwidget=${pkgver%%.r*}"
            deepin-qt5platform-plugins deepin-qt5integration)
  conflicts=(dtkcommon dtklog dtkcore dtkgui dtkwidget
             deepin-qt5platform-plugins deepin-qt5integration)

  local _m
  for _m in "${_mods[@]}"; do
    DESTDIR="$pkgdir" cmake --install "build-$_m"
  done
  ( cd "$pkgdir" && rm -r "${_widget_dev[@]}" )

  # dde-qt5platform-plugins 写死了 lib/qt5/plugins，Arch 的 Qt5 插件目录是 lib/qt/plugins
  cp -a "$pkgdir/usr/lib/qt5/plugins/." "$pkgdir/usr/lib/qt/plugins/"
  rm -r "$pkgdir/usr/lib/qt5"

  install -Dm644 dtk5common/LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}

package_gxde-dtk5widget-dev-git() {
  pkgdesc='GXDE OS fork of the Deepin Tool Kit 5 widget development files'
  depends=("gxde-dtk5-git=$pkgver-$pkgrel")
  conflicts=(gxde-dtk2widget-dev-git)

  local _root="$srcdir/widget-root" _f
  rm -rf "$_root"
  DESTDIR="$_root" cmake --install build-dtk5widget
  for _f in "${_widget_dev[@]}"; do
    install -d "$pkgdir/$(dirname "$_f")"
    mv "$_root/$_f" "$pkgdir/$_f"
  done
}
