# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-transition-table
pkgver=0.1.5
_obsver=26.1.2
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a Transition Table to the tools menu"
arch=('x86_64')
url="https://github.com/exeldro/obs-transition-table"
license=("GPL2")
depends=("obs-studio")
# Need to compile plugin in OBS compilation process
makedepends=(
  'cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python'
  'luajit' 'ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
  'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache'
)
source=(
  "$pkgname-$pkgver::git+https://github.com/exeldro/obs-transition-table#commit=6c235f2d2ef46d54c1067492c2ec874ff2d5f54e"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
  "fix_python_binary_loading.patch"
)
sha256sums=(
  'SKIP'
  'bc8b4c61ba4aae87b70c589a6a5b8538e4f03121b31e9b98a2071d9f6006b897'
  'bdfbd062f080bc925588aec1989bb1df34bf779cc2fc08ac27236679cf612abd'
)

prepare() {
  rm -rf fakeroot
  cd "obs-studio-$_obsver"
  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
  cd UI/frontend-plugins
  cp -r "$srcdir/$pkgname-$pkgver" .
  echo "add_subdirectory($pkgname-$pkgver)" | tee -a CMakeLists.txt >/dev/null
}

# Need to compile plugin in OBS compilation process
build() {
  cd "obs-studio-$_obsver"
  cmake -B build \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DBUILD_CAPTIONS=ON
  make -C build
}

package() {
  mkdir -p "$pkgdir"/usr/lib/obs-plugins
  mkdir -p "$pkgdir"/usr/share/obs/obs-plugins

  cd "obs-studio-$_obsver"
  make -C build DESTDIR="$srcdir/fakeroot/" install
  cp -a "$srcdir"/fakeroot/usr/lib/obs-plugins/transition-table.so "$pkgdir"/usr/lib/obs-plugins/
  cp -a "$srcdir"/fakeroot/usr/share/obs/obs-plugins/transition-table "$pkgdir"/usr/share/obs/obs-plugins/
}