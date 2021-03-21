# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-midi-merger
pkgname="${_pkgname}-git"
pkgver=r45.f9ef13a
pkgrel=1
pkgdesc="JACK clients to merge/broadcast MIDI events from/to several in- or outputs (git version)"
arch=('x86_64')
url="https://github.com/moddevices/mod-midi-merger"
license=('ISC')
groups=('pro-audio')
depends=('glibc' 'jack')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/moddevices/mod-midi-merger.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  (
    cd build;
    make DESTDIR="${pkgdir}" PREFIX=/usr install;
    install -Dm755 mod-midi-*-standalone -t "${pkgdir}"/usr/bin;
  )
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
