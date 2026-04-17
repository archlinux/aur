# Maintainer: PulseSync <contact@pulsesync.dev>

pkgname=pulsesync-bin
pkgver=2.13.0
pkgrel=2
_prefix=builds/app
_branch=beta
pkgdesc="PulseSync desktop app"
arch=('x86_64')
url="https://pulsesync.dev"
license=('custom')
install="${pkgname}.install"
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=('libappindicator-gtk3: tray icon support')
provides=('pulsesync')
conflicts=('pulsesync')
options=('!strip')

_asset_version="${pkgver}-beta"
_asset="pulsesync-app-${_asset_version}-amd64.deb"

source_x86_64=("${_asset}::https://s3.pulsesync.dev/${_prefix}/${_branch}/${_asset}")
sha256sums_x86_64=('645e223e61ee93415bdc8177cb64b496d452fe2c3adb6ae7e7eef96386009c7c')
noextract=("${_asset}")

package() {
  local deb_unpack_dir="${srcdir}/deb-unpack"
  rm -rf "${deb_unpack_dir}"
  mkdir -p "${deb_unpack_dir}"
  bsdtar -xf "${srcdir}/${_asset}" -C "${deb_unpack_dir}"

  local data_tar
  data_tar="$(find "${deb_unpack_dir}" -maxdepth 1 -type f -name 'data.tar.*' | head -n1)"
  if [[ -z "${data_tar}" ]]; then
    echo "data.tar archive not found in ${_asset}" >&2
    exit 1
  fi
  bsdtar -xf "${data_tar}" -C "${pkgdir}"

  # Release .deb artifacts occasionally come through with inconsistent mode bits.
  # Reset the extracted tree to sane defaults and then re-enable only real executables.
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +

  for executable in \
    "${pkgdir}/opt/PulseSync/pulsesync" \
    "${pkgdir}/opt/PulseSync/chrome-sandbox" \
    "${pkgdir}/opt/PulseSync/chrome_crashpad_handler"
  do
    [[ -f "${executable}" ]] && chmod 755 "${executable}"
  done

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/PulseSync/pulsesync" "${pkgdir}/usr/bin/pulsesync"
}
