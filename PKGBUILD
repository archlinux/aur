# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
_pkgname=bespokesynth
pkgname="$_pkgname"-git
pkgdesc="Software modular synth, VST host input, transport/Ableton Push, and Python scripting"
pkgver=r255.5763dd9
pkgrel=1
arch=(x86_64)
url="https://github.com/awwbees/BespokeSynth"
license=(GPL3)
depends=('jack' 'curl' 'mesa' 'xorg-xrandr' 'python')
makedepends=('gcc' 'libx11' 'libxinerama' 'freetype2' )
checkdepends=()
optdepends=()
provides=('bespokesynth' 'bespokesynth-bin')
conflicts=('bespokesynth' 'bespokesynth-bin')
replaces=()
noextract=()
source=($_pkgname::git+https://github.com/awwbees/BespokeSynth)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$_pkgname"
  sed -i -e 's/JUCE_PLUGINHOST_VST="1"/JUCE_PLUGINHOST_VST="1" JUCE_WEB_BROWSER="0"/'  BespokeSynth.jucer

  export DISPLAY=":98"
  Xvfb $DISPLAY >& Xvfb.log &
  trap "kill $! || true" EXIT
  sleep 10

  Projucer --set-global-search-path linux defaultJuceModulePath /usr/share/juce/modules
  Projucer --resave BespokeSynth.jucer
}

build() {
	cd "$_pkgname"
	# ./configure --prefix=/usr
  cd Builds/LinuxMakefile
  CONFIG=Release make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
