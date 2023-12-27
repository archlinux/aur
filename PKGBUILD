# Maintainer:
# Contributor: Nick Lay <layns(at)mail(dot)uc(dot)edu>

##

: ${_build_clang:=true}

: ${_build_avx:=false}
: ${_build_git:=true}

[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="dolphin-emu-primehack"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.0.7.r0.gbd2591a28a
pkgrel=1
pkgdesc='A Gamecube and Wii emulator with mouselook controls'
url="https://github.com/shiiion/dolphin"
license=('GPL-2.0-or-later')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    alsa-lib
    bluez-libs
    curl
    ffmpeg
    gcc-libs
    glibc
    libevdev
    libgl
    libpulse
    libudev.so
    libx11
    libxi
    libxrandr
    qt6-base
    qt6-svg

    ## optional
    bzip2
    cubeb
    curl
    fmt
    hidapi
    libiconv
    liblzma.so
    libspng
    libusb
    lz4
    lzo
    mbedtls2
    miniupnpc
    minizip-ng
    pugixml
    sdl2
    sfml
    zstd

    ## broken
    #enet
    #libmgba
    #xxhash
    #zlib-ng
  )
  makedepends+=(
    cmake
    git
    python
  )

  options=(!emptydirs)

  if [[ "${_build_clang::1}" == "t" ]] ; then
    makedepends+=(
      clang
      lld
      llvm
    )
  else
    options+=(!lto)
  fi

  if [[ "${_build_git::1}" != "t" ]] ; then
    _main_stable
  else
    _main_git
  fi

  _source_dolphin_emu
}

# submodules
_source_dolphin_emu() {
  source+=(
    #'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    #'curl'::'git+https://github.com/curl/curl.git'
    #'dolphin-emu.ext-win-ffmpeg'::'git+https://github.com/dolphin-emu/ext-win-ffmpeg.git'
    #'dolphin-emu.ext-win-qt'::'git+https://github.com/dolphin-emu/ext-win-qt.git'
    #'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'
    #'google.googletest'::'git+https://github.com/google/googletest.git'
    #'khronosgroup.spirv-cross'::'git+https://github.com/KhronosGroup/SPIRV-Cross.git'
    #'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'
    #'libusb'::'git+https://github.com/libusb/libusb.git'
    #'lsalzman.enet'::'git+https://github.com/lsalzman/enet.git'
    #'lz4'::'git+https://github.com/lz4/lz4.git'
    #'mozilla.cubeb'::'git+https://github.com/mozilla/cubeb.git'
    #'randy408.libspng'::'git+https://github.com/randy408/libspng.git'
    #'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'

    'epezent.implot'::'git+https://github.com/epezent/implot.git'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
    'mgba-emu.mgba'::'git+https://github.com/mgba-emu/mgba.git'
    'retroachievements.rcheevos'::'git+https://github.com/RetroAchievements/rcheevos.git'
    'zlib-ng'::'git+https://github.com/zlib-ng/zlib-ng.git'
  )
  sha256sums+=(
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_dolphin_emu() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      #['bylaws.libadrenotools']='Externals/libadrenotools'
      #['curl']='Externals/curl/curl'
      #['cyan4973.xxhash']='Externals/xxhash/xxHash'
      #['dolphin-emu.ext-win-ffmpeg']='Externals/FFmpeg-bin'
      #['dolphin-emu.ext-win-qt']='Externals/Qt'
      #['fmtlib.fmt']='Externals/fmt/fmt'
      #['google.googletest']='Externals/gtest'
      #['khronosgroup.spirv-cross']='Externals/spirv_cross/SPIRV-Cross'
      #['libsdl-org.sdl']='Externals/SDL/SDL'
      #['libusb']='Externals/libusb/libusb'
      #['lsalzman.enet']='Externals/enet/enet'
      #['lz4']='Externals/lz4/lz4'
      #['mozilla.cubeb']='Externals/cubeb/cubeb'
      #['randy408.libspng']='Externals/libspng/libspng'

      ['epezent.implot']='Externals/implot/implot'
      ['gpuopen-librariesandsdks.vulkanmemoryallocator']='Externals/VulkanMemoryAllocator'
      ['mgba-emu.mgba']='Externals/mGBA/mgba'
      ['retroachievements.rcheevos']='Externals/rcheevos/rcheevos'
      ['zlib-ng']='Externals/zlib-ng/zlib-ng'
    )
    _submodule_update
  )
}

# stable package
_main_stable() {
  :
}

# git package
_main_git() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=(
    "$_pkgname"::"git+$url.git"
    "primehack-rename.patch"
  )
  sha256sums+=(
    'SKIP'
    '632cb45fc540536f615caf72c0736682fa30776a10bf42dd94bae417845c213d'
  )

  pkgver() {
    cd "$_pkgsrc"

    local _regex='^.* scm_rev_str = ".*\[v([0-9\.]+)\].*$'
    local _file='Source/Core/Common/Version.cpp'

    local _line=$(grep -Esm1 "$_regex" "$_file")
    local _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)

    local _version=$(sed -E "s@$_regex@\1@" <<< "$_line")

    local _commit=$(git blame -L $_line_num,$_line_num -- "$_file" | awk '{print $1;}')

    local _revision=$(git rev-list --count --cherry-pick $_commit...HEAD)
    local _hash=$(git rev-parse --short HEAD)

    printf "%s.r%s.g%s" "$_version" "$_revision" "$_hash"
  }
}

# common functions
prepare() {
  _submodule_update() {
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  _prepare_dolphin_emu

  # primehack-rename: copy files
  local _data_path="$_pkgsrc/Data"
  for i in -nogui.6 .6 .desktop .png .svg ; do
    cp --reflink=auto -- "$_data_path/dolphin-emu${i}" "$_data_path/primehack${i}"
  done

  _data_path="$_pkgsrc/Data/Sys/Resources"
  cp --reflink=auto -- "$_data_path/dolphin_logo.png" "$_data_path/primehack_logo.png"
  cp --reflink=auto -- "$_data_path/dolphin_logo@2x.png" "$_data_path/primehack_logo@2x.png"

  # primehack-rename: patch source
  pushd "$_pkgsrc"
  #git -c user.name="tmp" -c user.email="tmp@example.com" am "$srcdir/primehack-rename.patch"
  apply-patch "$srcdir/primehack-rename.patch"
  popd

  # Fix minizip-ng name for Arch
  sed -E -e 's@(pkgconfig\(MINIZIP minizip)([^a-z]+)@\1-ng\2@' \
    -i "${srcdir:?}/$_pkgsrc/CMakeLists.txt"

  # Delete gcc specific options
  sed '/_ARCHIVE_/d' -i "${srcdir:?}/$_pkgsrc/CMakeLists.txt"
}

build() {
  if [[ "${_build_avx::1}" == "t" ]] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=skylake -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=skylake -O3"
  fi

  local _cmake_options=(
    -B build
    -S "$_pkgname"

    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DDISTRIBUTOR='aur.chaotic.cx'

    -DENABLE_AUTOUPDATE=OFF
    -DENABLE_ANALYTICS=OFF # default:Opt-in
    # -DUSE_SYSTEM_LIBS=ON # default:AUTO

    -DUSE_SYSTEM_ENET=OFF
    -DUSE_SYSTEM_LIBMGBA=OFF
    -DUSE_SYSTEM_XXHASH=OFF
    -DUSE_SYSTEM_ZLIB=OFF

    -DENABLE_NOGUI=OFF
    -DENABLE_CLI_TOOL=OFF

    -DENABLE_TESTS=OFF
    -Wno-dev
  )

  if [[ "${_build_clang::1}" == "t" ]] ; then
    export AR=llvm-ar
    export NM=llvm-nm

    _cmake_options+=(
      -DCMAKE_C_COMPILER=clang
      -DCMAKE_CXX_COMPILER=clang++
      -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
      -DENABLE_LTO=ON

      -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld"
      -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld"
      -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld"
    )
  else
    _cmake_options+=(-DENABLE_LTO=OFF)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build

  # To use, symlink to /usr/lib/udev/rules.d/
  install -Dm644 "${srcdir:?}/$_pkgsrc/Data/51-usb-device.rules" \
    -t "${pkgdir:?}/usr/share/primehack/"
}

# execute
_main_package
