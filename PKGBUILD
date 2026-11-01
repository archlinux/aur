# Maintainer: Gergely Imreh <gergely at imreh dot net>

pkgname=particle-cli
pkgdesc='CLI tool for the Particle hardware platform'
pkgver=3.52.4
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
sha256sums=('615ada51720b1343285faf670fb928a0313563726ea286ad2b01b34fdfacf3cd'
            'e04b40c9729b038132a8e421cd2b109ad957fba677ef95da88a8fb43146b3daa')
b2sums=('51992ee28acf227ce72d14ae892e88c00a57a26d92223eec381e09aeef1d743a68223d6ac3034bf32b3efb14c8b63aab2968794c6043fda7c863ef88e7e0e3d1'
        '0178e2c4d8175ebcf9a64dd07fb931fece41795490a7f5be742d79c6be8929d866bed9a9f706535a59c5ab5ddb75595735d125194855b841390d1a19095b86fd')

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
