# Maintainer: Your Name <your@email.com>
pkgbase=linux-galaxyaudio
pkgname=(linux-galaxyaudio linux-galaxyaudio-headers)
_pkgname=linux
pkgver=6.12.8
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
sha256sums=('2291da065ca04b715c89ee50362aec3f021a7414bc963f1b56736682c8122979'
            '505d823490e964e66ebe5889a3701347b4e4e2faf1772b3964f0360a176eadf8'
            'cf0b3b2a22fdb6c91d86cb66d8aa419492555a854f547e182241ba62619f14a3')

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
  rm "${modulesdir}"/{source,build}
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
