# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>

_pkgbasename=trakmeter
pkgname="${_pkgbasename}-lv2"
pkgver=2.4.6
pkgrel=1
pkgdesc="Loudness meter LV2 plugins for correctly setting up tracking and mixing levels"
arch=('i686' 'x86_64')
url="http://www.mzuther.de/en/software/trakmeter/"
license=('GPL3')
depends=('libxext' 'freetype2')
makedepends=('premake' 'zip' 'lv2')
source=("${_pkgbasename}::git://github.com/mzuther/traKmeter.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgbasename}/libraries"

  # extract build dependencies juce and distrho
  rm -rf juce
  unzip juce_*.zip
  ln -s JUCE-* juce

  mv distrho_lv2-*.tar.gz distrho_lv2.tar.gz
  tar -xzf distrho_lv2.tar.gz
  cd distrho_lv2-*
  cp -r modules/* ../juce/modules/
}

build() {
  cd "${srcdir}/${_pkgbasename}/Builds/linux/gmake"

  if [[ $CARCH = "x86_64" ]]; then
    make config=release_x64 "${_pkgbasename}_lv2_stereo" "${_pkgbasename}_lv2_multi"
  else
    make config=release_x32 "${_pkgbasename}_lv2_stereo" "${_pkgbasename}_lv2_multi"
  fi
}

package() {
  if [[ $CARCH = "x86_64" ]]; then
    _prefix=_x64
  fi

  # lv2 plugins
  cd "${srcdir}/${_pkgbasename}/bin/lv2/${_pkgbasename}_lv2${_prefix}"
  install -d "${pkgdir}/usr/lib/lv2/${_pkgbasename}"
  install -Dm644 manifest.ttl ${_pkgbasename}_{multi,stereo}.ttl -t "${pkgdir}/usr/lib/lv2/${_pkgbasename}"
  install -Dm755 ../${_pkgbasename}_{multi,stereo}_lv2${_prefix}.so -t "${pkgdir}/usr/lib/lv2/${_pkgbasename}"

  # resources
  cd "${srcdir}/${_pkgbasename}"
  install -d "${pkgdir}/usr/lib/lv2/${_pkgbasename}/${_pkgbasename}"
  cp -Lpr "doc" "${pkgdir}/usr/lib/lv2/${_pkgbasename}/${_pkgbasename}"
  cp -Lpr "skins" "${pkgdir}/usr/lib/lv2/${_pkgbasename}/${_pkgbasename}"

  # Create doc link
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cd "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "../../../lib/lv2/${_pkgbasename}/${_pkgbasename}/doc/${_pkgbasename}.pdf"
}
