# Maintainer: Eric Woudstra <ericwouds@gmail.com>

_pkgbase=chromeos-acpi
_gitver=5.15
pkgname=${_pkgbase}-dkms-git
pkgver=r5.15.20220709092431.652c8a3
pkgrel=1
_gitname="kernel"
_gitroot="https://chromium.googlesource.com/chromiumos/third_party/${_gitname}"
_gitbranch="chromeos-${_gitver}"
pkgdesc="Chromium OS version of the chromeos_acpi module (DKMS), for use with the crossystem tool."
arch=('i686' 'x86_64')
url="https://chromium.googlesource.com/chromiumos/third_party/kernel"
license=('GPL2')
depends=('dkms')

pkgver() {
  cd "${srcdir}/${_gitname}/"
  printf "r%s.%s.%s" "${_gitver}" "$(git show -s --format=%cd --date=format:%Y%m%d%H%M%S HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d "${srcdir}/${_gitname}/" ]]; then
    cd "${srcdir}/${_gitname}/"
    git reset --hard
    git pull --depth=1 origin "${_gitbranch}:${_gitbranch}"
    git sparse-checkout init --cone
    git sparse-checkout set drivers/platform/x86/
    echo
  else
    cd "${srcdir}/"
    git clone --filter=blob:none --sparse --branch "${_gitbranch}" --depth=1 "${_gitroot}" "${srcdir}/${_gitname}/"
    cd "${srcdir}/${_gitname}/"
    git sparse-checkout init --cone
    git sparse-checkout set drivers/platform/x86/
    echo
  fi
}

package() {
  install -vDm644 "${srcdir}/${_gitname}/drivers/platform/x86/chromeos_acpi.c" "${pkgdir}"/usr/src/${_pkgbase}-${_gitver}/chromeos_acpi.c

  cat <<'EOT' | tee -a "${pkgdir}"/usr/src/${_pkgbase}-${_gitver}/chromeos_acpi.c
MODULE_AUTHOR("This is a local copy");
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("ChromeOS specific ACPI extensions, from original ChromiumOS kernel");
EOT

  cat <<'EOT' | tee -a "${pkgdir}"/usr/src/${_pkgbase}-${_gitver}/Makefile
CONFIG_MODULE_SIG=n
obj-m += chromeos_acpi.o
KERNELVERSION ?= $(shell uname -r)
all:
	make -C /lib/modules/$(KERNELVERSION)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(KERNELVERSION)/build M=$(PWD) clean
EOT

  cat <<EOT | tee -a "${pkgdir}"/usr/src/${_pkgbase}-${_gitver}/dkms.conf
PACKAGE_NAME="${_pkgbase}"
PACKAGE_VERSION="${_gitver}"
MAKE[0]="KERNELVERSION=\$kernelver make"
CLEAN="make clean"
BUILT_MODULE_NAME[0]="${_pkgbase/-/_}"
DEST_MODULE_LOCATION[0]="/kernel/drivers/platform/chrome"
AUTOINSTALL="yes"
EOT
}
