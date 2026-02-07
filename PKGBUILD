# Maintainer: Your Name <your@email.com>
pkgbase=linux-galaxyaudio
pkgname=(linux-galaxyaudio linux-galaxyaudio-headers)
_pkgname=linux
pkgver=6.18.7
pkgrel=1
pkgdesc='Linux kernel for Samsung Galaxy Book 4 with MAX98390 sound support'
arch=(x86_64)
url="https://github.com/thesofproject/linux/pull/5616"
license=('GPL2')
install=linux-galaxyaudio.install
makedepends=(
  bc kmod libelf cpio perl tar xz
  python
  # standard kernel build deps
  git
)
options=('!strip')
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${pkgver}.tar.xz"
  "config"
  "max98390-sound.patch"
)
sha256sums=('b726a4d15cf9ae06219b56d87820776e34d89fbc137e55fb54a9b9c3015b8f1e'
            '3afa69d43f44a8d88f01080bbf1cee73dab85d8c726714cb08e9f1f33dc8b24c'
            '11d333d7efe10e52dee4c662a6598b4eb689095ed58c0306379ff7855551e9d1')

prepare() {
  cd "${_pkgname}-${pkgver}"

  echo "Setting version..."
  # scripts/setlocalversion --save-scmversion
  echo "-galaxyaudio" > localversion.10-pkgname

  echo "Applying config..."
  cp "${srcdir}/config" .config
  
  echo "Applying patch..."
  patch -p1 -i "${srcdir}/max98390-sound.patch"

  echo "Enabling Galaxy Book 4 Sound Configs..."
  scripts/config --module CONFIG_SND_SOC_MAX98390
  scripts/config --enable CONFIG_SND_HDA_CODEC_REALTEK

  echo "Disabling Debug Info for faster build..."
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_DEBUG_INFO_BTF
  scripts/config --disable CONFIG_DEBUG_INFO_DWARF4
  scripts/config --disable CONFIG_DEBUG_INFO_DWARF5
  scripts/config --disable CONFIG_PAHOLE_HAS_SPLIT_BTF
  scripts/config --disable CONFIG_DEBUG_INFO_BTF_MODULES
  scripts/config --disable CONFIG_SLUB_DEBUG
  scripts/config --disable CONFIG_PM_DEBUG
  # Ensure dependencies are met (I2C, etc normally are)

  make olddefconfig
  
  make -s kernelrelease > version
  echo "Prepared $(cat version)"
}

build() {
  cd "${_pkgname}-${pkgver}"
  make all
}

package_linux-galaxyaudio() {
  pkgdesc="The ${pkgdesc} kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('linux-firmware: firmware images needed for some devices')
  provides=(linux)
  conflicts=(linux)

  cd "${_pkgname}-${pkgver}"
  
  local kernver="$(<version)"
  local modulesdir="${pkgdir}/usr/lib/modules/${kernver}"

  echo "Installing boot image..."
  # systemd-boot / ucode layout or standard /boot?
  # Arch standard: /boot/vmlinuz-linux
  install -Dm644 "$(make -s image_name)" "${pkgdir}/boot/vmlinuz-${pkgbase}"
  
  echo "Installing modules..."
  make INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm -f "${modulesdir}"/{source,build}
}

package_linux-galaxyaudio-headers() {
  pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
  depends=(pahole)

  cd "${_pkgname}-${pkgver}"
  local builddir="${pkgdir}/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "${builddir}" -m644 .config Makefile Module.symvers System.map vmlinux
  install -Dt "${builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${builddir}/arch/x86" -m644 arch/x86/Makefile
  cp -t "${builddir}" -a scripts

  # Required headers
  cp -t "${builddir}" -a include
  cp -t "${builddir}/arch/x86" -a arch/x86/include
  install -Dt "${builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  # .objtool
  install -Dt "${builddir}/tools/objtool" tools/objtool/objtool

  # Clean up
  find "${builddir}" -name '.*' -delete
  
  # Strip scripts
  find "${builddir}/scripts" -type f -perm -u+w -print0 | xargs -0 strip 2>/dev/null || true
}
