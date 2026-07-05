# Maintainer: yhshzh0

pkgname=pango-design-suite-wayland
pkgver=5.15.2
pkgrel=1
pkgdesc="Native Wayland support runtime and launcher for Pango Design Suite"
arch=('x86_64')
url="https://www.pangomicro.com/product/pds/"
license=('GPL-2.0-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'LGPL-2.1-only' 'FDL-1.3-only')
depends=(
  pango-design-suite-bin
  bash
  gcc-libs
  glibc
  dbus
  wayland
  libxkbcommon
  libglvnd
  mesa
)
makedepends=(
  perl
  ruby
  python
  gperf
  bison
  flex
  sed
  wayland-protocols
  libx11
  libxcb
  libxrender
  libxi
  libxcomposite
  xcb-util
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  xcb-util-cursor
  libdrm
)
optdepends=(
  'fcitx5-qt: Fcitx5 Qt Library for better input method integration'
  'fcitx-qt5: Qt5 IM Module for Fcitx'
)
options=(!debug !strip !emptydirs !staticlibs)

_qtver=5.15.2
_pds_prefix="/opt/pangomicro/pango-design-suite"
_wayland_prefix="/opt/pangomicro/pango-design-suite-wayland"

source=(
  "qt-everywhere-src-${_qtver}.tar.xz::https://download.qt.io/archive/qt/5.15/${_qtver}/single/qt-everywhere-src-${_qtver}.tar.xz"
)
sha256sums=(
  '3a530d1b243b5dec00bc54937455471aaa3e56849d2593edb8ded07228202240'
)

prepare() {
  cd "${srcdir}/qt-everywhere-src-${_qtver}"

  # Current GCC/libstdc++ requires <limits> for std::numeric_limits.
  # Keep the include inside the C++ guarded block.
  if ! grep -q '#  include <limits>' qtbase/src/corelib/global/qglobal.h; then
    sed -i '/#  include <utility>/a #  include <limits>' \
      qtbase/src/corelib/global/qglobal.h
  fi
}

build() {
  mkdir -p "${srcdir}/build-qtwayland-pds"
  cd "${srcdir}/build-qtwayland-pds"

  "${srcdir}/qt-everywhere-src-${_qtver}/configure" \
    -prefix "${_wayland_prefix}" \
    -opensource -confirm-license \
    -release -shared \
    -nomake examples -nomake tests \
    -skip qt3d \
    -skip qtactiveqt \
    -skip qtandroidextras \
    -skip qtcanvas3d \
    -skip qtcharts \
    -skip qtconnectivity \
    -skip qtdatavis3d \
    -skip qtdoc \
    -skip qtgamepad \
    -skip qtlocation \
    -skip qtmacextras \
    -skip qtnetworkauth \
    -skip qtpurchasing \
    -skip qtremoteobjects \
    -skip qtscript \
    -skip qtscxml \
    -skip qtsensors \
    -skip qtserialbus \
    -skip qtserialport \
    -skip qtspeech \
    -skip qttools \
    -skip qttranslations \
    -skip qtvirtualkeyboard \
    -skip qtwebchannel \
    -skip qtwebengine \
    -skip qtwebsockets \
    -skip qtwebview \
    -skip qtwinextras \
    -skip qtxmlpatterns \
    -opengl desktop \
    -xcb \
    -dbus-linked \
    -no-feature-vulkan \
    -no-glib

  make
}

package() {
  cd "${srcdir}/build-qtwayland-pds"

  make INSTALL_ROOT="${pkgdir}" install

  # Keep only the runtime pieces required by PDS Wayland startup.
  rm -rf "${pkgdir}${_wayland_prefix}/bin"
  rm -rf "${pkgdir}${_wayland_prefix}/include"
  rm -rf "${pkgdir}${_wayland_prefix}/mkspecs"
  rm -rf "${pkgdir}${_wayland_prefix}/doc"
  rm -rf "${pkgdir}${_wayland_prefix}/examples"
  rm -rf "${pkgdir}${_wayland_prefix}/qml"
  rm -rf "${pkgdir}${_wayland_prefix}/phrasebooks"
  rm -rf "${pkgdir}${_wayland_prefix}/translations"
  rm -rf "${pkgdir}${_wayland_prefix}/lib/cmake"
  rm -rf "${pkgdir}${_wayland_prefix}/lib/pkgconfig"

  rm -f "${pkgdir}${_wayland_prefix}/lib/"*.prl
  rm -f "${pkgdir}${_wayland_prefix}/lib/"*.la
  rm -f "${pkgdir}${_wayland_prefix}/lib/"*.a

  # PDS must continue to use its bundled QtCore/QtGui/QtWidgets.
  # Keep only QtWaylandClient from this compatibility runtime.
  if [ -d "${pkgdir}${_wayland_prefix}/lib" ]; then
    find "${pkgdir}${_wayland_prefix}/lib" \
      -maxdepth 1 \( -type f -o -type l \) -name 'libQt5*.so*' \
      ! -name 'libQt5WaylandClient.so*' \
      -delete
  fi

  # Keep only Wayland-related Qt plugins needed by the tested launch path.
  if [ -d "${pkgdir}${_wayland_prefix}/plugins" ]; then
    find "${pkgdir}${_wayland_prefix}/plugins" \
      -mindepth 1 -maxdepth 1 -type d \
      ! -name platforms \
      ! -name wayland-decoration-client \
      ! -name wayland-graphics-integration-client \
      ! -name wayland-shell-integration \
      -exec rm -rf {} +

    # Keep only the relevant platform plugins.
    if [ -d "${pkgdir}${_wayland_prefix}/plugins/platforms" ]; then
      find "${pkgdir}${_wayland_prefix}/plugins/platforms" \
        -type f \
        ! -name 'libqwayland*.so' \
        -delete
    fi
  fi

  # Launcher: native Wayland first, XWayland/XCB fallback retained.
  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash

PDS=${_pds_prefix}
QTWL=${_wayland_prefix}

export LD_LIBRARY_PATH="\$PDS/lib:\$QTWL/lib:\$LD_LIBRARY_PATH"
export QT_PLUGIN_PATH="\$QTWL/plugins:\$PDS/lib/plugins"
export QT_QPA_PLATFORM_PLUGIN_PATH="\$QTWL/plugins/platforms"
export QT_QPA_PLATFORM="\${QT_QPA_PLATFORM:-wayland;xcb}"
export QT_IM_MODULE="\${QT_IM_MODULE:-fcitx}"

exec "\$PDS/bin/pds" "\$@"
EOF

  ln -s "${pkgname}" "${pkgdir}/usr/bin/pds-wayland"

  # Desktop entry: separate Wayland launcher, leaving the original PDS desktop entry untouched.
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/com.pangomicro.pds-wayland.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=pds (Wayland)
Comment=Pango Design Suite (PDS) with native Wayland support
Categories=Development;Electronics;

Icon=pango-design-suite
Exec=${pkgname} %U
Terminal=false
EOF

  # Optional AppStream metadata for the Wayland launcher.
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/com.pangomicro.pds-wayland.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.pangomicro.pds-wayland</id>

  <name>PDS (Wayland)</name>
  <summary>Pango Design Suite (PDS) native Wayland launcher</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      Native Wayland compatibility runtime and launcher for Pango Design Suite on Arch Linux.
      This package depends on pango-design-suite-bin and does not replace the original X11/XWayland launcher.
    </p>
  </description>

  <launchable type="desktop-id">com.pangomicro.pds-wayland.desktop</launchable>
</component>
EOF

  # Qt open-source license files for the built compatibility runtime.
  install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname}/qt-${_qtver}"

  for _license in \
    LICENSE.GPLv2 \
    LICENSE.GPLv3 \
    LICENSE.LGPLv21 \
    LICENSE.LGPLv3 \
    LICENSE.FDL
  do
    if [ -f "${srcdir}/qt-everywhere-src-${_qtver}/${_license}" ]; then
      install -Dm0644 "${srcdir}/qt-everywhere-src-${_qtver}/${_license}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/qt-${_qtver}/${_license}"
    fi
  done
}
