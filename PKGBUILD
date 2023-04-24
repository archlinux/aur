# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=tunefish4
pkgname="${_pkgname}-git"
pkgver=4.3.0.r107.7e48ce8
pkgrel=1
pkgdesc='An additive wavetable-based synthesizer VST plugin (git version)'
arch=(x86_64)
url="https://www.tunefish-synth.com/"
# See https://github.com/paynebc/tunefish/blob/master/COPYING
license=(GPL3)
groups=(vst-plugins)
depends=(webkit2gtk)
makedepends=(git vst2sdk)
provides=($_pkgname)
conflicts=($_pkgname "${_pkgname}-vst-bin")
source=("$_pkgname::git+https://github.com/paynebc/tunefish.git"
        'juce-pixel.patch')
sha256sums=('SKIP'
            'c0b274515dadd14b530c35517d6fb3749b861344cec90c12eef965c9bca3e479')


pkgver() {
  cd $_pkgname
  #local version="$(git describe --tags | sed -e 's/RELEASE_\([^-]*\).*/\1/;s/_/./g')"
  local version="$(cat VERSION_TF4)"
  local revision=$(git rev-list --count HEAD)
  local hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

prepare() {
  cd $_pkgname
  echo "Patching JUCE graphics..."
  patch -p1 -N -r - -i "${srcdir}/juce-pixel.patch" | :
}

build() {
  cd $_pkgname/src/tunefish4/Builds/LinuxMakefile

  export CPPFLAGS="$CPPFLAGS -I/usr/include/vst36"
  make
}

package() {
  cd $_pkgname

  install -Dm755 src/tunefish4/Builds/LinuxMakefile/build/Tunefish4.so \
    -t "$pkgdir"/usr/lib/vst
  install -Dm644 patches/tf4programs/* \
    -t "$pkgdir"/usr/lib/vst/tf4programs
}

# vim:set ts=2 sw=2 et:
