# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-dtk6-git
pkgver=6.0.48.r0.g0000000
pkgrel=1
pkgdesc='GXDE OS fork of the Deepin Tool Kit 6, note that we are conflicted with Deepin DTK6'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(LGPL-3.0-or-later)
_mods=(dtk6log dtk6core dtk6gui dtk6widget dtk6declarative dde-qt6platform-plugins qt6integration)
_tagged=(dtk6log dtk6gui dtk6widget dtk6declarative dde-qt6platform-plugins qt6integration)
depends=(gxde-dtk5-git qt6-base qt6-svg qt6-declarative qt6-5compat
         libqtxdg spdlog fmt systemd-libs dbus glib2 wayland libglvnd
         libx11 libxext libxi libxcb xcb-util xcb-util-wm xcb-util-cursor startup-notification
         gcc-libs glibc)
makedepends=(git cmake ninja qt6-tools qt6-shadertools qt6-xcb-private-headers treeland-protocols)
optdepends=('lshw: hardware info in DSysInfo')
provides=(dtk6log "dtk6core=${pkgver%%.r*}" "dtk6gui=${pkgver%%.r*}" "dtk6widget=${pkgver%%.r*}"
          "dtk6declarative=${pkgver%%.r*}" "deepin-qt6platform-plugins=${pkgver%%.r*}"
          deepin-qt6integration)
conflicts=(dtk6log dtk6core dtk6gui dtk6widget dtk6declarative
           deepin-qt6platform-plugins deepin-qt6integration)
source=("dtk6log::git+$url/dtk6log.git"
        "dtk6core::git+$url/dtk6core.git#branch=arch/dtkcore"
        "dtk6gui::git+$url/dtk6gui.git"
        "dtk6widget::git+$url/dtk6widget.git"
        "dtk6declarative::git+$url/dtk6declarative.git"
        "dde-qt6platform-plugins::git+$url/dde-qt6platform-plugins.git"
        "qt6integration::git+$url/qt6integration.git")
sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

pkgver() {
  local _count=0 _m
  for _m in "${_mods[@]}"; do
    _count=$((_count + $(git -C "$_m" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$(< dtk6core/VERSION)" "$_count" \
    "$(git -C dtk6core rev-parse --short=7 HEAD)"
}

prepare() {
  local _m _tag
  for _m in "${_tagged[@]}"; do
    _tag=$(git -C "$_m" tag --sort=-v:refname | head -n1)
    msg2 "$_m -> $_tag"
    git -C "$_m" checkout -q --detach "refs/tags/$_tag"
  done
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
    -DMKSPECS_INSTALL_DIR=lib/qt6/mkspecs/modules
    -DBUILD_TESTING=OFF
    -DBUILD_EXAMPLES=OFF
    -DBUILD_DOCS=OFF
  )
  local -A _extra=(
    [dtk6log]="-DBUILD_WITH_QT6=ON -DBUILD_WITH_SYSTEMD=ON"
    [dtk6core]="-DBUILD_WITH_SYSTEMD=ON -DD_DSG_APP_DATA_FALLBACK=/var/dsg/appdata"
    [dtk6gui]="-DDTK_DISABLE_EX_IMAGE_FORMAT=ON"
    [dtk6widget]="-DBUILD_PLUGINS=OFF"
    [dtk6declarative]="-DQML_INSTALL_DIR=lib/qt6/qml"
    [dde-qt6platform-plugins]="-DQT_XCB_PRIVATE_HEADERS=/usr/include/qt6xcb-private"
    [qt6integration]="-DDTK_VERSION=$(sed -n '1s/.*(\([0-9.]*\).*/\1/p' qt6integration/debian/changelog)"
  )

  for _m in "${_mods[@]}"; do
    # shellcheck disable=SC2086
    cmake -S "$_m" -B "build-$_m" "${_common[@]}" ${_extra[$_m]}
    cmake --build "build-$_m"
    DESTDIR="$_stage" cmake --install "build-$_m"
  done
}

package() {
  local _m
  for _m in "${_mods[@]}"; do
    DESTDIR="$pkgdir" cmake --install "build-$_m"
  done
}
