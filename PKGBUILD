# Maintainer: Eric Woudstra <ericwouds@gmail.com>

_gitname=vboot_reference
_gitroot="https://chromium.googlesource.com/chromiumos/platform/${_gitname}"
_gitbranch="main"
pkgname=("chromeos-vboot-reference-git" "chromeos-vboot-reference-crossystem-git") 
url="https://chromium.googlesource.com/chromiumos/platform/${_gitname}"
license=('GPL')
makedepends=('git' 'libyaml' 'chromeos-flashrom-git')
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=r20221126105520.e952b90
pkgrel=2

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
  export CFLAGS+=" -Wno-error=deprecated-declarations"  # Skip deprecated: Since OpenSSL 3.0
  # install_for_test also builds crossystem
  make TEST_INSTALL_DIR=../build install_for_test
}

package_chromeos-vboot-reference-git() {
  pkgdesc="ChromeOS vbutil tools: futility (vbutil_kernel) cgpt from git."
  depends=('libutil-linux' 'openssl')
  conflicts=("vboot-utils")
  provides=("vboot-utils")

  cd "${srcdir}/build"
  install -m755 -vDt $pkgdir/usr/bin usr/bin/cgpt
  install -m755 -vDt $pkgdir/usr/bin usr/bin/futility
  find etc -type f -exec install -vDm 755 "{}" "${pkgdir}/{}" \;
  cd "${srcdir}/${_gitname}/tests/"
  find devkeys -maxdepth 1 -type f -exec install -vDm 755 "{}" "${pkgdir}/usr/share/vboot/{}" \;
}

package_chromeos-vboot-reference-crossystem-git() {
  pkgdesc="ChromeOS vbutil tools: crossystem from git, in experimental phase."
  depends=('libutil-linux' 'openssl' 'chromeos-flashrom-git' 'chromeos-acpi-dkms-git')

  cd "${srcdir}/build"
  install -m755 -vDt $pkgdir/usr/bin usr/bin/crossystem
}

