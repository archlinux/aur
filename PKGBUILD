# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: hoverth
# Adapted from AUR package `organicmaps` by nesk_aur
pkgname=comaps
pkgver=v2025.10.16_1
tag="${pkgver%%_*}-${pkgver##*_}"
pkgrel=1
pkgdesc="CoMaps: Offline Hike, Bike, Trails and Navigation"
arch=(x86_64)
makedepends=(cmake git jq gcc ninja)
depends=(mesa libglvnd freetype2 sqlite icu qt6-svg qt6-base zlib libpng glibc
  qt6-positioning gcc-libs harfbuzz libxrandr libxi libxcursor)
optdepends=("ccache: faster re-compilation" "qt6-wayland: for Wayland users")
license=('Apache-2.0')
url="https://comaps.app"
source_url="https://codeberg.org/comaps/comaps/"
source=(comaps.desktop
  icon.svg
  "git+https://github.com/organicmaps/osmctools.git"
  "git+https://codeberg.org/comaps/kothic.git"
  "git+https://codeberg.org/comaps/protobuf.git"
  "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
  "git+https://github.com/boostorg/boost.git#tag=boost-1.85.0"
  "git+https://github.com/organicmaps/just_gtfs.git#branch=for-usage-as-submodule"
  "git+https://github.com/libexpat/libexpat.git#tag=R_2_2_9"
  "git+https://github.com/g-truc/glm.git"
  "git+https://github.com/unicode-org/icu.git"
  "git+https://gitlab.freedesktop.org/freetype/freetype.git"
  "git+https://github.com/google/googletest.git"
  "git+https://github.com/lemire/fast_double_parser.git"
  "git+https://github.com/zeux/pugixml.git"
  "git+https://github.com/akheron/jansson.git"
  "git+https://github.com/gflags/gflags.git"
  "git+https://github.com/thisistherk/fast_obj"
  "git+https://github.com/harfbuzz/harfbuzz.git"
  "git+https://github.com/nemtrif/utfcpp.git"
  "git+https://github.com/glfw/glfw.git"
  "git+https://github.com/dpogue/CMake-MetalShaderSupport.git"
  "git+https://github.com/ocornut/imgui"
)
sha256sums=('21f70d6c3282fcec0165c9b9f8082e081ecb50b423ae286ffd4ccde4cc794563'
  '85210e30cd1b6e8b30407cf97a57cbf3eb98f16526fc6ffaae63f1441691e6e1'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
conflicts=("${pkgname}-bin" "${pkgname}-git")
prepare() {
  avail=$(df -P -B 1048576 $srcdir | awk 'NR>1 {print $4}')
  if [ $avail -le 5120 ]; then
    printf "need at least 5 GiB of free space\n"
    exit 1
  fi

  src_url=$source_url
  if [ -n "$SOURCE_URL_REWRITER" ]; then
    src_url=$($SOURCE_URL_REWRITER $source_url)
    case $src_url in
    file://*)
      git -C ${src_url#file://} fetch --depth=1 origin "$tag"
      ;;
    esac
  fi
  if [ ! -d $pkgname ]; then
    git clone --depth=1 --single-branch -b "$tag" --filter=blob:limit=128k \
      $src_url $pkgname
  fi
  git submodule init

  git config submodule.tools/osmctools.url "$srcdir/osmctools"
  git config submodules.tools/kothic.url "$srcdir/kothic"
  git config submodules.3party/protobuf/protobuf.url "$srcdir/protobuf"
  git config submodules.3party/Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git config submodules.3party/boost.url "$srcdir/boost"
  git config submodules.3party/just_gtfs.url "$srcdir/just_gtfs"
  git config submodules.3party/expat.url "$srcdir/libexpat"
  git config submodules.3party/glm.url "$srcdir/glm"
  git config submodules.3party/icu/icu.url "$srcdir/icu"
  git config submodules.3party/freetype/freetype.url "$srcdir/freetype"
  git config submodules.3party/googletest.url "$srcdir/googletest"
  git config submodules.3party/fast_double_parser.url "$srcdir/fast_double_parser"
  git config submodules.3party/pugixml/pugixml.url "$srcdir/pugixml"
  git config submodules.3party/jansson/jansson.url "$srcdir/jansson"
  git config submodules.3party/gflags.url "$srcdir/gflags"
  git config submodules.3party/fast_obj.url "$srcdir/fast_obj"
  git config submodules.3party/harfbuzz/harfbuzz.url "$srcdir/harfbuzz"
  git config submodules.3party/utfcpp.url "$srcdir/utfcpp"
  git config submodules.3party/glfw.url "$srcdir/glfw"
  git config submodules.3party/CMake-MetalShaderSupport.url "$srcdir/CMake-MetalShaderSupport"
  git config submodules.3party/imgui/imgui.url "$srcdir/imgui"

  cd $pkgname
  git -c protocol.file.allow=always submodule update --init --recursive --depth=1
  rm -f 3party/boost/b2
  bash ./configure.sh
}
build() {
  cd $pkgname
  env CC=gcc CXX=g++ tools/unix/build_omim.sh -c -r desktop
}
package() {
  install -dm755 "$pkgdir/usr/share/${pkgname}"
  cp -Lr "${pkgname}/data" "$pkgdir/usr/share/${pkgname}/"
  install -dm777 "$pkgdir/usr/share/${pkgname}/data/$(jq '.v' $pkgname/data/countries.txt)"
  install -Dm644 "icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm755 "omim-build-release/CoMaps" "$pkgdir/usr/bin/comaps"
  install -Dm644 "comaps.desktop" -t "$pkgdir/usr/share/applications"
}
