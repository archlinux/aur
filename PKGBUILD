# Maintainer: Milkii Brewster <milkii on Freenode IRC>
# Contributor: Christopher Arndt <aur -at chrisarndt -dot- de>

_pkgname=midi-trigger.lv2
pkgname="${_pkgname}-git"
pkgdesc="LV2 plugin which generates MIDI notes from detected audio signal peaks."
pkgver=v0.0.3.r2.g83c4ad6
pkgrel=2
arch=('x86_64')
url="https://github.com/metachronica/audio-dsp-midi-trigger"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'lv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/metachronica/audio-dsp-midi-trigger")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i \
    -e 's/all: clean/all:/' \
    -e 's/mkdir/mkdir -p/g;s/--parent//;' \
    -e 's/CXX_FLAGS = /CXX_FLAGS = $(CXXFLAGS) /' \
    -e 's/LIBS = /LIBS = $(LDFLAGS) /' \
    Makefile
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 build/*.so -t \
    "${pkgdir}"/usr/lib/lv2/midi-trigger.lv2
  install -Dm755 *.ttl -t \
    "${pkgdir}"/usr/lib/lv2/midi-trigger.lv2
  install -Dm755 README.md -t \
    "${pkgdir}"/usr/share/doc/${pkgname}
}
