# Maintainer:

: ${_commit=e4af1c424451c6b65c5c387404315cef77e9901b}

_pkgname="pcsx2"
pkgname="$_pkgname"
pkgver=2.4.0
pkgrel=1
pkgdesc='PlayStation 2 emulator'
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  kddockwidgets-qt6 # AUR
  libpcap
  libpng
  libwebp
  libxi
  libxrandr
  plutosvg # AUR
  plutovg  # AUR
  qt6-base
  sdl3
)
makedepends=(
  ## compiler
  clang
  lld
  llvm

  ## build
  cmake
  extra-cmake-modules
  git
  ninja

  ## pcsx2
  shaderc
  qt6-tools

  # patches
  7zip
)
optdepends=(
  'alsa-utils: Sound player for RetroAchievements'
  'gstreamer: Backup sound player for RetroAchievements'
)

options=('!debug' 'lto')
install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git#commit=${_commit:-v$pkgver}"
  "pcsx2_patches"::"git+https://github.com/PCSX2/pcsx2_patches.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"

  # prevent march=native
  sed -E -e 's@^(\s*)(add_compile_options\(.*march=native.*\))@\1message("skip: march=native")@' \
    -i "cmake/BuildParameters.cmake"

  # adjust data path
  sed -E -e '/CMAKE_INSTALL_FULL_DATADIR/s@/PCSX2\b@/'"${_pkgname}@" \
    -i "pcsx2/CMakeLists.txt" \
    "cmake/BuildParameters.cmake"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CC=clang
  CXX=clang++

  local _ldflags=(${LDFLAGS})
  LDFLAGS="${_ldflags[@]//*fuse-ld*/} -fuse-ld=lld"

  echo "Building pcsx2..."
  local _cmake_pcsx2

  _cmake_pcsx2+=(
    -S "$_pkgsrc"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DDISABLE_ADVANCE_SIMD=ON # misnamed; enables multi-arch
    -DENABLE_SETCAP=OFF
    -DPACKAGE_MODE=ON
    -DUSE_ASAN=OFF
    -DUSE_BACKTRACE=OFF
    -DUSE_VULKAN=ON
    -DWAYLAND_API=ON
    -DX11_API=ON
    -DENABLE_TESTS=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_pcsx2[@]}"
  cmake --build build

  echo "Archiving game patches..."
  cd pcsx2_patches
  7z a -mx=9 -r ../patches.zip patches/.
)

package() {
  DESTDIR="$pkgdir" cmake --install build
  ln -sf pcsx2-qt "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 patches.zip -t "$pkgdir/usr/share/$_pkgname/resources/"

  install -Dm644 pcsx2/bin/resources/icons/AppIconLarge.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=PCSX2
GenericName=$pkgdesc
Comment=$pkgdesc
TryExec=$_pkgname
Exec=$_pkgname %f
Icon=$_pkgname
Terminal=false
StartupNotify=true
StartupWMClass=$_pkgname
Categories=Game;Emulator
END
}
