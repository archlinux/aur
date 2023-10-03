# packaged version of https://gitlab.com/Cl00e9ment/kicad-wayland-build-script
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Marq Schneider <queueRAM@gmail.com>
# Contributor: Nick Østergaard
# Contributor: Rachel Mant <aur@dragonmux.network>
# Contributor: Kyle Keen <keenerd@gmail.com>

_appname=kicad
pkgname="$_appname-wayland"
pkgver=7.0.8
pkgrel=1
pkgdesc='Electronic schematic and printed circuit board (PCB) design tools, patched for Wayland'
arch=('x86_64')
url='http://kicad.org/'
license=('GPL')
depends=(
  'boost-libs'
  'curl'
  'glew'
  'glm'
  'ngspice'
  'opencascade'
  'python'
  'python-wxpython'
  'wxwidgets-gtk3'
  'unixodbc'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'mesa'
  'boost'
  'swig'
)
optdepends=(
  'kicad-library: for footprints, symbols and templates'
  'kicad-library-3d: for 3D models of components'
)
provides=("$_appname")
conflicts=("$_appname")
_commit='063d9c830514d46de163bd0ae2bb1df66309f11e'
source=(
  "$_appname::git+https://gitlab.com/kicad/code/kicad.git#commit=$_commit"
  'fix-archive-permissions.patch'
  'fix-version-string.patch'
  'make-kicad-work-in-native-wayland.patch'
)
sha512sums=('SKIP'
            'e36912e4144c6debe33f1711ca7a2da020389a6e376282c70f534ce9e685d0b35b58d88b810327d8baeb3466e87eda246ebf181c18e134e80bc73b91dae4bf02'
            '17100967610c85ce2e8a860dcf703a87dc0c20f52d3f056cdb5d16323160e8594698bd51e095aea63c00a75ce8b121be681e93cec1bab72a8d1d4eb8065a91f5'
            'b68da61ececf8d7a5853f6f954a78474ae73f2213b770e15a7f18c294876013ea1499aac7fb54bd8f7b52aebd5b88dbb8678f45c548e006e733a44ab4c614882')
b2sums=()

pkgver() {
  cd "$_appname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$_appname"

  patch -p1 -i "$srcdir/fix-archive-permissions.patch"
  patch -p1 -i "$srcdir/fix-version-string.patch"
  patch -p1 -i "$srcdir/make-kicad-work-in-native-wayland.patch"
}

build() {
  cmake \
    -B build \
    -S "$_appname" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D KICAD_USE_OCE=ON \
    -D KICAD_USE_EGL=ON \
    -D KICAD_BUILD_I18N=ON \
    -D KICAD_I18N_UNIX_STRICT_PATH=ON \
    -D KICAD_BUILD_QA_TESTS=OFF \
    -W no-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  strip "$STRIP_SHARED" "${pkgdir}"/usr/lib/python*/site-packages/_pcbnew.so
}

# vim:set ts=2 sw=2 et:
