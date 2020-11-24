# Maintainer: Alexis Jeandeau <alexis[dot]jeandeau[at]gmail[dot]com>

pkgname=loudgain-git
_gitname=loudgain
pkgver=v0.6.8.r12.g0ff67ee
pkgrel=1
pkgdesc="A loudness normalizer that scans music files and calculates loudness-normalized gain and loudness peak values according to the EBU R128 standard, and can optionally write ReplayGain-compatible metadata."
url="https://github.com/Moonbase59/loudgain"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
depends=('libebur128'
         'ffmpeg'
         'python'
         'taglib')
makedepends=('cmake'
             'git')
provides=('loudgain'
          'rgbpm'
          'rgbpm2')
conflicts=('loudgain')
source=('git+https://github.com/Moonbase59/loudgain')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  cmake ../${_gitname} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
  install -Dm755 "${srcdir}/${_gitname}/bin/rgbpm" ${pkgdir}/usr/bin/
  install -Dm755 "${srcdir}/${_gitname}/bin/rgbpm2" ${pkgdir}/usr/bin/
  # License is BSD 2 clause type and needs to be installed
  install -Dm644 "${srcdir}/${_gitname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
