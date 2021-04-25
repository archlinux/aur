# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

# Global assoc. array of it git hashes of
# thirdparty libs sub-modules at tag for release version
declare -g -A _thirdparty_libs=(
    ['surge-synthesizer;surgesynthteam_tuningui']='0cfaa86484733187af78bc3a48bb89e59e64393f'
    ['surge-synthesizer;tuning-library']='ea580e666e4b0825d7d9e2906407e186e38dd394'
    ['steinbergmedia;vst3sdk']='0908f475f52af56682321192d800ef25d1823dd2'
)

pkgname="dexed"
pkgver=0.9.6
_juce_version=6.0.7
pkgrel=2
pkgdesc="A software synth closely modelled on the Yamaha DX7"
arch=('i686' 'x86_64')
url="http://asb2m10.github.io/dexed/"
license=("GPL3")
groups=('pro-audio' 'vst-plugins')
depends=('hicolor-icon-theme' 'libpng')
makedepends=('alsa-lib' 'curl' 'freetype2' 'jack' 'libx11' 'libxrandr'
             'libxinerama' 'libxcursor')
changelog=ChangeLog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asb2m10/dexed/archive/v${pkgver}.tar.gz"
        "https://github.com/juce-framework/JUCE/releases/download/${_juce_version}/juce-${_juce_version}-linux.zip"
        'dexed.desktop')

# Add thirdparty libs to source array
for _proj in "${!_thirdparty_libs[@]}"; do
  _arr=(${_proj//;/ })
  _vendor=${_arr[0]}
  _lib=${_arr[1]}
  _hash=${_thirdparty_libs[$_proj]}
  source+=("${_lib}-${_hash}.tar.gz::https://github.com/${_vendor}/${_lib}/archive/${_hash}.tar.gz")
done

md5sums=('7dae0fe19ceefed603bef5ccf96140f1'
         '8beda8acb99a1ae7505eed909bd3e7ea'
         'd888f8f2c1a44ed75c77d43faee73361'
         '448948468aeb5a798cd4a12f68b07c03'
         'c8ad413951b5c2adb98ff7fe15bc2db7'
         '059366b39f4f4588aff66fd6b921a2d8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Link thirdparty sources to lib/ dir
  for _proj in "${!_thirdparty_libs[@]}"; do
    _arr=(${_proj//;/ })
    _vendor=${_arr[0]}
    _lib=${_arr[1]}
    _hash=${_thirdparty_libs[$_proj]}

    if [[ -d libs/${_lib} ]]; then
        rmdir libs/${_lib}
    fi

    ln -s "${srcdir}/${_lib}-${_hash}" libs/${_lib}
  done

  mkdir -p assets
  ln -sf "${srcdir}/JUCE" assets
  ./assets/JUCE/Projucer --resave Dexed.jucer
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/Builds/Linux"
  make CONFIG=Release
}

package() {
  depends+=('libasound.so' 'libcurl.so' 'libfreetype.so')
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install VST plugin
  install -Dm755 Builds/Linux/build/Dexed.vst3/Contents/$(uname -m)-linux/Dexed.so \
    -t "${pkgdir}/usr/lib/vst3/Dexed.vst3/Contents/$(uname -m)-linux/"
  # install standalone program
  install -Dm755 Builds/Linux/build/Dexed \
    "${pkgdir}/usr/bin/dexed"

  # install icon and desktop file
  install -Dm755 Resources/ui/dexedIcon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dexed.png"
  install -Dm755 "${srcdir}/dexed.desktop" \
    -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
