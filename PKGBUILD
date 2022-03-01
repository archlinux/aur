# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=dsd-louiserigherve-git
_pkgname="${pkgname%-git}"
pkgver=1.6.0.r111.g5077daf
pkgrel=1
pkgdesc="Decoder for P25 Phase 1, D-STAR, NXDN/IDAS, ProVoice, DMR/MOTOTRBO, X2-TDMA, dPMR (LouisErigHerve's fork)."
arch=('x86_64')
url="https://github.com/LouisErigHerve/dsd"
license=('GPL2' 'ISC')
depends=('gcc-libs' 'glibc' 'itpp' 'libsndfile' 'mbelib' 'portaudio')
makedepends=('cmake' 'git' 'help2man')
provides=("${_pkgname}" 'dsd')
conflicts=("${_pkgname}" 'dsd' 'dsd-git')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s" "$(HOME=/dev/null git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "${_pkgname}"
  cmake -B build ./ \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  sed -i 's|help2man -n|help2man --no-discard-stderr -n|' build/CMakeFiles/dsd.dir/build.make
  make -C build
}

package() {
  cd "${_pkgname}"
  make -C build DESTDIR="${pkgdir}/" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
