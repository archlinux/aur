# Maintainer: Torleif Skår <torleif DOT skaar AT gmail.com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>

_pkgname=iverilog
pkgname=${_pkgname}-libvvp-git
pkgver=13.0.r181.gde415b2
pkgrel=1
pkgdesc="Icarus Verilog simulation and synthesis tool - With VVP library support"
arch=('i686' 'x86_64')
_url="https://github.com/steveicarus/iverilog"
url="http://iverilog.icarus.com/"
license=('GPL-2.0-or-later')
depends=(
  'bzip2'
  'bash'
  'zlib'
  'readline'
  'glibc'
  'libstdc++'
  'libgcc'
)
makedepends=(
  'git'
  'autoconf'
  'gperf'
  'make'
  'gcc'
  'bison'
  'flex'
)
provides=(
  "${_pkgname}"
)
options=()
source=("git+${_url}")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Grab the latest 'version' tag and not snapshot tag
  (
    set -o pipefail
    tag=$(git tag --list 'v[0-9]*' --sort=-version:refname | head -n1)
    commits=$(git rev-list --count "${tag}"..HEAD)
    hash=$(git rev-parse --short=7 HEAD)
    version="$(echo ${tag#v} | sed 's/_/./g' - )"
    echo "${version}.r${commits}.g${hash}"
  )
}

build() {
  cd "$srcdir/${_pkgname}"
  sh autoconf.sh
  ./configure --prefix=/usr --enable-libvvp
  make
}

checks() {
  cd "${_pkgname}"
  make check
}

package() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir" make install
}
