# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>

_pkgbasename=trakmeter
pkgname="${_pkgbasename}-lv2"
pkgver=2.0.0
pkgrel=1
pkgdesc="Loudness meter LV2 plugins for correctly setting up tracking and mixing levels"
arch=('i686' 'x86_64')
url="http://www.mzuther.de/en/software/trakmeter/"
license=('GPL3')
depends=('libxext' 'gcc-libs-multilib' 'freetype2')
makedepends=('premake' 'zip' 'lv2')
source=("${_pkgbasename}::git://github.com/mzuther/traKmeter.git#branch=v2.0.0-gcc6")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgbasename}/Builds"

  # generate build script
  premake4 --cc=gcc --os=linux gmake

  # extract build dependencies juce, juce/lv2
  cd ../libraries
  mv juce/distrho_lv2-*.tar.gz .
  mv juce/juce_*.zip .
  rm -rf juce
  unzip juce_*.zip
  ln -s JUCE-* juce

  tar -xzf distrho_lv2-*.tar.gz
  cp -r modules/* juce/modules/
}

build() {
  cd "${srcdir}/${_pkgbasename}/Builds"

  if [[ $CARCH = "x86_64" ]]; then
    make config=release64 "${_pkgbasename}_lv2_stereo" "${_pkgbasename}_lv2_multi"
  else
    make config=release32 "${_pkgbasename}_lv2_stereo" "${_pkgbasename}_lv2_multi"
  fi
}

package() {
  if [[ $CARCH = "x86_64" ]]; then
    _prefix=_x64
  fi

  cd "${srcdir}/${_pkgbasename}/bin/${_pkgbasename}_lv2${_prefix}"

  # lv2 plugins
  install -d "${pkgdir}/usr/lib/lv2/${_pkgbasename}"
  install -Dm644 manifest.ttl ${_pkgbasename}_{multi,stereo}.ttl -t "${pkgdir}/usr/lib/lv2/${_pkgbasename}"
  install -Dm755 ../${_pkgbasename}_{multi,stereo}_lv2${_prefix}.so -t "${pkgdir}/usr/lib/lv2/${_pkgbasename}"

  # resources
  install -d "${pkgdir}/usr/lib/lv2/${_pkgbasename}/${_pkgbasename}"
  cp -Lpr "../${_pkgbasename}/doc" "${pkgdir}/usr/lib/lv2/${_pkgbasename}/${_pkgbasename}"
  cp -Lpr "../${_pkgbasename}/skins" "${pkgdir}/usr/lib/lv2/${_pkgbasename}/${_pkgbasename}"

  # Create doc link
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cd "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "../../../lib/lv2/${_pkgbasename}/${_pkgbasename}/doc/${_pkgbasename}.pdf"
}
