# Maintainer:  lmbbrkr <lmbbrkr at protonmail dot ch>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kiril Zyapkov <kiril.zyapkov@gmail.com>

pkgname=dsd-git
_forkname=dsd-louiserigherve
pkgver=1.6.0.r129.gec7018d
pkgrel=1
pkgdesc="Decoder for P25 Phase 1, D-STAR, NXDN/IDAS, ProVoice, DMR/MOTOTRBO, X2-TDMA, dPMR (LouisErigHerve's fork)."
arch=('x86_64')
url="https://github.com/LouisErigHerve/dsd"
license=('GPL2' 'ISC')
depends=('gcc-libs' 'glibc' 'itpp' 'libsndfile' 'mbelib' 'portaudio')
makedepends=('cmake' 'git' 'help2man')
provides=("${_forkname}" 'dsd')
conflicts=("${_forkname}" 'dsd')
source=("${_forkname}::git+${url}")
b2sums=('SKIP')

pkgver() {
  cd "${_forkname}"
  printf "%s" "$(HOME=/dev/null git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "${_forkname}"
  cmake -B build ./ \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  sed -i 's|help2man -n|help2man --no-discard-stderr -n|' build/CMakeFiles/dsd.dir/build.make
  make -C build
}

package() {
  cd "${_forkname}"
  make -C build DESTDIR="${pkgdir}/" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
