# vim:set ts=2 sw=2 et:
# Maintainer: Faruk Dikcizgi <boogiepop@gmx.de>
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

# set this to anything to build with clang rather than with gcc
_clangbuild=

pkgbase=kodi-matrix-mpp-git
pkgname=("$pkgbase" "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev" "$pkgbase-ffmpegdirect")
pkgver=r58204.f8fdeb6b1b1.481f5d6
pkgrel=6
arch=('aarch64' 'arm7f')
url="https://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libva'
  'libva-vdpau-driver' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'python-pycryptodomex' 'python-pillow' 'python-pybluez'
  'python-simplejson' 'shairplay' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'meson' 'gtest' 'graphviz'
  # wayland
  'wayland-protocols' 'waylandpp' 'libxkbcommon'
  # gbm
  'libinput'
  'mpp-git'
)
options=(!lto debug strip)

[[ -n "$_clangbuild" ]] && makedepends+=('clang' 'lld' 'llvm')

_gitname=xbmc
_gitnameff='inputstream.ffmpegdirect'
_codename=Matrix

# Found on their respective github release pages. One can check them against
# what is pulled down when not specifying them in the cmake step.
# $CHROOT/build/kodi-git/src/kodi-build/build/download
#
# https://github.com/xbmc/FFmpeg/tags
# https://github.com/xbmc/libdvdcss/tags
# https://github.com/xbmc/libdvdnav/tags
# https://github.com/xbmc/libdvdread/tags
#
# fmt and crossguid can be found http://mirrors.kodi.tv/build-deps/sources/
#
_libdvdcss_version="1.4.2-Leia-Beta-5"
_libdvdnav_version="6.0.0-Leia-Alpha-3"
_libdvdread_version="6.0.0-Leia-Alpha-3"
_ffmpeg_version="4.3.2-$_codename-19.2"
_fmt_version="6.1.2"
_spdlog_version="1.5.0"
_crossguid_version="8f399e8bd4"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="1.12.0"
_libudfread_version="1.1.0"
source=(
  "git+https://github.com/xbmc/xbmc.git#branch=$_codename"
  "git+https://github.com/xbmc/inputstream.ffmpegdirect.git#branch=$_codename"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fmt-$_fmt_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/spdlog-$_spdlog_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/libudfread-$_libudfread_version.tar.gz"
  0001-upstream-build-fixes-from-debian.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/22291.patch
  0002-ffmpeg-buildsys.patch
  0003-rkmpp-4.patch
  0004-build-fix-for-dav1d-1.0.0.patch
  0005-av_image_fill_plane_sizes.patch
  0006-ffmpegdirect-buildsys.patch
)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
  "fmt-$_fmt_version.tar.gz"
  "spdlog-$_spdlog_version.tar.gz"
  "crossguid-$_crossguid_version.tar.gz"
  "fstrcmp-$_fstrcmp_version.tar.gz"
  "flatbuffers-$_flatbuffers_version.tar.gz"
  "libudfread-$_libudfread_version.tar.gz"
)
b2sums=('SKIP'
        'SKIP'
        '283aa2cec0a2200d3569bc280cb9659e9224a6b3a77db8a35b269cd8caf1337ac9d8b92b806df66f63ef7458a46bd6261f0b8b14678b10e26644a79dcbeea5da'
        '7573434a0ae8e8ccabf48173f81fcde29074eb138e119a2ae9156cde3c3d8bfd716f5d0e605b97f2dcac21f570781137c8533c5ae306b51e3905822fda318355'
        '0c206acdaf0776841ab792c74e023af07d9539eb72e03ae164382a31ed950f60e5e15f1d055979d28f1398924471b294d11f064b11b8373353b3962a3777ff3c'
        '60299be16d73fb689b698f5b322d9cd38093894222070d2f1c28a37477a338405938959440a3f5646d946f3c2287072fdfa582b644a36f3a23e7d637b51113fc'
        '36e7451a8732c62dcbf47e6d287ea582827b6196a468b8648803ea1bc9a37a5f681d87488f748d749183d97783ac7fb47a3f2aeed64fc6a684f9ee85b67ae28d'
        'bac6c6650f8347458dd2dd66f318b43a769b0896d68f6a6f1310754527a69feaa52b2f6f48d67c7e811c2dafa5d3863a9a07c738df8c12abed2718fb06254b28'
        'e6f1f495adf541102e3b5ac11dfd14b770a52e23ef9d613bc6204f6493ff4df4da9ba290ad6c3a7e5c7fcf159cafdf355bfe668a4ddceb4329df934c65966d19'
        'a8b68fcb8613f0d30e5ff7b862b37408472162585ca71cdff328e3299ff50476fd265467bbd77b352b22bb88c590969044f74d91c5468475504568fd269fa69e'
        '441123be124ad851efa30bda0d828a764ebaf79ba6692a6e5904000b33818e9de78c3a964037ac93ef562890980c58169141e55354dce86857c02bcd917150d6'
        'e7fab72ebecb372c54af77b4907e53f77a5503af66e129bd2083ef7f4209ebfbed163ffd552e32b7181829664fff6ab82a1cdf00c81dc6f3cc6bfc8fa7242f6e'
        '321f37d22a20b6e3b6925c193b802e4ff3d0bef1148209028e0b56b0decca27978cf994125f93f0a624892c002e364c82ead0fe15781ab00e84b2faf8a8f4c9c'
        'bb4de2dad90880baff712d882754bb11c69bb123138bcba985fbef858fa3508a728ea703f228c1239293f537bb3b3d2a82333f690653fc4da989cc37e4696c05'
        '1a818e38b6f763d60ce50e4b0a5d26c86f833dd26dbcee352579d8395e6382b06ee816dad7938e3ea12a1e676251417ef4c090c21dca45f7decfba81694d3a2b'
        '6928d0fb1f4cb2609dee87c7078e02cecc37ddef263485b47be0ae5c281be67b403b39c95ea370c6b6667e1eceb1c7e6fb83ec9b04acd0bdbe4abec17fb84385'
        'e063edffb7d7deef1e9119ddf209df4f932c13ef0ef8b352de17da8ef6daafcdf85241b78f619bff520f00217bd10c53396ebe4b285e0415586fcabc2b1e617c'
        '943d358b4c127b77a691886a48245604081e3fdb5f05cd9a9821b52acf46bc6736089348f3299e00f35bbc09ba501d136088d96c7f118b3f5f3fe1cb7d77c7fd')

pkgver() {
  cd "$_gitname"
  local _kcommits="$(git rev-list --count HEAD)"
  local _kcommit="$(git rev-parse --short HEAD)"
  cd "../$_gitnameff"
  local _ffcommits="$(git rev-list --count HEAD)"
  local _ffcommit="$(git rev-parse --short HEAD)"
  local _revnum=$(($_kcommits + $_ffcommits))
  printf "r${_revnum}.${_kcommit}.${_ffcommit}"
}

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir -p "$srcdir/kodi-build"
  [[ -d ffdirect-build ]] && rm -rf ffdirect-build
  mkdir -p "$srcdir/ffdirect-build"
  # when built with debug enabled LTO needs more than 2gb size which larger than /tmp ond efault arch
  # we are creating a temporary tmp folder to satisfy LTO, otherwise linking stage will fail
  mkdir -p "$srcdir/tmp"

  cd "$_gitname"
  patch -p1 -N -i ../0001-upstream-build-fixes-from-debian.patch
  patch -p1 -N -i ../0002-ffmpeg-buildsys.patch 
  cp ../0003-rkmpp-4.patch tools/depends/target/ffmpeg
  cp ../0004-build-fix-for-dav1d-1.0.0.patch tools/depends/target/ffmpeg
  cp ../0005-av_image_fill_plane_sizes.patch tools/depends/target/ffmpeg

  cd ../"$_gitnameff"
  patch -p1 -N -i ../0006-ffmpegdirect-buildsys.patch 
  rm -rf depends/common/ffmpeg

  if [[ -n "$_clangbuild" ]]; then
    msg "Building with clang"
    export CC=clang CXX=clang++
  fi
}

build() {
  cd "$srcdir/kodi-build"

  _args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
    -DUSE_LTO=$(nproc)
    -DVERBOSE=ON
    -DENABLE_LDGOLD=OFF
    -DENABLE_EVENTCLIENTS=ON
    -DENABLE_INTERNAL_FFMPEG=ON
    -DENABLE_INTERNAL_FMT=ON
    -DENABLE_INTERNAL_SPDLOG=ON
    -DENABLE_INTERNAL_CROSSGUID=ON
    -DENABLE_INTERNAL_FSTRCMP=ON
    -DENABLE_INTERNAL_FLATBUFFERS=ON
    -DENABLE_INTERNAL_UDFREAD=ON
    -DENABLE_MYSQLCLIENT=ON
    -DENABLE_VAAPI=OFF
    -DENABLE_VDPAU=OFF
    -DAPP_RENDER_SYSTEM=gles
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz"
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz"
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz"
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz"
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz"
    -DSPDLOG_URL="$srcdir/spdlog-$_spdlog_version.tar.gz"
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz"
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz"
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz"
    -DUDFREAD_URL="$srcdir/libudfread-$_libudfread_version.tar.gz"
    -DAPP_RENDER_SYSTEM=gl
  )

  # https://github.com/google/flatbuffers/issues/7404
  CXXFLAGS+=' -Wno-error=restrict'

  echo "building kodi"
  cmake "${_args[@]}" ../"$_gitname"
  TMPDIR="$srcdir/tmp" make -j$(nproc)
  
  cd "$srcdir/ffdirect-build"
  echo "building ffmpeg-direct"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
        -DCMAKE_BUILD_TYPE=Release \
	    -DADDONS_TO_BUILD=$_gitnameff \
	    -DADDON_SRC_PREFIX="../$_gitnameff/.." \
	    "../$_gitname/cmake/addons"
  FFMPEG_PATH=$srcdir/kodi-build/build make -j$(nproc) 
}

# kodi
# components: kodi
package_kodi-matrix-mpp-git() {
  pkgdesc="A software media player and entertainment hub for digital media (Matrix branch) with Rockchip MPP hardware acceleration"
  depends=(
    'bluez-libs' 'curl' 'dav1d' 'desktop-file-utils' 'hicolor-icon-theme'
    'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec' 'libmicrohttpd' 'libnfs'
    'libplist' 'libpulse' 'libva' 'libvdpau' 'libxslt' 'lirc' 'mariadb-libs'
    'mesa' 'python-pillow' 'python-pycryptodomex' 'python-simplejson'
    'shairplay' 'smbclient' 'sqlite' 'taglib' 'tinyxml'
    'libxrandr' 'libxkbcommon' 'waylandpp' 'libinput'
    'pcre' 'mpp-git'
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
  
  # avoid error <general>: GetDirectory - Error getting /usr/lib/kodi/addons
  mkdir -p "$pkgdir"/usr/lib/kodi/addons
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-kodi-send
package_kodi-matrix-mpp-git-eventclients() {
  pkgdesc="Kodi Event Clients (Matrix branch)"
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
package_kodi-matrix-mpp-git-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker tool (Matrix branch)"
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

package_kodi-matrix-mpp-git-ffmpegdirect() {
  pkgdesc="Inputstream ffmpegdirect kodi binary addon (Matrix branch) supporting Rockchip MPP hardware acceleration"
  provides=('kodi-addon-inputstream-ffmpegdirect')
  conflicts=('kodi-addon-inputstream-ffmpegdirect')
  depends=('kodi' 'kodi-matrix-mpp-git')
  
  cd "$srcdir/ffdirect-build"
  install -d "${pkgdir}/usr"
  mv .install/lib "${pkgdir}/usr/"
  mv .install/share "${pkgdir}/usr/"
}

# kodi-dev
# components: kodi-addon-dev kodi-eventclients-dev
package_kodi-matrix-mpp-git-dev() {
  pkgdesc="Kodi dev files (Matrix branch) with Rockchip MPP hardware acceleration"
  depends=('kodi-matrix-mpp-git')
  provides=("kodi-matrix-dev=${pkgver}" "kodi-dev=${pkgver}")
  conflicts=('kodi-matrix-dev' "kodi-dev")

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