# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
pkgname=smf-dsp-git
_pkgname=smf-dsp
pkgver=0.0.0.r283.gf080e27
pkgrel=1
epoch=
pkgdesc="Advanced MIDI file player, including various chip music synths"
arch=('x86_64')
url="https://github.com/jpcima/smf-dsp"
license=('Boost')
groups=()
depends=('sdl2' 'sdl2_image' 'libsoundio' 'jack' 'alsa-lib' 'libuv' 'glib2' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jpcima/smf-dsp.git"
        "git+https://github.com/Wohlstand/libADLMIDI.git"
        "git+https://github.com/Wohlstand/libOPNMIDI.git"
        "git+https://github.com/jpcima/scc.git"
        "git+https://github.com/munt/munt.git"
        "git+https://github.com/divideconcept/FluidLite.git")
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.thirdparty/libADLMIDI.url "$srcdir"/libADLMIDI
  git config submodule.thirdparty/libOPNMIDI.url "$srcdir"/libOPNMIDI
  git config submodule.thirdparty/scc.url "$srcdir"/scc
  git config submodule.thirdparty/munt.url "$srcdir"/munt
  git config submodule.thirdparty/FluidLite.url "$srcdir"/FluidLite
  git submodule update
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  cd ..
  make -C build
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" -C build install
  install -D -m644 LICENSE.md "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE.md
}
