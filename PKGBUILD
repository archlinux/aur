# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=jc303
pkgname=(
  'jc303-common'
  'jc303-lv2'
  'jc303-vst3'
)
pkgver=0.9.1
pkgrel=1
pkgdesc='TB-303 clone'
arch=('x86_64')
url='https://midilab.co/jc303/'
license=('GPL3' 'MIT')
_common_depends=(
  'glibc'
  'gcc-libs'
  'freetype2'
)
makedepends=(
  "${_common_depends[@]}"
  'git'
  'cmake'
  'libx11'
  'libxrandr'
  'libxinerama'
  'libxcursor'
  'alsa-lib'
  'gtk3'
)
options=('!lto')
_commit='cd26c0a5865b3e2f3e914a444103da11ab1df53e'
_jucecommit='69795dc8e589a9eb5df251b6dd994859bf7b3fab'
source=(
  "$pkgbase::git+https://github.com/midilab/jc303#commit=$_commit"
  "github.com-juce-framework-JUCE::git+https://github.com/juce-framework/JUCE#commit=$_jucecommit"
  'disable-vst2.patch'
)
b2sums=('SKIP'
        'SKIP'
        'e2a6eae17f0cbfe93b1e7fb9a29ac9ce2df6b79f05147a44c66da65739795199bd9170de04e6801b1afe5f928171ee569d8cf8d544013a9ae0fe5a023a409c05')

pkgver() {
  cd "$pkgbase"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgbase"

  # disable VST2
  patch -p1 -i "$srcdir/disable-vst2.patch"
}

build() {
  cmake \
    -B build \
    -S "$pkgbase" \
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON \
    -D FETCHCONTENT_SOURCE_DIR_JUCE="$srcdir/github.com-juce-framework-JUCE"

  cmake --build build
}

package_jc303-common() {
  pkgdesc='Common files for JC303'

  cd "$pkgbase"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" README.md
  cp -vr img "$pkgdir/usr/share/doc/$pkgbase"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgbase" src/dsp/LICENSE
}

package_jc303-lv2() {
  pkgdesc+=' - LV2 plugin'
  groups+=('lv2-plugins')
  depends=(
    "${_common_depends[@]}"
    "jc303-common=$pkgver"
    'lv2-host'
  )

  install -vd "$pkgdir/usr/lib/lv2"
  cp -vr build/JC303_artefacts/LV2/* "$pkgdir/usr/lib/lv2"
}

package_jc303-vst3() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    "jc303-common=$pkgver"
    'vst3-host'
  )

  install -vd "$pkgdir/usr/lib/vst3"
  cp -vr build/JC303_artefacts/VST3/* "$pkgdir/usr/lib/vst3"
}
