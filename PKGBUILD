# Maintainer: Parker Reed <parker.l.reed@gmail.com>

_gitname=WattmanGTK
pkgname=wattman-gtk-git
pkgdesc="GTK GUI to view, monitor, and overclock a Radeon GPU on Linux"
pkgver=r101.6360fab
pkgrel=1
arch=('any')
makedepends=('git' 'python-setuptools')
depends=('python-gobject' 'python-matplotlib' 'python' 'python-cairo')
optdepends=()
provides=('wattman-gtk')
conflicts=('wattman-gtk')
license=('GPLv2')
url="https://github.com/BoukeHaarsma23/WattmanGTK"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}")
# shellcheck disable=SC2034
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}" || {
        msg "Failed to cd into ${srcdir}/${_gitname}"
        return 1
  }

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # Copy license over
  mkdir -p "${pkgdir}/usr/share/wattman-gtk"
  cp LICENSE "${pkgdir}/usr/share/wattman-gtk"

  # Copy README over
  mkdir -p "${pkgdir}/usr/share/doc/wattman-gtk"
  cp README.md "${pkgdir}/usr/share/doc/wattman-gtk"
}
