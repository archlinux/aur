# Maintainer: 675076143 <675076143@qq.com>
#
# Patch by Zixing Liu that adds FLAG_FORCE_INIT to xpad.c, sending GIP
# (Game Input Protocol) initialization packets (ACK + ANNOUNCE) to Beitong
# KP-series 2.4G gamepads during probing, fixing the firmware's
# OS-detection-based disconnect loop.

pkgname=xpad-beitong-dkms
pkgver=1.0
pkgrel=1
pkgdesc='DKMS module for patched xpad with Beitong KP-series 2.4G gamepad fix'
arch=('any')
url='https://github.com/675076143/xpad-beitong-dkms'
license=('GPL2')
depends=('dkms')
install="${pkgname}.install"
source=(
  'beitong-gip-init.patch'
  'Makefile'
  'dkms.conf'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  local src
  for d in /usr/lib/modules/*/build/drivers/input/joystick; do
    if [[ -f "${d}/xpad.c" ]]; then
      src="${d}/xpad.c"
      break
    elif [[ -f "${d}/xpad.c.zst" ]]; then
      src="${d}/xpad.c.zst"
      break
    fi
  done

  if [[ -z "${src}" ]]; then
    error 'xpad.c not found in any kernel headers'
    error 'Install linux-headers for your running kernel (e.g. linux-headers)'
    exit 1
  fi

  msg2 "Using xpad.c from: ${src}"

  if [[ "${src}" == *.zst ]]; then
    zstd -d -f "${src}" -o "${srcdir}/xpad.c"
  else
    cp "${src}" "${srcdir}/xpad.c"
  fi

  msg2 "Copied xpad.c ($(wc -l < xpad.c) lines)"

  cd "${srcdir}"
  patch -Np0 -i beitong-gip-init.patch
}

build() {
  cd "${srcdir}"

  local running_kernel="$(uname -r)"
  local kdir="/usr/lib/modules/${running_kernel}/build"

  if [[ ! -d "${kdir}" ]]; then
    warning "Kernel build dir not found for ${running_kernel}. DKMS will build at install time."
    return 0
  fi

  msg2 "Building for kernel ${running_kernel}..."
  make -C "${kdir}" M="${srcdir}" LLVM=1 modules
}

package() {
  cd "${srcdir}"
  local dkms_dst="${pkgdir}/usr/src/xpad-beitong-${pkgver}"

  install -Dm644 xpad.c               "${dkms_dst}/xpad.c"
  install -Dm644 beitong-gip-init.patch "${dkms_dst}/beitong-gip-init.patch"
  install -Dm644 Makefile             "${dkms_dst}/Makefile"

  sed "s/@PKGVER@/${pkgver}/g" "${srcdir}/dkms.conf" > "${dkms_dst}/dkms.conf"
  chmod 644 "${dkms_dst}/dkms.conf"

  local running_kernel="$(uname -r)"
  if [[ -f xpad.ko ]]; then
    install -Dm644 xpad.ko "${pkgdir}/usr/lib/modules/${running_kernel}/updates/dkms/xpad.ko"
  fi
}
