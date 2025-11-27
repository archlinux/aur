# Maintainer:

## useful commands
# LLVM_PROFILE_FILE="default_%9m.profraw" pcsx2-qt
# llvm-profdata merge -output=pcsx2-avx-git.profdata *.profraw

## options
: ${_build_instrumented:=false}
: ${_build_pgo:=try}

: ${_build_level:=3}

unset _pkgtype
[[ "${_build_instrumented::1}" == "t" ]] && _pkgtype+="-instrumented"
[[ "${_build_level::1}" == "2" ]] && _pkgtype+="-x64v2"
[[ "${_build_level::1}" == "3" ]] && _pkgtype+="-avx"
[[ "${_build_level::1}" == "4" ]] && _pkgtype+="-x64v4"
_pkgtype+="-git"

_pkgname="pcsx2"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.5.333.r0.g7942ee4
pkgrel=1
pkgdesc='PlayStation 2 emulator'
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  kddockwidgets
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

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug' 'lto')
install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}"
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
    -i cmake/BuildParameters.cmake

  # adjust data path
  sed -E -e '/CMAKE_INSTALL_FULL_DATADIR/s@/PCSX2\b@/'"${_pkgname}@" \
    -i pcsx2/CMakeLists.txt \
    cmake/BuildParameters.cmake

  # relax requirements
  sed -E -e 's&^(find_package\s*\(plutos?vg) [0-9.]* ([A-Z]+\))$&\1 \2&' \
    -i cmake/SearchForStuff.cmake
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CC=clang
  CXX=clang++
  LDFLAGS="${_ldflags[@]//*fuse-ld*/} -fuse-ld=lld"

  if [[ ${_build_level::1} =~ ^[2-4]$ ]]; then
    local _cflags _cxxflags
    _cflags=(
      -march=x86-64-v${_build_level::1} -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CFLAGS}")
    )
    CFLAGS="${_cflags[@]}"

    _cxxflags=(
      -march=x86-64-v${_build_level::1} -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CXXFLAGS}")
    )
    CXXFLAGS="${_cxxflags[@]}"
  fi

  echo "Building pcsx2..."
  local _cmake_pcsx2

  _cmake_pcsx2=(
    -S "$_pkgsrc"
    -B build_pcsx2
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=ON
    -DENABLE_TESTS=$CHECKFUNC
    -Wno-dev

    -DENABLE_SETCAP=OFF
    -DPACKAGE_MODE=ON
    -DUSE_ASAN=OFF
    -DUSE_BACKTRACE=OFF
    -DUSE_VULKAN=ON
    -DWAYLAND_API=ON
    -DX11_API=ON
  )

  if [[ ${_build_level::1} =~ ^[2-4]$ ]] || [[ ${CARCH: -2} =~ ^v[0-9]$ ]]; then
    _cmake_pcsx2+=(-DDISABLE_ADVANCE_SIMD=OFF)
  else
    _cmake_pcsx2+=(-DDISABLE_ADVANCE_SIMD=ON)
  fi

  local _pgo_profile_old="${SRCDEST:-$startdir}/$pkgname.profdata"
  local _pgo_profile="$srcdir/$pkgname.profdata"
  if [[ "${_build_instrumented::1}" == "t" ]]; then
    echo "Compiling with instrumentation."
    CFLAGS+=" -fprofile-generate"
    CXXFLAGS+=" -fprofile-generate"
  elif [[ "${_build_pgo::1}" == "t" ]] && [ -e "$_pgo_profile_old" ]; then
    echo "Compiling with profile-guided optimization."
    cp --reflink=auto "$_pgo_profile_old" "$_pgo_profile"

    CFLAGS+=" -fprofile-use='$_pgo_profile'"
    CXXFLAGS+=" -fprofile-use='$_pgo_profile'"
  else
    echo "Compiling with standard optimization."
  fi

  cmake "${_cmake_pcsx2[@]}"
  cmake --build build_pcsx2

  echo "Archiving game patches..."
  cd pcsx2_patches
  7z a -mx=9 -r ../patches.zip patches/.
)

package() {
  DESTDIR="$pkgdir" cmake --install build_pcsx2
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
