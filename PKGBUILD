pkgname=linux-wireless-reg-unlocked
_pkgbase=linux

_kernelpkgver=7.2.3.arch1-3

_kernver="$(
  printf '%s\n' "${_kernelpkgver}" |
    sed 's/\.arch[0-9].*//'
)"

_archrel="$(
  printf '%s\n' "${_kernelpkgver}" |
    sed -E "s/^${_kernver}\.(.*)$/\1/" |
    tr '.' '-'
)"

_kernelmajor="${_kernver%%.*}"
_krel="${_kernver}-${_archrel}"

pkgver="${_kernver}"
pkgrel=2

pkgdesc="Research-only patched iwlwifi and cfg80211 modules with modified wireless regulatory behavior for Arch Linux"
arch=('x86_64')
url="https://github.com/TenkyuChimata/linux-wireless-reg-unlocked"
license=('GPL-2.0-only')

depends=(
  "${_pkgbase}=${_kernelpkgver}"
  "${_pkgbase}-headers=${_kernelpkgver}"
  'zstd'
)

makedepends=(
  'bc'
  'kmod'
  'patch'
)

optdepends=(
  'mkinitcpio: rebuild initramfs for mkinitcpio-based systems'
  'dracut: rebuild initramfs or UKI for dracut-based systems'
  'systemd: required for kernel-install based workflows'
  'sbctl: re-sign boot artifacts for Secure Boot systems if needed'
)

conflicts=(
  'iwlwifi-lar-patched'
)

source=(
  "https://cdn.kernel.org/pub/linux/kernel/v${_kernelmajor}.x/linux-${_kernver}.tar.xz"
  '0001-iwlwifi-add-lar_disable.patch'
  '0002-iwlwifi-nvm-unlock-6ghz-and-relax-channel-flags.patch'
  '0003-cfg80211-allow-unsigned-regdb-and-reject-driver-country-ie-regdom-hints.patch'
  'iwlwifi-lar.conf'
  'dracut-wireless-reg-unlocked.conf'
)

sha256sums=('8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03'
            'da2ab52ccdef2b93088c9e0c56bc1c166bf748d021b529cb2af2ff6c5d9e85cc'
            '96f91b3ff8d5caafe4939cb22bb455d34d107d08e14cf3af6dbb47ef70553732'
            'e8574dead1cb1f2b3732b0daeffa5bb9d71e1cc8eee5203348bbe9169c5adbe6'
            'd0f468221c28f5f07a040f36df4dcf571d3931eef7ed273d4e57b631ef9540d3'
            '3758f059f40e24561f588829cb80384324d75b0745d5eba6f4b6313b5809e2d1')

install="${pkgname}.install"
options=(!debug)

prepare() {
  cd "${srcdir}/linux-${_kernver}"

  patch -Np1 \
    -i "${srcdir}/0001-iwlwifi-add-lar_disable.patch"

  patch -Np1 \
    -i "${srcdir}/0002-iwlwifi-nvm-unlock-6ghz-and-relax-channel-flags.patch"

  patch -Np1 \
    -i "${srcdir}/0003-cfg80211-allow-unsigned-regdb-and-reject-driver-country-ie-regdom-hints.patch"

  if [[ -f drivers/net/wireless/intel/iwlwifi/dvm/Makefile ]]; then
    sed -i \
      's|$(srctree)/||g' \
      drivers/net/wireless/intel/iwlwifi/dvm/Makefile
  fi

  if [[ -f drivers/net/wireless/intel/iwlwifi/mvm/Makefile ]]; then
    sed -i \
      's|$(srctree)/||g' \
      drivers/net/wireless/intel/iwlwifi/mvm/Makefile
  fi

  if [[ -f drivers/net/wireless/intel/iwlwifi/mld/Makefile ]]; then
    sed -i \
      's|$(srctree)/||g' \
      drivers/net/wireless/intel/iwlwifi/mld/Makefile
  fi
}

build() {
  local builddir="/usr/lib/modules/${_krel}/build"
  local iwlsrc="${srcdir}/linux-${_kernver}/drivers/net/wireless/intel/iwlwifi"
  local cfgsrc="${srcdir}/linux-${_kernver}/net/wireless"

  [[ -d "${builddir}" ]] || {
    echo "ERROR: Missing kernel build directory: ${builddir}"
    echo "Make sure ${_pkgbase}-headers=${_kernelpkgver} is installed."
    return 1
  }

  [[ -d "${iwlsrc}" ]] || {
    echo "ERROR: Missing iwlwifi source directory: ${iwlsrc}"
    return 1
  }

  [[ -d "${cfgsrc}" ]] || {
    echo "ERROR: Missing cfg80211 source directory: ${cfgsrc}"
    return 1
  }

  export KBUILD_BUILD_USER='builder'
  export KBUILD_BUILD_HOST='arch'
  export KBUILD_BUILD_VERSION='1'
  export KBUILD_BUILD_TIMESTAMP='1970-01-01'

  make -C "${builddir}" \
    M="${iwlsrc}" \
    KBUILD_BUILD_USER="${KBUILD_BUILD_USER}" \
    KBUILD_BUILD_HOST="${KBUILD_BUILD_HOST}" \
    KBUILD_BUILD_VERSION="${KBUILD_BUILD_VERSION}" \
    KBUILD_BUILD_TIMESTAMP="${KBUILD_BUILD_TIMESTAMP}" \
    modules

  make -C "${builddir}" \
    M="${cfgsrc}" \
    KBUILD_BUILD_USER="${KBUILD_BUILD_USER}" \
    KBUILD_BUILD_HOST="${KBUILD_BUILD_HOST}" \
    KBUILD_BUILD_VERSION="${KBUILD_BUILD_VERSION}" \
    KBUILD_BUILD_TIMESTAMP="${KBUILD_BUILD_TIMESTAMP}" \
    modules
}

package() {
  local moddir="${pkgdir}/usr/lib/modules/${_krel}/updates/${pkgname}"
  local iwlsrc="${srcdir}/linux-${_kernver}/drivers/net/wireless/intel/iwlwifi"
  local cfgsrc="${srcdir}/linux-${_kernver}/net/wireless"

  install -dm755 "${moddir}"

  # Intel wireless core modules
  install -m644 \
    "${iwlsrc}/iwlwifi.ko" \
    "${moddir}/iwlwifi.ko"

  install -m644 \
    "${iwlsrc}/mvm/iwlmvm.ko" \
    "${moddir}/iwlmvm.ko"

  if [[ -f "${iwlsrc}/dvm/iwldvm.ko" ]]; then
    install -m644 \
      "${iwlsrc}/dvm/iwldvm.ko" \
      "${moddir}/iwldvm.ko"
  fi

  if [[ -f "${iwlsrc}/mld/iwlmld.ko" ]]; then
    install -m644 \
      "${iwlsrc}/mld/iwlmld.ko" \
      "${moddir}/iwlmld.ko"
  fi

  # Patched cfg80211
  install -m644 \
    "${cfgsrc}/cfg80211.ko" \
    "${moddir}/cfg80211.ko"

  # Strip debug symbols
  strip --strip-debug "${moddir}/iwlwifi.ko" || true
  strip --strip-debug "${moddir}/iwlmvm.ko" || true
  strip --strip-debug "${moddir}/cfg80211.ko" || true

  if [[ -f "${moddir}/iwldvm.ko" ]]; then
    strip --strip-debug "${moddir}/iwldvm.ko" || true
  fi

  if [[ -f "${moddir}/iwlmld.ko" ]]; then
    strip --strip-debug "${moddir}/iwlmld.ko" || true
  fi

  install -Dm644 \
    "${srcdir}/iwlwifi-lar.conf" \
    "${pkgdir}/etc/modprobe.d/iwlwifi-lar.conf"

  install -Dm644 \
    "${srcdir}/dracut-wireless-reg-unlocked.conf" \
    "${pkgdir}/etc/dracut.conf.d/wireless-reg-unlocked.conf"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/${pkgname}/kernel-version" <<EOF
${_krel}
EOF
}
