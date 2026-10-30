# Maintainer: Arimil <renari at arimil dot com>

pkgname=openmouse-bridge-bin
_pkgname=openmouse-bridge
# scripts/update.sh keeps _tag, _asset, _nodehid, pkgver and the sums in sync.
_tag=v1.0.0-beta.20
_asset=openmouse-bridge-linux-x64.zip
# node-hid version bundled in the release; see package().
_nodehid=3.4.0
# Bridge's in-app update check is pointed at this release; see prepare().
# Numeric ID of OpenMouse-Project/OpenMouse-Bridge, which keeps the URL short.
_repoid=1328502232
_updateurl="https://api.github.com/repositories/${_repoid}/releases/tags/${_tag}"
pkgver=1.0.0beta.20
pkgrel=1
pkgdesc='Background service for OpenMouse: device communication, app detection and automatic profile switching'
arch=('x86_64')
url='https://github.com/OpenMouse-Project/OpenMouse-Bridge'
license=('MIT' 'OFL-1.1')
# libayatana-appindicator, libglvnd and libxkbcommon-x11 are dlopen()ed by the tray.
depends=(
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libusb'
  'libxkbcommon-x11'
  'systemd-libs'
)
optdepends=(
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
  "${_pkgname}-modules.conf"
  "node-hid-${_nodehid}.tgz::https://registry.npmjs.org/node-hid/-/node-hid-${_nodehid}.tgz"
)
noextract=("node-hid-${_nodehid}.tgz")
sha256sums=('acc846c7704fe70420283079e08a91652247030b47e1d702c19181fc4323db18'
            '9eeb9ed4c885c9d03b1f33f8464554cf37d7bceff4c6f3dee4e1efa3d53bb572'
            '8dea2989b3589cf05511199f72d64eedff19367c992d5f21c1343b3fd0e1b854'
            '23916ff2940e03188a34a613e343fc43aaf0067ebb82265ba5d8b46ae2466e82'
            'a6a4700d773e6f9944cad708642864478cd29a7abd42f83d4a1c7125c562fa80')

prepare() {
  local bundled
  bundled="$(sed -n 's/^  "version": "\(.*\)",$/\1/p' "${srcdir}/native-hid/node_modules/node-hid/package.json")"
  if [[ "${bundled}" != "${_nodehid}" ]]; then
    printf 'release bundles node-hid %s, PKGBUILD expects %s\n' "${bundled}" "${_nodehid}" >&2
    return 1
  fi

  # Bridge's self-updater would download each new upstream release and then
  # fail to replace pacman-managed files. Point its release check at the
  # packaged tag instead, so it always reports "Up to date". The new URL is
  # padded with spaces, which URL parsing trims, to the compiled-in length.
  local old='https://api.github.com/repos/OpenMouse-Project/OpenMouse-Bridge/releases/latest'
  local offset
  offset="$(LC_ALL=C grep -a -b -o -F "${old}" "${srcdir}/${_pkgname}" | cut -d: -f1)"
  if [[ ! "${offset}" =~ ^[0-9]+$ ]] || (( ${#_updateurl} > ${#old} )); then
    printf 'cannot patch the update URL: %s must appear exactly once in %s and fit %s\n' \
      "${old}" "${_pkgname}" "${_updateurl}" >&2
    return 1
  fi
  printf '%-*s' "${#old}" "${_updateurl}" |
    dd of="${srcdir}/${_pkgname}" bs=1 seek="${offset}" conv=notrunc status=none
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
    bsdtar -xf "${srcdir}/node-hid-${_nodehid}.tgz" -C "${prebuilds}" \
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
  install -Dm644 "${srcdir}/${_pkgname}-modules.conf" \
    "${pkgdir}/usr/lib/modules-load.d/${_pkgname}.conf"

  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/DM-Sans-OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/DM-Sans-OFL.txt"
}
