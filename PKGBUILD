# Maintainer: Milk Brewster <aur@milkmiruku.com>

_pkgname=helio-workstation
pkgname="${_pkgname}-git"
pkgver=r643.24e031d
pkgrel=1
pkgdesc="A high-performance MIDI sequencer with a clean interface, version control, VST support and more"
arch=('x86_64')
url="https://helioworkstation.com/"
license=('GPL3')
depends=('freetype2' 'libx11' 'libxinerama' 'libxrandr' 'libxcursor' 'libxcomposite' 'mesa' 'freeglut' 'curl'
         'alsa-lib' 'jack' 'asio' 'steinberg-vst36')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/helio-fm/helio-workstation.git"
        "git+https://github.com/WeAreROLI/JUCE.git"
        "git+https://github.com/greg7mdp/sparsepp.git")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"

  # Git, tags available
  # printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  git submodule init
  git config submodule.JUCE.url "$srcdir"/ThirdParty/JUCE
  git config submodule.sparsepp.url "$srcdir"/ThirdParty/SparseHashMap
  git submodule update
  
  cd "$srcdir/${_pkgname}/Projects/LinuxMakefile"
  make check-pkg-config
}

build() {
  cd "$srcdir/${_pkgname}/Projects/LinuxMakefile"
  export CONFIG=Release64
  make
}

package() {
  cd "$srcdir/${_pkgname}/Projects/"
  install -Dm755 "LinuxMakefile/build/Helio" "$pkgdir/usr/bin/helio_workstation"
}
