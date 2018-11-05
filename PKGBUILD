##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

_gitname=WattmanGTK
# shellcheck disable=SC2034
pkgname=wattman-gtk-git
# shellcheck disable=SC2034
pkgdesc="GTK GUI to view, monitor, and overclock a Radeon GPU on Linux"
# shellcheck disable=SC2034
pkgver=r28.8e3ede6
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
depends=('python-gobject' 'python-matplotlib')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('wattman-gtk')
# shellcheck disable=SC2034
conflicts=('wattman-gtk')
# shellcheck disable=SC2034
license=('GPLv2')
url="https://github.com/BoukeHaarsma23/WattmanGTK"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}" "shim-launcher")
# shellcheck disable=SC2034
sha256sums=('SKIP'
            '070b9a568564f2c1f59261d66e86f4af10de7f86577daa7e9500cfd6e4875daa')

pkgver() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # Copy source files over
  mkdir -p "${pkgdir}/opt/wattman-gtk"
  cp *.py "${pkgdir}/opt/wattman-gtk"
  cp *.ui "${pkgdir}/opt/wattman-gtk"

  # Copy license over
  mkdir -p "${pkgdir}/usr/share/wattman-gtk"
  cp LICENSE "${pkgdir}/usr/share/wattman-gtk"

  # Copy README over
  mkdir -p "${pkgdir}/usr/share/doc/wattman-gtk"
  cp README.md "${pkgdir}/usr/share/doc/wattman-gtk"

  # Copy launcher
  mkdir -p "${pkgdir}/usr/bin"
  cp ../shim-launcher "${pkgdir}/usr/bin/wattman-gtk"

  # Mark executable
  chmod 755 "${pkgdir}/opt/wattman-gtk/wattman.py"
  chmod 755 "${pkgdir}/usr/bin/wattman-gtk"
}
