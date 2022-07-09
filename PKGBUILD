# Maintainer: Eric Woudstra <ericwouds@gmail.com>

_gitname=vboot_reference
_gitroot="https://chromium.googlesource.com/chromiumos/platform/${_gitname}"
_gitbranch="main"
pkgname="chromeos-${_gitname/_/-}-git"
pkgdesc="ChromeOS vbutil tools: futility (vbutil_kernel) cgpt and experimental crossystem from git."
url="https://chromium.googlesource.com/chromiumos/platform/${_gitname}"
license=('GPL')
depends=('libutil-linux' 'openssl' 'chromeos-flashrom-git' 'chromeos-acpi-dkms-git')
makedepends=('git' 'libyaml')
optdepends=("dmidecode: for SMBIOS/DMI table decoder support")
conflicts=("vboot-utils")
provides=("vboot-utils")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=r20220709115837.78a0e6c
pkgrel=1

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git show -s --format=%cd --date=format:%Y%m%d%H%M%S HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  if [[ -d "${srcdir}/${_gitname}/" ]]; then
    cd "${srcdir}/${_gitname}/"
    git reset --hard
    git pull --depth=1 origin "${_gitbranch}:${_gitbranch}"
    git checkout "${_gitbranch}"
    echo
  else
    cd "${srcdir}/"
    git clone --branch "${_gitbranch}" --depth=1 "${_gitroot}" "${srcdir}/${_gitname}/"
    echo
  fi
}

build() {
  cd "${srcdir}/${_gitname}"
  sed -i 's/TEST_NAMES += ${TLCL_TEST_NAMES}/TEST_NAMES =/' ./Makefile
  # install_for_test also builds crossystem
  make TEST_INSTALL_DIR=../build install_for_test
}

package() {
  cd "${srcdir}/build"
  find usr -type f -exec install -vDm 755 "{}" "${pkgdir}/{}" \;
  find etc -type f -exec install -vDm 755 "{}" "${pkgdir}/{}" \;
  cd "${srcdir}/${_gitname}/tests/"
  find devkeys -maxdepth 1 -type f -exec install -vDm 755 "{}" "${pkgdir}/usr/share/vboot/{}" \;
}

