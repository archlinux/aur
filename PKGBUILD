# Maintainer: Gergely Imreh <gergely at imreh dot net>

pkgname=particle-cli
pkgdesc='CLI tool for the Particle hardware platform'
pkgver=3.52.5
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://www.particle.io/'
# particle-cli itself is Apache-2.0; the rest cover the bundled node_modules
# (including the libusb built into the usb module)
license=('Apache-2.0 AND MIT AND ISC AND BSD-2-Clause AND BSD-3-Clause AND LGPL-2.1-or-later')
depends=('libusb' 'systemd-libs' 'nodejs>=22.20' 'libxml2-legacy')
makedepends=('npm')
optdepends=('dfu-util: local flashing')
# The npm tarball ships without a lockfile, so take upstream's from the release tag
source=("https://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz"
        "${pkgname}-${pkgver}-npm-shrinkwrap.json::https://raw.githubusercontent.com/particle-iot/particle-cli/v${pkgver}/npm-shrinkwrap.json")
noextract=(${pkgname}-${pkgver}.tgz)
options=(!debug !strip)
sha256sums=('3eea3294915ecbd1c1e2bb1d274d496c3b78cf838ec318e61857b1818bdc9ffd'
            '09a4c297cfb3b79b3c06c6455e34da6322e1c331a93d43f87b99035b317fe8c5')
b2sums=('90989336b1bd7a28b44ccf479ce46675ddfb91296fd5c3b83c872b061769e1211bd5e94dde56498c782eec1663d03ac2db841f8373b4d07a854962fbd9df56e5'
        'c9a41f300016ef1c5c6b79df81f106e1b4afe747cd67a62be11289d4a5ac02debea8508095f3ef184662c0211de6279c9650832f019240ebe2b4994622408bb0')

prepare() {
  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -xf "${pkgname}-${pkgver}.tgz" -C "${pkgname}-${pkgver}" --strip-components 1
  # npm ci does not pick up npm-shrinkwrap.json, so provide it as package-lock.json
  cp "${pkgname}-${pkgver}-npm-shrinkwrap.json" "${pkgname}-${pkgver}/package-lock.json"
}

build() {
  cd "${pkgname}-${pkgver}"
  # Install exactly the dependency versions pinned by upstream; the native
  # modules load their prebuilt binaries at runtime, so no install scripts needed
  npm ci --omit=dev --ignore-scripts --no-audit --no-fund --cache "${srcdir}/npm-cache"
}

package() {
  local _nm="${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -d "${pkgdir}/usr/lib/node_modules" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/${pkgname}-${pkgver}" "${_nm}"
  ln -s "../lib/node_modules/${pkgname}/src/index.js" "${pkgdir}/usr/bin/particle"

  sed -i 's|, GROUP="plugdev", MODE="0666"|, TAG+="uaccess"|g' "${_nm}/assets/50-particle.rules"
  install -D -m644 "${_nm}/assets/50-particle.rules" "${pkgdir}/usr/lib/udev/rules.d/50-particle.rules"
  find "$pkgdir" -type d -name .deps -prune -exec rm -rf {} +

  # Remove unsupported architectures
  rm -rf "${_nm}/assets/qdl/darwin"
  rm -rf "${_nm}/assets/qdl/win32"

  # Keep only the native binaries matching the build architecture
  local _arch
  case "${CARCH}" in
    x86_64)  _arch=x64 ;;
    aarch64) _arch=arm64 ;;
  esac
  find "${_nm}/node_modules" -type d -path '*/prebuilds/*' -prune ! -name "linux-${_arch}" -exec rm -rf {} +
  find "${_nm}/node_modules" -path '*/prebuilds/*' -name '*musl*' -delete
  find "${_nm}/assets/qdl/linux" -mindepth 1 -maxdepth 1 ! -name "${_arch}" -exec rm -rf {} +

  # Remove bundled libusb to make use of the system one
  rm "${_nm}/assets/qdl/linux/${_arch}/libusb-1.0.so.0"

  # Link the license files of the bundled modules
  local _lic="${pkgdir}/usr/share/licenses/${pkgname}" _f
  install -d "${_lic}"
  while IFS= read -r -d '' _f; do
    ln -s "/usr/lib/node_modules/${pkgname}/node_modules/${_f}" "${_lic}/${_f//\//_}"
  done < <(find "${_nm}/node_modules" -type f -iname 'licen[cs]e*' -printf '%P\0')
}
