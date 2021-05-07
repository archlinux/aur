# Maintainer: Michael Szafranek <faule.aepfel@gmail.com>

pkgname=stochas
pkgver=1.3.4
pkgrel=2
pkgdesc='randomization enabled step sequencer'
arch=('x86_64')
url="https://surge-synth-team.org/stochas"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('alsa-lib' 'freetype2' 'harfbuzz' 'gcc-libs' 'glibc' 'graphite')
makedepends=('jack' 'cmake')
replaces=('stochas<1.3.4')
_juceversion=6.0.5
#source=("${pkgname}"::"git+https://github.com/surge-synthesizer/stochas.git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/surge-synthesizer/stochas/archive/refs/tags/v${pkgver}.tar.gz"
        "JUCE-${_juceversion}.tar.gz::https://github.com/juce-framework/JUCE/archive/refs/tags/${_juceversion}.tar.gz")
sha512sums=('fc2935d0e1ade8abcbcb0a5e5e03c741f45d2bb03a4f070a40848a9e62b6e877275ae18e68e33bcbca17566435f190a4ca985a09a2e7411ba404e9243382bab8'
            '27a6aef81812b6bdaddacfd77925d75f7b55c95c77ec5e644bc61ab15edf83f505ced4e138aacd50ee5d169b00d66fc0e4f4986b6b19235f37f81d9117cc9786')

prepare() {
  cd "${pkgname}-${pkgver}"

  rmdir lib/JUCE || rm lib/JUCE
  ln -s ../../JUCE-${_juceversion} lib/JUCE
}

build() {
  cd "${pkgname}-${pkgver}"

  cmake -B build
  cmake --build build --target stochas_VST3 --config Release
  cmake --build build --target stochas_Standalone --config Release
}

package() {
    install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/build/stochas_artefacts/VST3/Stochas.vst3/Contents/${CARCH}-linux/Stochas.so" "${pkgdir}/usr/lib/vst3/Stochas.vst3/Contents/${CARCH}-linux/Stochas.so"
    install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/build/stochas_artefacts/Standalone/Stochas" "${pkgdir}/usr/bin/stochas"
}
