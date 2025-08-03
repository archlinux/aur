# vim:set ts=2 sw=2 et:
# Maintainer Eric Woudstra < ericwouds AT gmail DOT com >
# Contributor: graysky <therealgraysky AT protonmail DOT com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: B & monty - Thanks for your hints :)
# Contributor: marzoul
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD

# Edited so Kodi builds with only external libraries.
# Install the ffmpeg of your choice.
# Then install with pacman: flatbuffers libdvdcss libdvdnav libdvdread fmt spdlog
# from AUR: libcrossguid-git libudfread-git fstrcmp

# set this to anything to build with clang rather than with gcc
_clangbuild=

pkgbase=kodi-ext-git
pkgname=("$pkgbase" "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev")
pkgver=21.2.0r65944.3845c09a81b
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url="https://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libva'
  'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'python-pycryptodomex' 'python-pillow' 'python-pybluez'
  'python-simplejson' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'meson' 'gtest' 'graphviz'
  'libdisplay-info' 'tinyxml2' 'pcre'
  # wayland
  'wayland-protocols' 'waylandpp' 'libxkbcommon'
  # gbm
  'libinput'
  # external
  'ffmpeg' 'flatbuffers'
  'libudfread-git' 'fstrcmp'
  'fmt' 'spdlog' 'libcrossguid-git'
)
# At this moment not possible to use as external: 'libdvdcss' 'libdvdnav' 'libdvdread'
# See: https://github.com/xbmc/xbmc/issues/15899

[[ -n "$_clangbuild" ]] && makedepends+=('clang' 'lld' 'llvm')

_gitname='xbmc'
_codename=master

options=(!lto)
#https://github.com/xbmc/libdvdcss/archive/refs/tags/1.4.3-Next-Omega-Alpha3.tar.gz
#_libdvdcss_version="1.4.3-Next-Omega-Alpha3"
_libdvdcss_version="1.4.3-Next-Nexus-Alpha2-2"
_libdvdnav_version="6.1.1-Next-Nexus-Alpha2-2"
_libdvdread_version="6.1.3-Next-Nexus-Alpha2-2"
source=("git+https://github.com/xbmc/xbmc.git#branch=$_codename"
  "$pkgbase-libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "$pkgbase-libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "$pkgbase-libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
)
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
for p in $(shopt -s nullglob; echo *.patch) ; do
  source+=($p)
  b2sums+=(SKIP)
done

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir -p "$srcdir/kodi-build"

  cd "$startdir/$_gitname"

  _lastbranch=$(git branch --all --sort='-*authordate' | tail -2 | head -1 | tr -d ' ')

  cd "$srcdir/$_gitname"

  git reset --hard remotes/origin/${_lastbranch}

  echo "=============================="
  echo "Building branch ${_lastbranch}"
  echo "=============================="

  for p in $(shopt -s nullglob; echo $srcdir/*.patch) ; do
    git apply -v "$p"
    echo
  done

  if [[ -n "$_clangbuild" ]]; then
    echo "Building with clang"
    export CC=clang CXX=clang++
  fi

  if [[ $CARCH == "armv7h" ]]; then
      echo "Patching for gcc14 bug for armv7h"
    # Error: bad immediate value for 8-bit offset
    sed -i 's/class CGameLoop : protected CThread/class CGameLoop : virtual protected CThread/' \
        "$srcdir/$_gitname/xbmc/cores/RetroPlayer/playback/GameLoop.h"
  fi
}

pkgver() {
  cd "$_gitname"
  printf "%sr%s.%s" \
    "$(cat "$srcdir/$_gitname/version.txt" | grep "VERSION_CODE" | cut -d' ' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/kodi-build"

  # fix build breakage introduced with gcc-12.1.0-1
  export CFLAGS+=" -Wno-error"
  export CXXFLAGS+=" -Wno-error"
  export LDFLAGS="${LDFLAGS/-Wl,-z,pack-relative-relocs/}"

  _args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
#    -DUSE_LTO=$(nproc)
    -DUSE_LTO=OFF
    -DVERBOSE=ON
    -DENABLE_LDGOLD=OFF
    -DENABLE_EVENTCLIENTS=ON
    -DFFMPEG_PATH=/usr
    -DENABLE_INTERNAL_FFMPEG=OFF
    -DENABLE_INTERNAL_FMT=OFF
    -DENABLE_INTERNAL_SPDLOG=OFF
    -DENABLE_INTERNAL_CROSSGUID=OFF
    -DENABLE_INTERNAL_FSTRCMP=OFF
    -DENABLE_INTERNAL_FLATBUFFERS=OFF
    -DENABLE_INTERNAL_UDFREAD=OFF
    -DENABLE_MYSQLCLIENT=ON
    -DENABLE_VAAPI=ON
    -DENABLE_VDPAU=ON
    -DAPP_RENDER_SYSTEM=gles
    -DGBM_RENDER_SYSTEM=gles
    -DCORE_PLATFORM_NAME="${_platform}"
    -Dlibdvdcss_URL="$srcdir/$pkgbase-libdvdcss-$_libdvdcss_version.tar.gz"
    -Dlibdvdnav_URL="$srcdir/$pkgbase-libdvdnav-$_libdvdnav_version.tar.gz"
    -Dlibdvdread_URL="$srcdir/$pkgbase-libdvdread-$_libdvdread_version.tar.gz"
    -DENABLE_DVDCSS=ON
    -DCORE_PLATFORM_NAME="x11 wayland gbm"
    -DENABLE_AIRTUNES=OFF
  )

  if [[ $CARCH == "armv7h" ]]; then
    _args+=(
      -DWITH_ARCH=arm
      -DWITH_CPU=arm
    )
  elif [[ $CARCH == "aarch64" ]]; then
    _args+=(
      -DWITH_ARCH=aarch64
      -DWITH_CPU=aarch64
    )
  fi

export CMAKE_POLICY_VERSION_MINIMUM=3.5
  echo "building kodi"
  cmake "${_args[@]}" ../"$_gitname"
  make
}

# kodi
# components: kodi
package_kodi-ext-git() {
  pkgdesc="Kodi build with all external libraries"
  depends=(
    'bluez-libs' 'curl' 'dav1d' 'desktop-file-utils' 'hicolor-icon-theme'
    'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec' 'libmicrohttpd' 'libnfs'
    'libplist' 'libpulse' 'libva' 'libvdpau' 'libxslt' 'lirc' 'mariadb-libs'
    'mesa' 'python-pillow' 'python-pycryptodomex' 'python-simplejson'
    'smbclient' 'sqlite' 'taglib' 'tinyxml'
    'libxrandr' 'libxkbcommon' 'waylandpp' 'libinput' 'pcre'
    # external
    'ffmpeg' 'flatbuffers'
    'libdvdcss' 'libdvdnav' 'libdvdread' 'libudfread-git' 'fstrcmp'
    'fmt' 'spdlog' 'libcrossguid-git'
  )
  [[ -n "$_clangbuild" ]] && depends+=('glu')

  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python-pybluez: Bluetooth support'
    'pulseaudio: PulseAudio support'
    'upower: Display battery level'
  )
  provides=("kodi=${pkgver}" 'kodi-x11' 'kodi-wayland' 'kodi-gbm')
  replaces=('kodi' 'kodi-x11' 'kodi-wayland' 'kodi-gbm')
  conflicts=('kodi' 'kodi-x11' 'kodi-wayland' 'kodi-gbm')

  _components=(
    'kodi'
    'kodi-bin'
  )

  cd kodi-build
  for _cmp in ${_components[@]}; do
  DESTDIR="$pkgdir" /usr/bin/cmake \
    -DCMAKE_INSTALL_COMPONENT="$_cmp" \
     -P cmake_install.cmake
  done
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-kodi-send
package_kodi-ext-git-eventclients() {
  pkgdesc="Kodi Event Clients (master branch)"
  provides=("kodi-eventclients=${pkgver}")
  conflicts=('kodi-eventclients')
  optdepends=(
    'kodi: local machine eventclient use'
    'python: most eventclients are implemented in python'
  )

  _components=(
    'kodi-eventclients-common'
    'kodi-eventclients-ps3'
    'kodi-eventclients-kodi-send'
  )

  cd kodi-build
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

# kodi-tools-texturepacker
# components: kodi-tools-texturepacker
package_kodi-ext-git-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker tool (master branch)"
  provides=("kodi-tools-texturepacker=${pkgver}")
  conflicts=('kodi-tools-texturepacker')
  depends=('libpng' 'giflib' 'libjpeg-turbo' 'lzo')

  _components=(
    'kodi-tools-texturepacker'
  )

  cd kodi-build
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

# kodi-dev
# components: kodi-addon-dev kodi-eventclients-dev
package_kodi-ext-git-dev() {
  pkgdesc="Kodi dev files (master branch)"
  depends=('kodi-ext-git')
  provides=("kodi-dev=${pkgver}")
  conflicts=('kodi-dev')

  _components=(
    'kodi-addon-dev'
    'kodi-eventclients-dev'
  )

  cd kodi-build
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}
