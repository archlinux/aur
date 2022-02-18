# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgbase=grrlib
_reponame=${_pkgbase^^}

pkgbase=${_pkgbase}-git
pkgname=("ppc-libpngu-git" "wii-${pkgbase}")
pkgver=4.4.1.r14.gc432111
pkgrel=1
pkgdesc="A C/C++ 2D/3D graphics library for Wii application developers"
arch=("x86_64")
url="https://github.com/GRRLIB/${_reponame}"
license=("MIT")
makedepends=("git")
options=("!strip") # Binary format is different than expected
source=("git+${url}.git"
        "libpngu-destdir.patch"
        "grrlib-destdir.patch")
sha256sums=("SKIP"
            "ea3a6147b1f03f6ae4278bc707109bc3386cb64eb1ab57fcb86e6194ff095fda"
            "4deab45ed27a4e287cc3dfc9b64f87b093cf27f3995a7ca5f90c5498c91c0d1f")

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "${srcdir}"

  # Patch Makefiles with DESTDIR support
  patch "${_reponame}/GRRLIB/lib/pngu/Makefile" libpngu-destdir.patch
  patch "${_reponame}/GRRLIB/GRRLIB/Makefile" grrlib-destdir.patch
}

build() {
  cd "${srcdir}/${_reponame}/GRRLIB"

  # Build libpngu and GRRLIB
  for lib in lib/pngu GRRLIB; do
    pushd ${lib} > /dev/null
    make clean all
    popd > /dev/null
  done
}

# NOTE: Must update function name and references manually
package_ppc-libpngu-git() {
  depends=("devkitPPC" "ppc-libpng")
  provides=("ppc-libpngu")

  cd "${srcdir}/${_reponame}"

  # Install license
  install -Dm0644 LICENCE.md "${pkgdir}/opt/devkitpro/portlibs/ppc/licenses/ppc-libpngu-git/LICENCE.md"

  cd GRRLIB/lib/pngu

  make DESTDIR="${pkgdir}" install
}

# NOTE: Must update function name and references manually
package_wii-grrlib-git() {
  depends=("devkitPPC" "libfat-ogc" "ppc-libpngu" "ppc-freetype" "ppc-libjpeg-turbo")
  provides=("wii-${_pkgbase}")

  cd "${srcdir}/${_reponame}"

  # Install license
  install -Dm0644 LICENCE.md "${pkgdir}/opt/devkitpro/portlibs/wii/licenses/wii-${pkgbase}/LICENCE.md"

  cd GRRLIB/GRRLIB

  make DESTDIR="${pkgdir}" install
}
