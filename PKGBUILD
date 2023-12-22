# vim:set ts=2 sw=2 et:
# Maintainer graysky <therealgraysky AT protonmail DOT com>
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

# set this to anything to build with clang rather than with gcc
_clangbuild=

pkgbase=kodi-nexus-git
pkgname=("$pkgbase" "$pkgbase-gles" "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev")
pkgver=r62252.b8fafb0a41d
pkgrel=1
arch=('x86_64')
url="https://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-environment<21' 'fmt' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libva'
  'libva-vdpau-driver' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'pipewire' 'python-pycryptodomex' 'python-pillow' 'python-pybluez'
  'python-simplejson' 'shairplay' 'smbclient' 'sndio' 'spdlog' 'taglib'
  'tinyxml' 'swig' 'upower' 'giflib' 'rapidjson' 'ghostscript' 'meson' 'gtest'
  'graphviz' 'pcre'
  # wayland
  'wayland-protocols' 'waylandpp' 'libxkbcommon'
  # gbm
  'libinput'
)
options=(!lto)

[[ -n "$_clangbuild" ]] && makedepends+=('clang' 'lld' 'llvm')

_gitname=xbmc
_codename=Nexus
_sse_workaround=1

# Found on their respective github release pages. One can check them against
# what is pulled down when not specifying them in the cmake step.
# $CHROOT/build/kodi-git/src/kodi-build/build/download
#
# https://github.com/xbmc/FFmpeg/tags
# https://github.com/xbmc/libdvdcss/tags
# https://github.com/xbmc/libdvdnav/tags
# https://github.com/xbmc/libdvdread/tags
#
_libdvdcss_version="1.4.3-Next-Nexus-Alpha2-2"
_libdvdnav_version="6.1.1-Next-Nexus-Alpha2-2"
_libdvdread_version="6.1.3-Next-Nexus-Alpha2-2"
_ffmpeg_version="4.4.1-Nexus-Alpha1"
_crossguid_version="ca1bf4b810e2d188d04cb6286f957008ee1b7681"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="23.3.3"
_libudfread_version="1.1.2"
source=(
  "git+https://github.com/xbmc/xbmc.git#branch=$_codename"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/libudfread-$_libudfread_version.tar.gz"
  cheat-sse-build.patch
  kodi-fmt-10.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/23571.patch
  flatb23.patch::https://github.com/xbmc/xbmc/commit/35be40daa39965a9ea5b3569eb7d515e6a14da5d.patch
  0001-ffmpeg-fix-build-with-binutils-update.patch
)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz"
  "crossguid-$_crossguid_version.tar.gz"
  "fstrcmp-$_fstrcmp_version.tar.gz"
  "flatbuffers-$_flatbuffers_version.tar.gz"
  "libudfread-$_libudfread_version.tar.gz"
)
b2sums=('SKIP'
        '2f503d3ab767094958f7ec10b4ad11ffd02665deee571c8f3c739bef5fc7e2ff84babc5a3fdee638dc095f896b72fe3ce65e6b688674cb5f7b7b77190992688c'
        'db4d05836d8fbb3637ae50bdbfc0e4b612ee6b3be24addfea94ce772c3bf28d58b63a3f252d6f9f016f72f8cbb841cc1820b091226b136f4c4664385a32da73c'
        'c94feb5a03a12efa5b7767965118d2500a088299ea36f3b82e46d157e45893e6b04503cb50f179ca681bac914457607fab26acfa6e304752b355c407578572d1'
        '51d310e7000aeba657d55341c5fdb540474e197b85062228ab4b314c8309ec11985aa7f105193333fc6106529e8e58c86eafe268190894be8532d0e0b9065fa6'
        '0f78a8ab5a420297f666b3b8156d499a9141ec25c049d4d2bb2ba594dc585abe211a149b83c605cce4f5530207231a065d5f3a87a0c969781de8c6381afa2527'
        'a8b68fcb8613f0d30e5ff7b862b37408472162585ca71cdff328e3299ff50476fd265467bbd77b352b22bb88c590969044f74d91c5468475504568fd269fa69e'
        'be5e3c8ea81ce4b6f2e2c1b2f22e1172434c435f096fa7dade060578c506cff0310e3e2ef0627e26ce2be44f740652eb9a8e1b63578c18f430f7925820f04e66'
        '1801d84a0ca38410a78f23e7d44f37e6d53346753c853df2e7380d259ce1ae7f0c712825b95a5753ad0bc6360cfffe1888b9e7bc30da8b84549e0f1198248f61'
        '6d647177380c619529fb875374ec46f1fff6273be1550f056c18cb96e0dea8055272b47664bb18cdc964496a3e9007fda435e67c4f1cee6375a80c048ae83dd0'
        '45e4a4fc3ddd3bc2329b42a3f72c3e4fae1adb93e9d4b945a5aba3a70bee3ddce416fcb19061ad2263d1f247da5fc7143944408fb5294b762e45ac2f0981c06a'
        'bdc249920685a3738f872d9ea19a5c46b244d437d30b7dad958dcf33b5bfb88782c1a73bd15dcb1c26f0b643f1e4711775621a2753a1b5668efacc2144fd06e6'
        '7e15afcc0cc7f529e6c491c985968bc53be413424b890e4eab2ce8e3d0f21b08347698e660e0f4f0cc50c5279f052be7a2d84d5351509d34193066d797a44130')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  [[ -d "$srcdir/kodi-build" ]] && rm -rf "$srcdir/kodi-build"
  mkdir "$srcdir/kodi-build"
  [[ -d "$srcdir/kodi-build-gles" ]] && rm -rf "$srcdir/kodi-build-gles"
  mkdir "$srcdir/kodi-build-gles"

  cd "$_gitname"

  [[ "$_sse_workaround" -eq 1 ]] && patch -p1 -i "$srcdir/cheat-sse-build.patch"

  patch -p1 -i ../0001-ffmpeg-fix-build-with-binutils-update.patch
  patch -p1 -i ../flatb23.patch

  if [[ -n "$_clangbuild" ]]; then
    msg "Building with clang"
    export CC=clang CXX=clang++
  fi
}

build() {

  _args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
    -DUSE_LTO=$(nproc)
    -DVERBOSE=ON
    -DENABLE_LDGOLD=OFF
    -DENABLE_AIRTUNES=ON
    -DENABLE_AVAHI=ON
    -DENABLE_BLURAY=ON
    -DENABLE_CEC=ON
    -DENABLE_DBUS=ON
    -DENABLE_DVDCSS=ON
    -DENABLE_EGL=ON
    -DENABLE_EVENTCLIENTS=ON
    -DENABLE_MICROHTTPD=ON
    -DENABLE_MYSQLCLIENT=ON
    -DENABLE_NFS=ON
    -DENABLE_OPTICAL=ON
    -DENABLE_SMBCLIENT=ON
    -DENABLE_UDEV=ON
    -DENABLE_UPNP=ON
    -DENABLE_VAAPI=ON
    -DENABLE_VDPAU=ON
    -DENABLE_XSLT=ON
    -DENABLE_LIRCCLIENT=ON
    -DENABLE_INTERNAL_RapidJSON=OFF
    -DENABLE_INTERNAL_FFMPEG=ON
    -DENABLE_INTERNAL_CROSSGUID=ON
    -DENABLE_INTERNAL_FSTRCMP=ON
    -DENABLE_INTERNAL_FLATBUFFERS=ON
    -DENABLE_INTERNAL_UDFREAD=ON
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz"
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz"
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz"
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz"
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz"
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz"
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz"
    -DUDFREAD_URL="$srcdir/libudfread-$_libudfread_version.tar.gz"
  )

  # https://github.com/google/flatbuffers/issues/7404
  CXXFLAGS+=' -Wno-error=restrict'

  echo "building kodi"
  cd "$srcdir/kodi-build"
  cmake "${_args[@]}" -DAPP_RENDER_SYSTEM=gl ../"$_gitname"
  make

  echo "building kodi-gles"
  cd "$srcdir/kodi-build-gles"
  cmake "${_args[@]}" -DAPP_RENDER_SYSTEM=gles ../"$_gitname"
  make
}

# kodi
# components: kodi
package_kodi-nexus-git() {
  pkgdesc="A software media player and entertainment hub for digital media (gl renderer, Nexus branch)"
  depends=(
    'bluez-libs' 'curl' 'dav1d' 'desktop-file-utils' 'hicolor-icon-theme' 'fmt'
    'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec' 'libmicrohttpd' 'libnfs'
    'libplist' 'libpulse' 'libva' 'libvdpau' 'libxslt' 'lirc' 'lzo'
    'mariadb-libs' 'mesa' 'libpipewire' 'python-pillow' 'python-pycryptodomex'
    'python-simplejson' 'shairplay' 'smbclient' 'sndio' 'spdlog' 'sqlite'
    'taglib' 'tinyxml' 'libxrandr' 'libxkbcommon' 'waylandpp' 'libinput'
    'pcre'
  )
  [[ -n "$_clangbuild" ]] && depends+=('glu')

  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python-pybluez: Bluetooth support'
    'pulseaudio: PulseAudio support'
    'pipewire: PipeWire support'
    'upower: Display battery level'
  )
  provides=("kodi-common=${pkgver}" 'kodi-x11' 'kodi-wayland' 'kodi-gbm')
  conflicts=('kodi-gles' 'kodi-x11' 'kodi-wayland' 'kodi-gbm')

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

  # avoid error <general>: GetDirectory - Error getting /usr/lib/kodi/addons
  # https://bugs.archlinux.org/task/77366
  mkdir -p "$pkgdir"/usr/lib/kodi/addons
}
# kodi
# components: kodi
package_kodi-nexus-git-gles() {
  pkgdesc="A software media player and entertainment hub for digital media (gles renderer, Nexus branch)"
  depends=(
    'bluez-libs' 'curl' 'dav1d' 'desktop-file-utils' 'hicolor-icon-theme' 'fmt'
    'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec' 'libmicrohttpd' 'libnfs'
    'libplist' 'libpulse' 'libva' 'libvdpau' 'libxslt' 'lirc' 'lzo'
    'mariadb-libs' 'mesa' 'libpipewire' 'python-pillow' 'python-pycryptodomex'
    'python-simplejson' 'shairplay' 'smbclient' 'sndio' 'spdlog' 'sqlite'
    'taglib' 'tinyxml' 'libxrandr' 'libxkbcommon' 'waylandpp' 'libinput'
    'pcre'
  )
  [[ -n "$_clangbuild" ]] && depends+=('glu')

  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python-pybluez: Bluetooth support'
    'pulseaudio: PulseAudio support'
    'pipewire: PipeWire support'
    'upower: Display battery level'
  )
  provides=("kodi-common=${pkgver}" "kodi=${pkgver}" 'kodi-x11' 'kodi-wayland' 'kodi-gbm')
  conflicts=('kodi' 'kodi-x11' 'kodi-wayland' 'kodi-gbm')

  _components=(
    'kodi'
    'kodi-bin'
  )

  cd kodi-build-gles
  for _cmp in ${_components[@]}; do
  DESTDIR="$pkgdir" /usr/bin/cmake \
    -DCMAKE_INSTALL_COMPONENT="$_cmp" \
     -P cmake_install.cmake
  done

  # avoid error <general>: GetDirectory - Error getting /usr/lib/kodi/addons
  # https://bugs.archlinux.org/task/77366
  mkdir -p "$pkgdir"/usr/lib/kodi/addons
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-kodi-send
package_kodi-nexus-git-eventclients() {
  pkgdesc="Kodi Event Clients (Nexus branch)"
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
package_kodi-nexus-git-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker tool (Nexus branch)"
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
package_kodi-nexus-git-dev() {
  pkgdesc="Kodi dev files (Nexus branch)"
  depends=('kodi-nexus-git')
  provides=("kodi-nexus-dev=${pkgver}")
  conflicts=('kodi-nexus-dev')

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
