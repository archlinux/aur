# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-dtk5-git
pkgver=6.7.43.r4500.g16597fc
pkgrel=1
pkgdesc='GXDE OS fork of the Deepin Tool Kit 5, note that we are conflicted with Deepin DTK5'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(LGPL-3.0-or-later LGPL-2.1-or-later BSD-3-Clause)
_mods=(dtk5common dtklog dtk5core dtk5gui dtk5widget)
depends=(qt5-base qt5-svg qt5-x11extras qt5-wayland libqt5xdg
         gsettings-qt5 spdlog systemd-libs dbus icu uchardet librsvg
         libx11 libxext libxi xcb-util startup-notification
         gcc-libs glibc)
makedepends=(git cmake ninja qt5-tools extra-cmake-modules treeland-protocols)
optdepends=('lshw: hardware info in DSysInfo')
provides=(dtkcommon "dtklog=${pkgver%%.r*}" "dtkcore=${pkgver%%.r*}"
          "dtkgui=${pkgver%%.r*}" "dtkwidget=${pkgver%%.r*}")
conflicts=(dtkcommon dtklog dtkcore dtkgui dtkwidget)
source=("dtk5common::git+$url/dtk5common.git"
        "dtklog::git+$url/dtklog.git"
        "dtk5core::git+$url/dtk5core.git"
        "dtk5gui::git+$url/dtk5gui.git"
        "dtk5widget::git+$url/dtk5widget.git"
        dtk5common-preference-6.7.43.patch)
sha256sums=(SKIP SKIP SKIP SKIP SKIP
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
    [dtk5core]="-DBUILD_WITH_SYSTEMD=ON -DD_DSG_APP_DATA_FALLBACK=/var/dsg/appdata"
    [dtk5gui]="-DDTK_DISABLE_EX_IMAGE_FORMAT=ON"
    [dtk5widget]="-DBUILD_PLUGINS=OFF -DDTK_STATIC_TRANSLATION=YES"
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

  install -Dm644 dtk5common/LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}

