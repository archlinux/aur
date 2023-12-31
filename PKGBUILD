# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Old Maintainer:Lubosz Sarnecki <lubosz@gmail.com>
# Old Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>

_py=python
_pkg=cairo
_Pkg="py${_pkg}"
_pkgname="${_py}-${_pkg}"
pkgname="${_py}-${_pkg}-git"
pkgver=1.25.0.r21.ge44fe88
pkgrel=2
pkgdesc="Python bindings for the cairo graphics library. Git version."
url="http://www.${_pkg}graphics.org/"
_ns="pygobject"
_url="https://github.com/${_ns}/${_Pkg}"
arch=(
  'arm'
  'armv7h'
  'aarch64'
  'powerpc'
  'i686'
  'x86_64')
license=(
    'LGPL3')
depends=(
    "${_py}"
    "${_pkg}>=1.12")
makedepends=(
  'git'
  'pkg-config'
  "${_py}-setuptools")
options=(
  '!libtool')
provides=(
  "${_pkgname}=1.20.0"
  "${_Pkg}=1.20.0")
conflicts=(
  "${_pkgname}"
  "${_Pkg}")
source=(
  "${_pkgname}::git+${_url}")
sha256sums=(
  'SKIP')
 
pkgver() {
  cd \
    "${srcdir}/${_pkgname}"
  git \
    describe \
    --long \
    --tags | \
    sed \
      's/\([^-]*-g\)/r\1/;s/-/./g' | \
      cut \
        -c2-48
}
 
package() {
  cd \
    "${srcdir}/${_pkgname}"
  local \
    _cflags=()
  _cflags=(
    "-I$( \
       dirname \
         "$(cc \
              -v 2>&1 |
              grep \
                "InstalledDir" | \
                awk '{print $2}')")/include/cairo"
    "${CFLAGS}"
  )
  CFLAGS="${_cflags[*]}" \
    "${_py}" \
      setup.py \
      install \
      --root="${pkgdir}" \
      --optimize=1
}

# vim:set sw=2 sts=-1 et:

