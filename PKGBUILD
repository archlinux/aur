# Maintainer: Johannes Hanika  <hanatos at gmail dot com>
# Contributor: Johannes Hanika  <hanatos at gmail dot com>
pkgname=vkdt-git
_gitname=vkdt
pkgver=0.9.0.545
pkgrel=1
pkgdesc="GPU/node graph based photography postprocessing workflow toolbox"
arch=('i686' 'x86_64' 'aarch64')
url=https://jo.dreggn.org/vkdt/
license=('GPL-3.0-only')
depends=(glfw libjpeg-turbo glslang vulkan-icd-loader vulkan-tools perl-image-exiftool bash glibc)
# you might have installed rust via rustup/more recent version, so we
# don't make it a hard dependency. vkdt without raw loading might be less than
# useful for most cases, so this optdepend is kinda hard though.
optdepends=(
'ffmpeg: video input/output'
'rust: rawler raw loading (kinda essential, but rustc via rustup works too)'
'alsa-lib: audio output')
makedepends=(rsync sed xxd cmake vulkan-headers git pkgconf make)
# there is no official vkdt release package. if there were, it would be in conflict with this git package:
# conflicts=(vkdt)
provides=(vkdt)
source=('git+https://github.com/hanatos/vkdt.git')
md5sums=('SKIP')
# stripping removes some function in the c++ dsos which we load runtime
OPTIONS=(!strip)

pkgver() {
  cd "$_gitname"
  > .git/FETCH_HEAD
  git fetch --all --tags
  git describe | cut -d- -f-2 | tr "-" "."
}

build() {
  cd "$_gitname"
  # clang doesn't work with the extra CXXFLAGS arch gives us
  cat << EOF > bin/config.mk
CXX=g++
CC=gcc
CFLAGS+=-Wall -pipe -I. -D_GNU_SOURCE -std=c11
CXXFLAGS+=-Wall -pipe -I. -D_GNU_SOURCE -std=c++17
EXE_CFLAGS+=-fPIC
export CFLAGS CXXFLAGS EXE_CFLAGS CXX CC
EOF
  make -j20 prefix="/usr" DESTDIR="$pkgdir"
}

package() {
  cd "$_gitname"
  make prefix="/usr" DESTDIR="$pkgdir" install
}
