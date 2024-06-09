# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=asciify
pkgname=${_pkgname}-git
pkgver=2.0.r7.a981e82
pkgrel=1
pkgdesc="A simple command-line tool to create ASCII art from .png files"
arch=('any')
url="https://github.com/user-simon/asciify"
license=('GPL-3.0-or-later')
makedepends=('git' 'cmake' 'make' 'gcc')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "lodepng::git+https://github.com/lvandeve/lodepng.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s" "$(git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  git config submodule.external/lodepng.url "${srcdir}/lodepng"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
  cd "build"
  cmake ../
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
