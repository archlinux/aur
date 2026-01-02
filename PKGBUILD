# Maintainer: gigas002 <gigas002@pm.me>
# Contributor: Raziel23 <venom23 at runbox dot com>
# Contributor: Sandy Carter <bwrsandman@gmail.com>

pkgname=vcmi
pkgver=1.7.1
pkgrel=1
pkgdesc="Open-source engine for Heroes of Might and Magic III"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/vcmi/vcmi"
license=(
	'GPL-2.0-or-later' # program
	'CC-BY-SA-4.0' # assets
)
depends=('boost-libs' 'ffmpeg' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'qt6-base' 'libxkbcommon-x11'
         'hicolor-icon-theme' 'onetbb' 'fuzzylite' 'luajit' 'libsquish')
makedepends=('boost' 'cmake' 'git' 'qt6-tools' 'minizip' 'ninja')
optdepends=('innoextract: required by vcmibuilder'
		    'unshield: required by vcmibuilder'
		    'unzip: required by vcmibuilder'
		    'onnxruntime: ML-powered combat AI'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/VCMI-Sources.tar.gz")
sha256sums=('7cb61492d2f15dca000a12ba01e0d0fb3ac87746c4d4130c59ef9362740b46c3')
_pkgsrc="$pkgname-$pkgver"
noextract=("$_pkgsrc.tar.gz")

prepare() {
  mkdir -p "$_pkgsrc"
  bsdtar -C "$_pkgsrc" -xf "$_pkgsrc.tar.gz"

  # force qt6
  sed -i 's/find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets Network)/find_package(QT NAMES Qt6 REQUIRED COMPONENTS Widgets Network)/' "$_pkgsrc/CMakeLists.txt"
  sed -i 's/set(BOOST_COMPONENTS .*)/set(BOOST_COMPONENTS date_time filesystem locale program_options)/' "$_pkgsrc/CMakeLists.txt"
}

build() {
  # MMAI requires onnxruntime
  local _cmake_options=(
  	-B build
  	-S "$_pkgsrc"
  	-G Ninja
  	-DCMAKE_INSTALL_PREFIX='/usr'
  	-DENABLE_TEST=OFF
  	-DFORCE_BUNDLED_FL=OFF
  	-DENABLE_INNOEXTRACT=OFF
  	-DCMAKE_BUILD_TYPE='Release'
	-DENABLE_MMAI=OFF
  	-Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
