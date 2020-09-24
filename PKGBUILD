# Maintainer: Milkii Brewster <milkii on Freenode IRC>
_pkgname=bespokesynth
pkgname="$_pkgname"-git
pkgdesc="Software modular synth, VST host input, transport/Ableton Push (unstable)"
pkgver=r311.881cb92
pkgrel=1
arch=(x86_64)
url="https://github.com/awwbees/BespokeSynth"
license=(GPL3)
depends=('jack' 'curl' 'mesa' 'xorg-xrandr' 'python' 'libxext' 'ladspa' 'juce' 'xorg-server-xvfb')
makedepends=('gcc' 'libx11' 'libxinerama' 'freetype2' )
checkdepends=()
optdepends=()
provides=('bespokesynth' 'bespokesynth-bin')
conflicts=('bespokesynth' 'bespokesynth-bin')
replaces=()
noextract=()
source=(BespokeSynth::git+https://github.com/awwbees/BespokeSynth)
md5sums=('SKIP')

pkgver() {
  cd "BespokeSynth"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "BespokeSynth"
  sed -i -e 's/usb-1.0/usb-1.0;python3.8/'  BespokeSynth.jucer
  sed -i -e 's/python-config/python3-config/'  BespokeSynth.jucer
  sed -i -e 's/JUCE_PLUGINHOST_VST="1"/JUCE_PLUGINHOST_VST="1" JUCE_WEB_BROWSER="0"/'  BespokeSynth.jucer

  ### Launch a virtual framebuffer X server ###
  export DISPLAY=":98"
  Xvfb $DISPLAY >& Xvfb.log &
  trap "kill $! || true" EXIT
  sleep 10

  Projucer --set-global-search-path linux defaultJuceModulePath /usr/share/juce/modules
  Projucer --resave BespokeSynth.jucer
}

build() {
  cd "BespokeSynth"
	# ./configure --prefix=/usr
  cd Builds/LinuxMakefile
  CONFIG=Release make
}

package() {
  cd "BespokeSynth"
  mkdir -p ${pkgdir}/usr/bin
  install ${srcdir}/BespokeSynth/Builds/LinuxMakefile/build/BespokeSynth ${pkgdir}/usr/bin/BespokeSynth
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/512x512/apps
  install ${srcdir}/BespokeSynth/bespoke_icon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps
  mkdir -p ${pkgdir}/usr/share/applications/
  install ${srcdir}/BespokeSynth/BespokeSynth.desktop  ${pkgdir}/usr/share/applications/BespokeSynth.desktop
}
