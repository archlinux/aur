# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=hybridreverb2-git
_pkgname=HybridReverb2
pkgver=r12.3a5e6dc
pkgrel=1
epoch=
pkgdesc="Hybrid impulse convolution reverb, available as LV2 and VST"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/HybridReverb2"
license=('GPL')
groups=()
depends=('fftw' 'alsa-lib' 'freetype2' 'libxext')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=('hybridreverb2')
conflicts=('hybridreverb2')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jpcima/$_pkgname.git"
        "http://www2.ika.ruhr-uni-bochum.de/$_pkgname/${_pkgname}_large_database.zip")
noextract=()
sha256sums=('SKIP'
            '55805e9b1c914d3486aec02d0242e3ff92e85b9e24aaa9899be9a3ae562edb4a')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  mkdir -p "$_pkgname"/build
  cd "$_pkgname"/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname/build"
  make DESTDIR="$pkgdir/" install
  unzip -d "$pkgdir"/usr/share/"$_pkgname" "$srcdir"/"$_pkgname"_large_database.zip
}
