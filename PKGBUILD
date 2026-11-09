# Maintainer: Arimil <renari at arimil dot com>

pkgname=openmouse-bridge-bin
_pkgname=openmouse-bridge
# scripts/update.sh keeps _tag, _nodehid, pkgver and the sums in sync.
_tag=v1.0.0
# The full package; the unsuffixed linux-x64.zip is a stub for old self-updaters.
_asset=openmouse-bridge-linux-x64-full.zip
# node-hid version bundled in the release; see package().
_nodehid=3.4.0
pkgver=1.0.0
pkgrel=1
pkgdesc='Background service for OpenMouse: device communication, app detection and automatic profile switching'
arch=('x86_64')
url='https://github.com/OpenMouse-Project/OpenMouse-Bridge'
license=('MIT' 'OFL-1.1')
# The panel renders through wgpu, which dlopen()s libEGL (libglvnd), libvulkan
# when present, and the Wayland client libraries. Its text needs one of a fixed
# list of font families (Noto Sans, DejaVu Sans, Cantarell, Adwaita Sans, ...)
# or it panics; ttf-font providers such as ttf-liberation are not on that list.
# libusb and libstdc++ are for the bundled Node.js runtime and node-hid.
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libusb'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'noto-fonts'
  'systemd-libs'
  'wayland'
)
optdepends=(
  'vulkan-icd-loader: render the panel with Vulkan instead of OpenGL'
  'alsa-utils: notification chime via aplay'
  'libpulse: notification chime via paplay'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# Prebuilt upstream binaries, including a bundled Node.js runtime for the HID helper.
options=('!strip' '!debug')
install="${pkgname}.install"
source=(
  "${_pkgname}-${pkgver}.zip::${url}/releases/download/${_tag}/${_asset}"
  "${_pkgname}.desktop"
  "69-${_pkgname}.rules"
  "${_pkgname}-is-mouse"
  "${_pkgname}-modules.conf"
  "node-hid-${_nodehid}.tgz::https://registry.npmjs.org/node-hid/-/node-hid-${_nodehid}.tgz"
)
noextract=("node-hid-${_nodehid}.tgz")
sha256sums=('230473911849b0562eab6d153e5555144b226c99012e20c6e82e9bcceae8c9b8'
            '9eeb9ed4c885c9d03b1f33f8464554cf37d7bceff4c6f3dee4e1efa3d53bb572'
            '4c545088fa6181494f60941789528c9403f1e0bccf8e1f50af5b7dba77d5c8e0'
            '0c2d21427ef804794eb32690dc5e71532d651905ebb7a95730336ae2d33baf84'
            '23916ff2940e03188a34a613e343fc43aaf0067ebb82265ba5d8b46ae2466e82'
            'a6a4700d773e6f9944cad708642864478cd29a7abd42f83d4a1c7125c562fa80')

prepare() {
  local bundled
  bundled="$(sed -n 's/^  "version": "\(.*\)",$/\1/p' "${srcdir}/native-hid/node_modules/node-hid/package.json")"
  if [[ "${bundled}" != "${_nodehid}" ]]; then
    printf 'release bundles node-hid %s, PKGBUILD expects %s\n' "${bundled}" "${_nodehid}" >&2
    return 1
  fi
}

package() {
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a --no-preserve=ownership \
    "${srcdir}/${_pkgname}" \
    "${srcdir}/native-hid" \
    "${srcdir}/openmouse-app-icon.png" \
    "${srcdir}/DM-Sans-OFL.txt" \
    "${pkgdir}/usr/lib/${_pkgname}/"
  chmod 755 "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}" \
    "${pkgdir}/usr/lib/${_pkgname}/native-hid/node/bin/node"
  # Upstream's release strips node-hid's hidraw prebuild, but node-hid loads
  # that backend by default on Linux, so restore it from the same npm release.
  local prebuilds="${pkgdir}/usr/lib/${_pkgname}/native-hid/node_modules/node-hid/prebuilds"
  if [[ ! -e "${prebuilds}/HID_hidraw-linux-x64" ]]; then
    bsdtar -xf "${srcdir}/node-hid-${_nodehid}.tgz" -C "${prebuilds}" --no-same-owner \
      --strip-components 2 package/prebuilds/HID_hidraw-linux-x64
  fi
  # The executable finds native-hid/ next to /proc/self/exe, so a symlink is enough.
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/io.openmouse.bridge.desktop"
  install -Dm644 "${srcdir}/openmouse-app-icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.openmouse.bridge.png"
  install -Dm644 "${srcdir}/69-${_pkgname}.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/69-${_pkgname}.rules"
  # Run by the rule as `/bin/sh <helper>`, so it needs no execute bit.
  install -Dm644 "${srcdir}/${_pkgname}-is-mouse" \
    "${pkgdir}/usr/lib/udev/${_pkgname}-is-mouse"
  install -Dm644 "${srcdir}/${_pkgname}-modules.conf" \
    "${pkgdir}/usr/lib/modules-load.d/${_pkgname}.conf"

  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/DM-Sans-OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/DM-Sans-OFL.txt"
}
