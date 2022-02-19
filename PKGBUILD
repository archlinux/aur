# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgname=wii-lua

pkgname=${_pkgname}-git
pkgver=5.1.5.wii.1.r0.g9db4e93
pkgrel=1
pkgdesc="Lua 5.1 for Wii"
arch=("x86_64")
url="https://github.com/carstene1ns/lua51-wii"
license=("MIT")
depends=("devkitPPC" "libogc")
makedepends=("git")
provides=("${pkgname}")
conflicts=("${pkgname}")
options=("!strip") # Binary format is different than expected
source=("${_pkgname}::git+${url}.git"
        "destdir.patch")
sha256sums=("SKIP"
            "a91d768ecbe76f0d01677c184e20cb9c701589bd8a3635161baf719d3cb845d1")

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "${srcdir}"

  # Patch Makefile with DESTDIR support
  patch "${_pkgname}/Makefile" destdir.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Build wii-lua
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install license
  install -Dm0644 COPYRIGHT "${pkgdir}/opt/devkitpro/libogc/licenses/wii-lua-git/COPYRIGHT"

  # Install wii-lua
  make DESTDIR="${pkgdir}" install
}
