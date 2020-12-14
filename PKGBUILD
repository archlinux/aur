# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: fatalis <fatalis@fatalis.pw>

pkgname=scream-git
_pkgname=scream
pkgver=3.6.r138.c1d5aef
pkgrel=1
pkgdesc='A Scream audio receiver using Pulseaudio, ALSA, JACK or stdout as audio output (git version)'
arch=('x86_64')
provides=('scream' 'scream-pulse' 'scream-ivshmem-pulse' 'scream-alsa' 'scream-ivshmem-alsa')
depends=('libpulse' 'alsa-lib')
makedepends=('cmake' 'jack')
conflicts=('scream' 'scream-pulse' 'scream-alsa')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=('git+https://github.com/duncanthrax/scream.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${_pkgname}
    printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/Receivers/unix"
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/Receivers/unix"
  install -d "${pkgdir}/usr/bin"
  install build/${_pkgname} "${pkgdir}/usr/bin"

  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
