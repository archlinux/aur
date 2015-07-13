# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=acpi_call-git-dkms
pkgver=1.1.0
pkgrel=2
pkgdesc="kernel module that enables calls to ACPI methods through /proc/acpi/call. e.g. to turn off discrete graphics card in a dual graphics environment (like NVIDIA Optimus)"
arch=('i686' 'x86_64')
url=("http://github.com/mkottman/acpi_call")
license=('GPL')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: needed if using archlinux default kernel'
	    'linux-lts-headers: needed if using the archlinux lts kernel')
provides=('acpi_call-git' 'acpi_call')
install=acpi_call.install
_pkgname="acpi_call"
_gitname="acpi_call"
source=("$_gitname"::'git://github.com/mkottman/acpi_call.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  cd ${srcdir}/acpi_call
  sed -i 's%#include <acpi/acpi.h>%#include <linux/acpi.h>%' acpi_call.c
}

build() {
  warning "Please make sure linux kernel headers are built/installed for the kernel acpi_call will be used with ::"
  warning "example #1: 'pacman -S linux-headers'"
  warning "example #2: 'pacman -S linux-lts-headers'"

  cd ${srcdir}
  
  # create dkms.conf
  cat > dkms.conf <<EOF
PACKAGE_VERSION=${pkgver}
PACKAGE_NAME=${pkgname}
AUTOINSTALL="yes"

MAKE="make KVER=\${kernelver}"
CLEAN="make clean"

BUILT_MODULE_NAME[0]="${_pkgname}"
DEST_MODULE_LOCATION[0]="/extra"
EOF
}

package() {
  cd ${srcdir}

  local usrsrc="${pkgdir}"/usr/src/${_pkgname}-${pkgver}
  local usrshare="${pkgdir}"/usr/share/"${_pkgname}"
  
  install -d "${usrsrc}"
  
  cp ${_gitname}/Makefile "${usrsrc}"
  cp ${_gitname}/*.c "${usrsrc}"
  cp dkms.conf "${usrsrc}"
  
  install -d "${pkgdir}"/usr/share/"${_pkgname}"
  install -d "${pkgdir}"/usr/bin

  cd ${_gitname}
  
  install -Dm755 examples/asus1215n.sh "${usrshare}"
  install -Dm755 examples/dellL702X.sh "${usrshare}"
  install -Dm755 examples/m11xr2.sh "${usrshare}"
  install -Dm755 examples/turn_off_gpu.sh "${usrshare}"
  ln -s /usr/share/"${_pkgname}"/turn_off_gpu.sh "${pkgdir}"/usr/bin/turn_off_gpu.sh
  install -Dm755 support/query_dsdt.pl "${usrshare}"
  cp -R support/windump_hack "${usrshare}"
  install -Dm644 README.md "${usrshare}"

  warning "The following kernel module build procedure *will fail* if your kernel headers are not built/installed!"
}
