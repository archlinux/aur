# Maintainer: gigas002 <gigas002@pm.me>
# Contributor: Raziel23 <venom23 at runbox dot com>
# Contributor: Sandy Carter <bwrsandman@gmail.com>

pkgname=vcmi
pkgver=1.6.8
pkgrel=4
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/vcmi/vcmi"
license=(
	'GPL-2.0-or-later' # program
	'CC-BY-SA-4.0' # assets
)
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt6-base' 'libxkbcommon-x11'
         'hicolor-icon-theme' 'onetbb' 'fuzzylite' 'luajit')
makedepends=('boost' 'cmake' 'git' 'qt6-tools' 'minizip' 'ninja')
optdepends=('innoextract: required by vcmibuilder' 'unshield: required by vcmibuilder' 'unzip: required by vcmibuilder')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/VCMI-Sources.tar.gz")
sha256sums=('64ca97737123b3270dfbd0a4a94bddc87223d3f4a9cfb0ca20e27f7a9d46fa33')
_pkgsrc="$pkgname-$pkgver"
noextract=("$_pkgsrc.tar.gz")

prepare() {
  mkdir -p "$_pkgsrc"
  bsdtar -C "$_pkgsrc" -xf "$_pkgsrc.tar.gz"

  # force qt6
  sed -i 's/find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets Network)/find_package(QT NAMES Qt6 REQUIRED COMPONENTS Widgets Network)/' "$_pkgsrc/CMakeLists.txt"
  sed -i 's/set(BOOST_COMPONENTS .*)/set(BOOST_COMPONENTS date_time filesystem locale program_options)/' "$_pkgsrc/CMakeLists.txt"

  # fix for boost 1.89 until 1.7.0+ released
grep -q 'Boost_MAJOR_VERSION EQUAL 1 AND Boost_MINOR_VERSION LESS 69' "$_pkgsrc/CMakeLists.txt" || cat >> "$_pkgsrc/CMakeLists.txt" <<'EOF'
if(Boost_MAJOR_VERSION EQUAL 1 AND Boost_MINOR_VERSION LESS 69)
    list(APPEND BOOST_COMPONENTS system)
    find_package(Boost 1.48.0 REQUIRED COMPONENTS ${BOOST_COMPONENTS})
endif()
EOF

  # fix for innoextract until 1.7.0+ released
_cmakefile="$_pkgsrc/launcher/lib/innoextract/CMakeLists.txt"
sed -i '/find_package(Boost REQUIRED COMPONENTS/,/)/c\
set(BOOST_REQUIRED_COMPONENTS\
    iostreams\
    filesystem\
    date_time\
    program_options\
)\
find_package(Boost REQUIRED COMPONENTS ${BOOST_REQUIRED_COMPONENTS})\
if(Boost_MAJOR_VERSION EQUAL 1 AND Boost_MINOR_VERSION LESS 69)\
    list(APPEND BOOST_REQUIRED_COMPONENTS system)\
    find_package(Boost REQUIRED COMPONENTS ${BOOST_REQUIRED_COMPONENTS})\
endif()' "$_cmakefile"
}

build() {
  local _cmake_options=(
  	-B build
  	-S "$_pkgsrc"
  	-G Ninja
  	-DCMAKE_INSTALL_PREFIX='/usr'
  	-DENABLE_TEST=OFF
  	-DFORCE_BUNDLED_FL=OFF
  	-DENABLE_INNOEXTRACT=OFF
  	-DCMAKE_BUILD_TYPE='Release'
  	-Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
