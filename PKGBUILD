# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=tunefish4
pkgname="${_pkgname}-git"
pkgver=4.1.0.r80.13bd685
pkgrel=1
pkgdesc="An additive wavetable-based synthesizer VST plugin (git version)"
arch=('x86_64')
url="http://www.tunefish-synth.com/"
# See https://github.com/paynebc/tunefish/blob/master/COPYING
license=("GPL3")
groups=('vst-plugins')
depends=('webkit2gtk')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-vst-bin")
source=("${_pkgname}::git://github.com/paynebc/tunefish.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local version="$(git describe --tags | sed -e 's/RELEASE_\([^-]*\).*/\1/;s/_/./g')"
  local revision=$(git rev-list --count HEAD)
  local hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

build() {
  cd "${srcdir}/${_pkgname}/src/tunefish4/Builds/LinuxMakefile/"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/lib/vst/tf4programs"
  install -m755 src/tunefish4/Builds/LinuxMakefile/build/Tunefish4.so \
    "${pkgdir}/usr/lib/vst"
  install -m644 patches/tf4programs/* "${pkgdir}/usr/lib/vst/tf4programs"
}

# vim:set ts=2 sw=2 et:
