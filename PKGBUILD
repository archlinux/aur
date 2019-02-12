# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=hybridreverb2-git
_pkgname=HybridReverb2
pkgver=r92.6beac8e
_rirver=1.0.0
pkgrel=1
epoch=
pkgdesc="Hybrid impulse convolution reverb, available as LV2 and VST"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/HybridReverb2"
license=('GPL')
groups=()
depends=('fftw' 'jack' 'freetype2' 'libxext' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'unzip' 'libxrandr' 'libxinerama' 'libxcursor')
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
        "git+https://github.com/jpcima/JUCE.git"
        "RIR-$_rirver.zip::https://github.com/jpcima/HybridReverb2-impulse-response-database/archive/v$_rirver.zip")
noextract=("RIR-$_rirver.zip")
sha256sums=('SKIP'
            'SKIP'
            '8ada57a590e6b04c272312874c67656ccf7e3de71b2cc7dbaadf53880fb77fd7')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.Thirdparty/JUCE.url "$srcdir"/JUCE
  git submodule update
}

build() {
  mkdir -p "$_pkgname"/build
  cd "$_pkgname"/build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DHybridReverb2_UseLocalDatabase=ON \
    ..
  make
}

package() {
  cd "$_pkgname/build"
  make DESTDIR="$pkgdir/" install

  unzip -d "$pkgdir"/usr/share/"$_pkgname" "$srcdir/RIR-$_rirver.zip"
  cd "$pkgdir"/usr/share/"$_pkgname"
  mv -f "HybridReverb2-impulse-response-database-$_rirver"/* .
  rmdir "HybridReverb2-impulse-response-database-$_rirver"
}
