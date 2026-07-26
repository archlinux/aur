pkgname=iwlwifi-lar-patched
_pkgbase=linux

_kernelpkgver=7.1.5.arch1-1

_kernver=$(printf '%s\n' "${_kernelpkgver}" | sed 's/\.arch[0-9].*//')
_archrel=$(printf '%s\n' "${_kernelpkgver}" | sed -E "s/^${_kernver}\.(.*)$/\1/" | tr '.' '-')
_krel="${_kernver}-${_archrel}"

pkgver="${_kernver}"
pkgrel=1
pkgdesc="Patched Intel iwlwifi family modules with lar_disable support for Arch Linux kernels"
arch=('x86_64')
url="https://github.com/TenkyuChimata/iwlwifi-lar-patched"
license=('GPL-2.0-only')

depends=(
  "${_pkgbase}=${_kernelpkgver}"
  "${_pkgbase}-headers=${_kernelpkgver}"
  'zstd'
)

optdepends=(
  'mkinitcpio: rebuild initramfs for mkinitcpio-based systems'
  'dracut: rebuild initramfs or UKI for dracut-based systems'
  'systemd: required for kernel-install based workflows'
  'sbctl: re-sign boot artifacts for Secure Boot systems if needed'
)

makedepends=(
  'bc'
  'kmod'
  'patch'
)

source=(
  "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernver}.tar.xz"
  '0001-iwlwifi-add-lar_disable.patch'
  'iwlwifi-lar.conf'
  'dracut-iwlwifi.conf'
)

sha256sums=('22a0196b3cbcdf34dc27b77561f4d040585fd3447edc9ab3531a1ac79e3041e7'
            'da2ab52ccdef2b93088c9e0c56bc1c166bf748d021b529cb2af2ff6c5d9e85cc'
            'd0f468221c28f5f07a040f36df4dcf571d3931eef7ed273d4e57b631ef9540d3'
            '3758f059f40e24561f588829cb80384324d75b0745d5eba6f4b6313b5809e2d1')

install="${pkgname}.install"
options=(!debug)

prepare() {
  cd "${srcdir}/linux-${_kernver}"

  patch -Np1 -i "${srcdir}/0001-iwlwifi-add-lar_disable.patch"

  cd drivers/net/wireless/intel/iwlwifi

  [[ -f dvm/Makefile ]] && sed -i 's|$(srctree)/||g' dvm/Makefile
  [[ -f mvm/Makefile ]] && sed -i 's|$(srctree)/||g' mvm/Makefile
  [[ -f mld/Makefile ]] && sed -i 's|$(srctree)/||g' mld/Makefile
}

build() {
  local builddir="/usr/lib/modules/${_krel}/build"
  local srcsubdir="${srcdir}/linux-${_kernver}/drivers/net/wireless/intel/iwlwifi"

  [[ -d "${builddir}" ]] || {
    echo "ERROR: Missing kernel build directory: ${builddir}"
    echo "Make sure ${_pkgbase}-headers=${_kernelpkgver} is installed."
    return 1
  }

  [[ -d "${srcsubdir}" ]] || {
    echo "ERROR: Missing iwlwifi source directory: ${srcsubdir}"
    return 1
  }

  cd "${srcsubdir}"

  export KBUILD_BUILD_USER='builder'
  export KBUILD_BUILD_HOST='arch'
  export KBUILD_BUILD_VERSION='1'
  export KBUILD_BUILD_TIMESTAMP='1970-01-01'

  make -C "${builddir}" \
    M="$PWD" \
    KBUILD_BUILD_USER="${KBUILD_BUILD_USER}" \
    KBUILD_BUILD_HOST="${KBUILD_BUILD_HOST}" \
    KBUILD_BUILD_VERSION="${KBUILD_BUILD_VERSION}" \
    KBUILD_BUILD_TIMESTAMP="${KBUILD_BUILD_TIMESTAMP}" \
    modules
}

package() {
  local moddir="${pkgdir}/usr/lib/modules/${_krel}/updates/${pkgname}"
  local srcsubdir="${srcdir}/linux-${_kernver}/drivers/net/wireless/intel/iwlwifi"

  install -dm755 "${moddir}"

  install -m644 "${srcsubdir}/iwlwifi.ko" "${moddir}/iwlwifi.ko"
  install -m644 "${srcsubdir}/mvm/iwlmvm.ko" "${moddir}/iwlmvm.ko"

  if [[ -f "${srcsubdir}/dvm/iwldvm.ko" ]]; then
    install -m644 "${srcsubdir}/dvm/iwldvm.ko" "${moddir}/iwldvm.ko"
  fi

  if [[ -f "${srcsubdir}/mld/iwlmld.ko" ]]; then
    install -m644 "${srcsubdir}/mld/iwlmld.ko" "${moddir}/iwlmld.ko"
  fi

  strip --strip-debug "${moddir}/iwlwifi.ko" || true
  strip --strip-debug "${moddir}/iwlmvm.ko" || true

  if [[ -f "${moddir}/iwldvm.ko" ]]; then
    strip --strip-debug "${moddir}/iwldvm.ko" || true
  fi

  if [[ -f "${moddir}/iwlmld.ko" ]]; then
    strip --strip-debug "${moddir}/iwlmld.ko" || true
  fi

  install -Dm644 "${srcdir}/iwlwifi-lar.conf" \
    "${pkgdir}/etc/modprobe.d/iwlwifi-lar.conf"

  install -Dm644 "${srcdir}/dracut-iwlwifi.conf" \
    "${pkgdir}/etc/dracut.conf.d/iwlwifi-lar.conf"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/${pkgname}/kernel-version" <<EOF
${_krel}
EOF
}
