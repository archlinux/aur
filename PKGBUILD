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

# define the applicaton render system, valid values are either 'gl' or 'gles'
_renderer=gles

pkgbase=kodi-stable-git
pkgname=("$pkgbase" "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev")
pkgver=r62310.f1caa0dc88b
pkgrel=1
arch=('x86_64')
url="https://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime<21' 'fmt' 'libaacs' 'libass'
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
  kodi-fmt-10.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/23571.patch
  flatb23.patch::https://github.com/xbmc/xbmc/commit/35be40daa39965a9ea5b3569eb7d515e6a14da5d.patch
  0001-ffmpeg-fix-build-with-binutils-update.patch
  https://github.com/xbmc/xbmc/pull/23227.patch
  https://github.com/xbmc/xbmc/commit/d2022ce1.patch
  https://github.com/xbmc/xbmc/commit/6f5dff4b.patch
  https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/24577.patch
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
        '45e4a4fc3ddd3bc2329b42a3f72c3e4fae1adb93e9d4b945a5aba3a70bee3ddce416fcb19061ad2263d1f247da5fc7143944408fb5294b762e45ac2f0981c06a'
        'bdc249920685a3738f872d9ea19a5c46b244d437d30b7dad958dcf33b5bfb88782c1a73bd15dcb1c26f0b643f1e4711775621a2753a1b5668efacc2144fd06e6'
        '7e15afcc0cc7f529e6c491c985968bc53be413424b890e4eab2ce8e3d0f21b08347698e660e0f4f0cc50c5279f052be7a2d84d5351509d34193066d797a44130'
        '0e205a9d4a371776cbeaacb88b5a915986d6e2b7b2d32d55e672902a6c6c6530573bbcd20557819f61a12e17931d43788e8508becd26778bcc151bd0838183d5'
        'ee94696b2e7cbdf904e271e205206a60c77571e167563a882fdeb4f0df49f53c9f38489148c697d8e694087f7fc2cf157f89c4787a4c519fac3736f976bfc854'
        '4338568d343e48bbd68855faf1c3affc90598bbed1b2f213053fbe1df81ec3ff4e463ee24f9a971e928df7b1ff47f6dd723790fb70eb65388bc3e0adcacb9ad4'
        '85c21d0c3e74a6c3184308c06deb0b523e721037ce8bd5e8fe3d84dc017bad63b8ef78ffdc9c9c8f24b9deb2732dd604c09f21979a900a60633c1c879e5e744b')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir "$srcdir/kodi-build"

  cd "$_gitname"

  rm -rf system/certs # remove not needed cacert

  patch -p1 -i ../0001-ffmpeg-fix-build-with-binutils-update.patch
  patch -p1 -i ../flatb23.patch
  patch -p1 -i ../23227.patch
  patch -p1 -i ../d2022ce1.patch
  patch -p1 -i ../6f5dff4b.patch
  patch -p1 -i ../24577.patch

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
    -DENABLE_SSE=ON
    -DENABLE_SSE2=ON
    -DENABLE_SSE3=ON
    -DENABLE_SSSE3=ON
    -DENABLE_SSE4_1=ON
    -DENABLE_SSE4_2=ON
    -DENABLE_AVX=ON
    -DENABLE_AVX2=ON
    -DUSE_LTO=$(nproc)
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
    -DAPP_RENDER_SYSTEM=$_renderer
  )

  # https://github.com/google/flatbuffers/issues/7404
  CXXFLAGS+=' -Wno-error=restrict'

  echo "building kodi"
  cmake "${_args[@]}" ../"$_gitname"
  make
}

# kodi
# components: kodi
package_kodi-stable-git() {
  pkgdesc="A software media player and entertainment hub for digital media (Nexus branch, $_renderer renderer)"
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
  conflicts=('kodi' 'kodi-gles' 'kodi-x11' 'kodi-wayland' 'kodi-gbm')

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

  # https://archlinux.org/todo/use-system-ca-store/
  mkdir -p "$pkgdir"/usr/share/kodi/system/certs
  ln -s /etc/ssl/cert.pem "$pkgdir"/usr/share/kodi/system/certs/cacert.pem

}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-kodi-send
package_kodi-stable-git-eventclients() {
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
package_kodi-stable-git-tools-texturepacker() {
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
package_kodi-stable-git-dev() {
  pkgdesc="Kodi dev files (Nexus branch)"
  depends=('kodi-stable-git')
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
