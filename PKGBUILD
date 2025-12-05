# Maintainer:

: ${_build_deps:=true}
: ${_ver_plutovg:=1.3.1}
: ${_ver_plutosvg:=0.0.7}

: ${_commit=e4af1c424451c6b65c5c387404315cef77e9901b}

_pkgname="pcsx2"
pkgname="$_pkgname"
pkgver=2.4.0
pkgrel=3
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

  # cubeb, no sound if not present
  alsa-lib
  jack
  libpulse
  sndio
  speexdsp

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
  "$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}"
  "pcsx2_patches"::"git+https://github.com/PCSX2/pcsx2_patches.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

if [ "${_build_deps::1}" != "t" ]; then
  eval "depends+=(
    ## AUR
    plutosvg
    plutovg
  )"
else
  eval "depends+=(
    # plutosvg
    freetype2
  )"

  eval "makedepends+=(
    patchelf
  )"

  _pkgsrc_plutovg="plutovg"
  _pkgsrc_plutosvg="plutosvg"
  source+=(
    "$_pkgsrc_plutovg"::"git+https://github.com/sammycage/plutovg.git${_ver_plutovg:+#tag=v$_ver_plutovg}"
    "$_pkgsrc_plutosvg"::"git+https://github.com/sammycage/plutosvg.git${_ver_plutosvg:+#tag=v$_ver_plutosvg}"
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )
fi

prepare() {
  cd "$_pkgsrc"

  # prevent march=native
  sed -E -e 's@^(\s*)(add_compile_options\(.*march=native.*\))@\1message("skip: march=native")@' \
    -i cmake/BuildParameters.cmake

  # adjust data path
  sed -E -e '/CMAKE_INSTALL_FULL_DATADIR/s@/PCSX2\b@/'"${_pkgname}@" \
    -i pcsx2/CMakeLists.txt \
    cmake/BuildParameters.cmake

  # fix for Qt 6.10
  sed -E -e 's@\b(Qt6::)?(Gui)\b@\1\2 \1\2Private@' \
    -i cmake/SearchForStuff.cmake \
    pcsx2-qt/CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  git describe --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  export CC CXX LDFLAGS
  CC=clang
  CXX=clang++
  LDFLAGS="$(sed -E -e 's&\S*fuse-ld\S*&&g' <<< "$LDFLAGS") -fuse-ld=lld"

  local _cmake_options _cmake_plutovg _cmake_plutosvg
  _cmake_options=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_PREFIX_PATH="$srcdir/deps/usr"
    -DCMAKE_SKIP_RPATH=ON
    -DENABLE_TESTS=$CHECKFUNC
    -Wno-dev
  )

  _cmake_plutovg=(
    -DBUILD_SHARED_LIBS=ON
  )

  _cmake_plutosvg=(
    -DBUILD_SHARED_LIBS=ON
    -DPLUTOSVG_BUILD_EXAMPLES=ON
    -DPLUTOSVG_ENABLE_FREETYPE=ON
  )

  _cmake_pcsx2=(
    -DDISABLE_ADVANCE_SIMD=ON # misnamed; enables multi-arch
    -DENABLE_SETCAP=OFF
    -DPACKAGE_MODE=ON
    -DUSE_ASAN=OFF
    -DUSE_BACKTRACE=OFF
    -DUSE_SANITIZERS=OFF # cubeb
    -DUSE_VULKAN=ON
    -DWAYLAND_API=ON
    -DX11_API=ON
  )

  local _deps i _source _options
  if [[ "${_build_deps::1}" == t ]]; then
    _deps=(
      plutovg
      plutosvg
    )
  fi

  local _pkgsrc_pcsx2="$_pkgsrc"
  for i in ${_deps[@]} pcsx2; do
    printf "\nBuilding %s...\n" "$i"
    _source="_pkgsrc_$i"
    eval "_options=(\"\${_cmake_${i}[@]}\")"
    cmake "${_cmake_options[@]}" "${_options[@]}" -B "build_${i}" -S "${!_source}"
    cmake --build "build_${i}"
    DESTDIR="deps" cmake --install "build_${i}"
  done

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

  if [[ "${_build_deps::1}" == t ]]; then
    mkdir -pm755 "$pkgdir/usr/lib/$_pkgname"
    cp "deps/usr/lib"/*.so* "$pkgdir/usr/lib/$_pkgname/"
    patchelf --add-rpath "/usr/lib/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  fi
}
