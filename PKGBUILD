# Maintainer: yhshzh0 <yhshzh0@outlook.com>
# Builds a private Qt 6.5.7 SDK with the feature set tested against Altera's Qt,
# then packages only the Wayland client runtime/plugins (not Qt Core/Gui).

pkgname=quartus-wayland
pkgver=6.5.7
pkgrel=1
pkgdesc='Native Wayland launchers for Quartus/IP and a sharp Questa HiDPI launcher'
arch=('x86_64')
url='https://aur.archlinux.org/packages/quartus-wayland'
license=('LGPL-3.0-only' 'GPL-3.0-only' 'GPL-2.0-only WITH Classpath-exception-2.0' 'CDDL-1.1')
depends=(
  'quartus-free-quartus' 'bash' 'python' 'curl' 'coreutils' 'glibc'
  'libgcc' 'libstdc++' 'wayland' 'libxkbcommon' 'dbus' 'fontconfig'
  'freetype2' 'libxtst' 'libxi' 'libxrender' 'libx11' 'libxext'
  'libglvnd' 'alsa-lib' 'zlib'
)
makedepends=(
  'cmake'
  'ninja'
  'perl'
  'pkgconf'
  'wayland-protocols'
  'glib2'
  'harfbuzz'
  'libpng'
)
optdepends=(
  'quartus-free-questa: Questa FPGA Starter Edition simulation tools'
  'gamescope: Questa HiDPI display'
  'desktop-file-utils: refresh locally installed desktop entries'
)
options=('!debug' '!lto' '!strip')
conflicts=('quartus-wayland-qt657')

_qtbase="qtbase-everywhere-opensource-src-${pkgver}.tar.xz"
_qtwayland="qtwayland-everywhere-opensource-src-${pkgver}.tar.xz"
_qturl="https://download.qt.io/archive/qt/6.5/${pkgver}/src/submodules"
_runtime_prefix='/opt/qt657-wayland'
_jbr='jbr-21.0.8-linux-x64-b1038.68'

source=(
  "${_qturl}/${_qtbase}"
  "${_qturl}/${_qtwayland}"
  'quartus-wayland'
  'java-wayland'
  'quartus-wayland.desktop'
  'qmegawiz-wayland.desktop'
  'qsys-edit-wayland.desktop'
  'questa-hidpi'
  'questa-hidpi.tcl'
  'questa-hidpi.desktop'
  'configure-quartus.tcl'
  'install-local.sh'
  'README.md'
  "https://cache-redirector.jetbrains.com/intellij-jbr/${_jbr}.tar.gz"
  'https://repo.maven.apache.org/maven2/com/sun/activation/javax.activation/1.2.0/javax.activation-1.2.0.jar'
)
sha256sums=(
  '1226f966d849ead15a6be1a87566cc3f8a2913e8dc08f01a0302359db4611168'
  '4b48b091eef75f38dc7fc78d36c364c39a50e35497adf34715e7d3eafcb01dd6'
  '2a5c8c6ea42981383d86c4545e434b10485868296b8fe034be117c486babdebc'
  'da43a6e21e54be0c7271a92e57b485430daa586fb223d5c8ca4970f64a5c7dc1'
  '8ffc253cc62c10454ea1ca5da8496a45847ddd6c9ff0f9abc58a301d8aad4b88'
  '71fb592fc82a20518cf07417015e006e706e012f662963df176aad187c2ebb3a'
  '797e4565bf5c8d2676cc3e6fa1479e4adcf9c11900b8ae6c161b9fbfb103e492'
  'fb2d62df100ef5d0dedbcf2b02d06c43ee197e403789a289bb0a62c664d4be5d'
  'c268a8c6586637998f2877a141919f9444e8deb9ad12d4d84c7b613dea6efb4c'
  '4ca7ae4fe86b7fbb206b22657a5a00081d78b36269bf339393539de2e9bfc7a2'
  '45cc6e0dceaece86dae6934d596ec036e725cb0459e3824c7c84501530317e38'
  '9a84a6604de469bcf474256ca73b6301787b9c2c5b5c2c0c6549d9e9ede98303'
  '9f8795300485ce9cecaf3c37ce8e5ea72684258649dd8c0ddcb590646dfcd60d'
  'ad3dcf0e8df0a63299ecdf303658db2f4565413b175796c5743203047b9887eb'
  '993302b16cd7056f21e779cc577d175a810bb4900ef73cd8fbf2b50f928ba9ce'
)

build() {
  local sdk="${srcdir}/qt657-sdk"
  if [[ -n ${QUARTUS_WAYLAND_QT6_PREFIX:-} ]]; then
    [[ -r "$QUARTUS_WAYLAND_QT6_PREFIX/plugins/platforms/libqwayland-generic.so" ]] || return 1
    printf 'Reusing Qt runtime: %s\n' "$QUARTUS_WAYLAND_QT6_PREFIX"
    return 0
  fi
  local qtbase_src="${srcdir}/qtbase-everywhere-src-${pkgver}"
  local qtwayland_src="${srcdir}/qtwayland-everywhere-src-${pkgver}"
  local qtbase_build="${srcdir}/build-qtbase"
  local qtwayland_build="${srcdir}/build-qtwayland"

  # Build a private Qt Base SDK solely to compile Qt Wayland against the same
  # Qt release. It is deliberately not installed into the final package.
  mkdir -p "${qtbase_build}"
  cd "${qtbase_build}"

  "${qtbase_src}/configure" \
    -prefix "${sdk}" \
    -release \
    -opensource \
    -confirm-license \
    -shared \
    -nomake examples \
    -nomake tests \
    -no-opengl \
    -no-openssl \
    -- \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS="${LDFLAGS}" \
    -DFEATURE_opengl=OFF \
    -DFEATURE_openssl=OFF \
    -DFEATURE_vulkan=OFF \
    -DFEATURE_accessibility_atspi_bridge=OFF \
    -DFEATURE_system_textmarkdownreader=OFF

  cmake --build "${qtbase_build}" --parallel
  cmake --install "${qtbase_build}"

  # Build Qt Wayland 6.5.7 against the just-built Qt Base 6.5.7 SDK.
  mkdir -p "${qtwayland_build}"
  cd "${qtwayland_build}"

  "${sdk}/bin/qt-configure-module" "${qtwayland_src}" -- \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS="${LDFLAGS}"
  cmake --build "${qtwayland_build}" --parallel
  cmake --install "${qtwayland_build}"
}

package() {
  local sdk="${QUARTUS_WAYLAND_QT6_PREFIX:-${srcdir}/qt657-sdk}"
  local sdk_plugins="${sdk}/plugins"
  local sdk_lib="${sdk}/lib"
  local out_lib="${pkgdir}${_runtime_prefix}/lib"
  local out_plugins="${pkgdir}${_runtime_prefix}/plugins"
  local file

  # Keep the directory layout used by the plugin RUNPATHs:
  # plugins/platforms/../../lib and lib/$ORIGIN.
  install -d "${out_lib}" \
    "${out_plugins}/platforms" \
    "${out_plugins}/wayland-shell-integration"

  # These are the Qt libraries needed alongside the Quartus-provided
  # QtCore/QtGui. QtDBus is included because the tested Qt Wayland client
  # resolves it from this private runtime directory on the target setup.
  for file in \
    "${sdk_lib}"/libQt6WaylandClient.so* \
    "${sdk_lib}"/libQt6WaylandEglClientHwIntegration.so* \
    "${sdk_lib}"/libQt6DBus.so*; do
    [[ -e "${file}" ]] || continue
    cp -a "${file}" "${out_lib}/"
  done

  [[ -e "${out_lib}/libQt6WaylandClient.so.6" ]] || {
    printf 'Qt Wayland Client library was not produced\n' >&2
    return 1
  }

  install -Dm755 \
    "${sdk_plugins}/platforms/libqwayland-generic.so" \
    "${out_plugins}/platforms/libqwayland-generic.so"

  # Preserve the plugin category directory: QT_PLUGIN_PATH must point to
  # its parent for Qt to discover the xdg-shell integration plugin.
  [[ -d "${sdk_plugins}/wayland-shell-integration" ]] || {
    printf 'Qt Wayland shell-integration plugin directory is missing\n' >&2
    return 1
  }
  install -Dm755 "${sdk_plugins}/wayland-shell-integration/libxdg-shell.so" \
    "${out_plugins}/wayland-shell-integration/libxdg-shell.so"

  [[ -e "${out_plugins}/wayland-shell-integration/libxdg-shell.so" ]] || {
    printf 'xdg-shell integration plugin was not produced\n' >&2
    return 1
  }

  install -Dm755 "${srcdir}/quartus-wayland" \
    "${pkgdir}/usr/bin/quartus-wayland"
  ln -s quartus-wayland "${pkgdir}/usr/bin/qmegawiz-wayland"
  ln -s quartus-wayland "${pkgdir}/usr/bin/qsys-edit-wayland"
  install -Dm755 "${srcdir}/questa-hidpi" "${pkgdir}/usr/bin/questa-hidpi"
  install -Dm755 "${srcdir}/java-wayland" "${pkgdir}/opt/quartus-wayland/java/bin/java"
  install -Dm644 "${srcdir}/questa-hidpi.tcl" "${pkgdir}/opt/quartus-wayland/questa-hidpi.tcl"
  install -Dm644 "${srcdir}/javax.activation-1.2.0.jar" "${pkgdir}/opt/quartus-wayland/lib/javax.activation-1.2.0.jar"
  cp -a "${srcdir}/${_jbr}" "${pkgdir}/opt/quartus-wayland/jbr"
  local entry
  for entry in quartus-wayland qmegawiz-wayland qsys-edit-wayland questa-hidpi; do
    install -Dm644 "${srcdir}/${entry}.desktop" "${pkgdir}/usr/share/applications/${entry}.desktop"
  done
  # The setup command installs per-user hooks and configures NativeLink through
  # Quartus's Tcl API. Package installation itself does not edit home files.
  local share="${pkgdir}/usr/share/quartus-wayland"
  for file in quartus-wayland questa-hidpi install-local.sh; do
    install -Dm755 "${srcdir}/$file" "$share/$file"
  done
  for file in configure-quartus.tcl questa-hidpi.tcl quartus-wayland.desktop qmegawiz-wayland.desktop qsys-edit-wayland.desktop questa-hidpi.desktop; do
    install -Dm644 "${srcdir}/$file" "$share/$file"
  done
  install -Dm755 "${srcdir}/java-wayland" "$share/java-wayland"
  ln -s /usr/share/quartus-wayland/install-local.sh "${pkgdir}/usr/bin/quartus-wayland-setup"
  install -Dm644 "${srcdir}/${_jbr}/legal/java.base/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/JBR-LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/qtwayland-everywhere-src-${pkgver}/LICENSES/LGPL-3.0-only.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/Qt-LGPL-3.0-only.txt"
}
