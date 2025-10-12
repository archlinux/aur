# Maintainer:
# Contributor: XenHat <me at xenh.at>
# Contributor: SoftwareRat <jaguar5018@gmail.com>
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

## options
: ${_ffmpeg:=ffmpeg} # for alternate ffmpeg package

_pkgname="moonlight-qt"
pkgname="$_pkgname-git"
pkgver=6.1.0.r83.g1bf86f5
pkgrel=1
pkgdesc='GameStream client for PCs'
url="https://github.com/moonlight-stream/moonlight-qt"
license=('GPL-3.0-or-later')
arch=('aarch64' 'x86_64')

depends=(
  "$_ffmpeg"
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'sdl2_ttf'
)
makedepends=(
  'git'
  'vulkan-headers'
)
optdepends=(
  'libva-intel-driver: hardware acceleration for Intel GPUs GMA 4500 (2008) up to Coffee Lake (2017)'
  'intel-media-driver: hardware acceleration for Intel GPUs starting from Broadwell (2014) and newer (e.g. Intel Arc)'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git rm -r libs # don't use prebuilt binaries
  git submodule update --init --recursive --depth=1
}

build() {
  [ "$_ffmpeg" != "ffmpeg" ] && export PKG_CONFIG_PATH="/usr/lib/$_ffmpeg/pkgconfig/"

  cd "$_pkgsrc"
  qmake6 'moonlight-qt.pro' PREFIX='/usr'
  make
}

package() {
  make -C "$_pkgsrc" INSTALL_ROOT="$pkgdir" install
}
