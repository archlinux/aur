# Maintainer: Lorien Dunn <loriendunn@gmail.com>
# based on Eugene Cherny's PKGBUILD
# builds the develop branch of cabbage against the last JUCE version 5.4.7
pkgname=cabbage
pkgrel=1
pkgver=2.7.0.git
pkgdesc='A framework for audio software development'
arch=('x86_64')
url="http://cabbageaudio.com/"
license=('GPLv3')
makedepends=('zip')
depends=('csound' 'csound-doc' 'steinberg-vst36' 'curl'
        'libx11' 'libxinerama' 'mesa' 'gtk3' 'vim' 'webkit2gtk'
        'freeglut' 'jack' 'libxcomposite' 'libxrandr' 'libxcursor')
conflicts=('cabbage')
provides=('cabbage')
source=('git+https://github.com/rorywalsh/cabbage.git#branch=develop'
        'git+https://github.com/WeAreROLI/JUCE.git#tag=5.4.7'
        'http://cabbageaudio.com/beta/CabbageManual.zip'
        'cabbage.png'
        'Cabbage.desktop'
        'CabbageLite.desktop')
md5sums=('SKIP'
         'SKIP'
         'b7429b59c5ea8c4e7d968278c8afac36'
         'c3c8e35dd46c86f22a3565aa4dd828a8'         
         '35cfc89844c90769f4dc4f8309b340b1'
         'a5c00e068980cb9099bb6fa758f10388' )

prepare() {
  cd "${srcdir}/cabbage"
  #hack to use system vst sdk
  for f in *jucer; do
     sed -i 's@~/SDKs/VST_SDK/VST3_SDK@/usr/include/vst36@g' "$f"
  done
}

build() {
  # Projucer
  sed -i -e "s/JUCER_ENABLE_GPL_MODE 0/JUCER_ENABLE_GPL_MODE 1/" \
            "${srcdir}/JUCE/extras/Projucer/JuceLibraryCode/AppConfig.h"
  cd "${srcdir}/JUCE/extras/Projucer/Builds/LinuxMakefile/"
  make -j4

  # Cabage
  sed -i 's@/usr/share/doc/csound-doc@/usr/share/doc/csound-doc/html@g' "${srcdir}/cabbage/Source/Settings/CabbageSettings.cpp"
  cd "${srcdir}/cabbage/Builds/LinuxMakefile"

 ./buildCabbage

}

package() {
  install -Dm644 "${srcdir}/cabbage.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cabbage.png"
  install -Dm644 "${srcdir}/Cabbage.desktop" "${pkgdir}/usr/share/applications/Cabbage.desktop"
  install -Dm644 "${srcdir}/CabbageLite.desktop" "${pkgdir}/usr/share/applications/CabbageLite.desktop"

  cd "${srcdir}/cabbage/Builds/LinuxMakefile/install/bin"

  for f in Cabbage CabbageLite CabbagePluginEffect.so CabbagePluginSynth.so opcodes.txt; do
    install -Dm755 "$f" "${pkgdir}/usr/bin/$f"
  done

  cd "${srcdir}/cabbage/Builds/LinuxMakefile/install"

  install -d "${pkgdir}/usr/share/doc/cabbage/Examples"
  cp -r Examples/* "${pkgdir}/usr/share/doc/cabbage/Examples/"

  install -d "${pkgdir}/usr/share/cabbage/Themes"
  cp -r "${srcdir}/cabbage/Themes/" "${pkgdir}/usr/share/cabbage/"
  chmod -R 755 "${pkgdir}/usr/share/cabbage/Themes"

  cp -r "${srcdir}/CabbageManual" "${pkgdir}/usr/share/doc/cabbage"
  chmod -R 755 "${pkgdir}/usr/share/doc/cabbage"

}
