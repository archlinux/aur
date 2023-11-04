# This PKGBUILD is based on kodi-rpi-git from archlinuxarm: https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/kodi-rpi-git/PKGBUILD
# Patches are from the Libreelec project
# Maintainer: mmustermann
# Contributor graysky <therealgraysky AT proton DOT me>
# Contributor BlackIkeEagle < ike DOT devolder AT gmail DOT com>
# Contributor Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor Oleg Rakhmanov <oleg [at] archlinuxarm [dot] com>
# Contributor tomasgroth at yahoo.dk
# Contributor WarheadsSE <max@warheads.net>
# Contributor Adrian Fedoreanu <adrian [dot] fedoreanu [at] gmail [dot] com>

pkgbase=kodi-rockpro64-git
pkgname=(
  'kodi-rockpro64-git'
  'kodi-rockpro64-git-eventclients' 'kodi-rockpro64-git-tools-texturepacker' 'kodi-rockpro64-git-dev'
)

_commitnumber=62264
_commit=55669b9bb0f8d99f885f4371c923a98d10ab91ec
_libreelec_patch_commit=31e954652755be1a0ccaaa5ecf601e98b6a97741

# set this to anything to build with clang
# recommend manually setting -DUSE_LTO=OFF to -DUSE_LTO=$(nproc) in build()
_clangbuild=

pkgver="21.x.$_commitnumber.${_commit:0:10}"
pkgrel=1
arch=('armv7h' 'aarch64')
url="https://github.com/xbmc/xbmc"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'fmt' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse'
  'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'pipewire' 'python-pycryptodomex' 'python-pillow' 'python-pybluez'
  'python-simplejson' 'shairplay' 'smbclient' 'sndio' 'spdlog' 'taglib'
  'tinyxml' 'swig' 'upower' 'giflib' 'rapidjson' 'ghostscript' 'meson' 'gtest'
  'graphviz' 'libinput' 'libxkbcommon' 'pcre' 'patchutils'
)
# there are incompatibilities with recent java releases
# see: sttps://bugs.archlinux.org/task/79844
# armv7h needs v17 but aarch64 be use a later one
makedepends_armv7h=('jdk17-openjdk')
makedepends_aarch64=('java-environment<21')


[[ -n "$_clangbuild" ]] && makedepends+=('clang' 'lld' 'llvm')

_codename=Nexus
_init_version=1.136
_libdvdcss_version="1.4.3-Next-Nexus-Alpha2-2"
_libdvdnav_version="6.1.1-Next-Nexus-Alpha2-2"
_libdvdread_version="6.1.3-Next-Nexus-Alpha2-2"
_ffmpeg_version="6.0"
_crossguid_version="ca1bf4b810e2d188d04cb6286f957008ee1b7681"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="23.3.3"
_libudfread_version="1.1.2"
source=(
  "xbmc-$pkgver.tar.gz::https://github.com/xbmc/xbmc/archive/$_commit.tar.gz"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "https://ffmpeg.org/releases/ffmpeg-$_ffmpeg_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
  "https://mirrors.kodi.tv/build-deps/sources/libudfread-$_libudfread_version.tar.gz"
  "ArchARM-kodi-init-v$_init_version.tar.gz::https://github.com/graysky2/kodi-standalone-service/archive/v$_init_version.tar.gz"
  kodi.config.txt
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/multimedia/ffmpeg/patches/v4l2-drmprime/ffmpeg-001-v4l2-drmprime.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/multimedia/ffmpeg/patches/vf-deinterlace-v4l2m2m/ffmpeg-001-vf-deinterlace-v4l2m2m.patch"
  #"https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/ffmpeg/ffmpeg-0001-deint_v4l2m2m-increase-input-and-output-buffers.patch"

  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0001-WIP-DVDVideoCodecDRMPRIME-add-support-for-filters.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0002-WIP-DRMPRIME-deinterlace-filter.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0003-DVDVideoCodecDRMPRIME-Avoid-exception-with-AV_PIX_FM.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0004-DVDVideoCodecDRMPRIME-Leave-deinterlace-filter-activ.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0005-SetVideoInterlaced-Set-and-unset-deinterlace-method-.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0006-DVDVideoCodecDRMPRIME-Close-deinterlace-filter-on-er.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0007-DVDVideoCodecDRMPRIME-Fix-missing-flush-after-eof.patch"

)
backup=(boot/kodi.config.txt etc/conf.d/kodi-standalone)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
#  "ffmpeg-$_ffmpeg_version.tar.gz"
  "crossguid-$_crossguid_version.tar.gz"
  "fstrcmp-$_fstrcmp_version.tar.gz"
  "flatbuffers-$_flatbuffers_version.tar.gz"
  "libudfread-$_libudfread_version.tar.gz"
)
sha256sums=('8b8cb827944a92fb935b1fa5d7834626f9ae1c3f6543456cd378826ab8c2eaf5'
            'f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e'
            '584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc'
            '719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62'
            'f4ccf961403752c93961927715f524576d1f4dd02cd76d8c76aed3bbe6686656'
            '6be27e0b3a4907f0cd3cfadec255ee1b925569e1bd06e67a4d2f4267299b69c4'
            'e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476'
            '8aff985da30aaab37edf8e5b02fda33ed4cbdd962699a8e2af98fdef306f4e4d'
            '2bf16726ac98d093156195bb049a663e07d3323e079c26912546f4e05c77bac5'
            'b94c70baa45e30346224ceecfab031dd183e09303b1f97d6522f9941da9b0067'
            '92d063169017bf9e1770d8a7cce77c0c55d197692d10820a7e4aecad9e58178c'
            '049893899d51cf185e5c56621eaadc33dac17995b59ec282cafc5709afb8d7e7'
            'c940e45211fe0c466e612cc7d42e8b5d4a26ec72db7077d94d0fd18cf62a90f5'
            '6154319c8b4cb8b9cb06b8f95361dcd738203f36ea763b9c485b5a07a5ccca6c'
            'a8961e574c9f04f5f30bee25674754e87ef9840188794fd807082d617da9b203'
            '552d5863c8bb0c2254351e24de95e5786d93de477282a7a10e229966c01f4abe'
            '12134d1964b05625351f88a51d4656029d35f6e153b638d8992922e24c23a974'
            '61c3eecb06ddf9b4d66d73125366bc497671c99cd9552dc47b55bc8223b9e2d1'
            '3d8e60f5281e0dab50e84cfa6666e0fa3519c4d6d0219f6e41d66d9e4552b18d'
            '11ad37e1d540cec0fe07810b81a02b699abef65139c031b59b10d45c1736be1c'
            'bb59e5ed6ebf9915289f1ed8371601e91d11b18b2bebb629659078949e6a961c')

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir "$srcdir/kodi-build"

  cd ffmpeg-${_ffmpeg_version}

  for file in ../ffmpeg-*.patch
  do
    sed 's|^\+#include <drm_fourcc.h>$|+#include <libdrm/drm_fourcc.h>|g' ${file} > ${file}.mod
  done

  git apply -v ../ffmpeg-001*.patch.mod

  cd ..
  cd xbmc-${_commit}

  git apply -v ../0001*.patch
  git apply -v ../0002*.patch
  git apply -v ../0003*.patch
  git apply -v ../0004*.patch
  git apply -v ../0005*.patch
  git apply -v ../0006*.patch
  git apply -v ../0007*.patch
}

build() {
  cd "$srcdir/kodi-build"

  # -march= defined in /etc/makepkg.conf will override the value for -mcpu we
  # uses here so unset them and redefine below
  unset CFLAGS CXXFLAGS

  if [[ $CARCH = "armv7h" ]]; then
    # we use -mcpu=cortex-a53 rather than cortex-a72 to maximize RPi 3B and RPi 4B/400 compatibility
    # in a single package which is consistent with how LibreELEC is currently built, see:
    # https://github.com/LibreELEC/LibreELEC.tv/commit/8e6605f6da56f25a00272b1cbacb93d40200153f#commitcomment-46341034
    CFLAGS="-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard"
  elif [[ $CARCH = "aarch64" ]]; then
    # note that we use a value of cortex-a53 here to allow RPi3 and RPi4 to use the same package
    # consistent with rationale of previous comment
    CFLAGS="-mcpu=cortex-a53"
  fi

  CFLAGS+=" -O2 -pipe -fstack-protector-strong -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection"
  CXXFLAGS+="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"

  if [[ -n "$_clangbuild" ]]; then
    export CC=clang CXX=clang++
    # depending on your build system, optionally redefine DISTCC_HOSTS
    # since current toolchain does not include clang support x86_64 volunteers
    #unset DISTCC_HOSTS
    #export DISTCC_HOSTS="localhost/5 10.0.1.103/5:3636"
  fi

  _args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
    -DUSE_LTO=OFF
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
    -DENABLE_VAAPI=OFF
    -DENABLE_VDPAU=OFF
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
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version"
#    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz"
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz"
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz"
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz"
    -DUDFREAD_URL="$srcdir/libudfread-$_libudfread_version.tar.gz"
    -DAPP_RENDER_SYSTEM=gles
    -DCORE_PLATFORM_NAME="x11 gbm"
  )

  # https://github.com/google/flatbuffers/issues/7404
  CXXFLAGS+=' -Wno-error=restrict'

  echo "building kodi"
  cmake "${_args[@]}" ../"xbmc-$_commit"
  make
}

package_kodi-rockpro64-git() {
  pkgdesc="Media player and entertainment hub with hw accel for PINE64's ROCKPro64"
  depends=(
    'bluez-libs' 'curl' 'dav1d' 'desktop-file-utils' 'hicolor-icon-theme' 'fmt'
    'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec' 'libmicrohttpd' 'libnfs'
    'libplist' 'libpulse' 'libxslt' 'lirc' 'mariadb-libs' 'mesa' 'libpipewire'
    'python-pillow' 'python-pycryptodomex' 'python-simplejson'
    'shairplay' 'smbclient' 'sndio' 'spdlog' 'sqlite' 'taglib' 'tinyxml'
    'libxkbcommon' 'polkit' 'linux>=5.4.35' 'lzo' 'libinput' 'pcre' 'libdisplay-info' 'tinyxml2'
  )
  [[ -n "$_clangbuild" ]] && depends+=('glu')

  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'linux-rpi: HW accelerated decoding'
    'python-pybluez: Bluetooth support'
    'pulseaudio: PulseAudio support'
    'pipewire: PipeWire support'
  )
  install='kodi.install'
  provides=('xbmc' "kodi=${pkgver}" "kodi-common=${pkgver}")
  conflicts=('xbmc' 'kodi' 'arm-mem-git' 'shairplay-git' 'kodi-rbp4-git' 'kodi-rpi' 'kodi-rpi-legacy' 'kodi-rpi-git')
  replaces=('xbmc-rbp-git' 'kodi-rbp4-git')

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

  # setup video drivers for kodi-gbm
  install -Dm0644 "$srcdir/kodi.config.txt" "$pkgdir/boot/kodi.config.txt"

  # rpi4 wants 512 MB of memory
  # this might be a problem for RPi3 ???
  sed -i 's/@@@/512/' "$pkgdir/boot/kodi.config.txt"

  _initshit="$srcdir/kodi-standalone-service-$_init_version/arm"

  # fix permissions necessary for accelerated video playback
  install -Dm0644 "$_initshit/udev/99-kodi.rules" "$pkgdir/usr/lib/udev/rules.d/99-kodi.rules"

  # environment vars
  install -Dm644 "${_initshit/\/arm}"/common/kodi-standalone "$pkgdir/etc/conf.d/kodi-standalone"

  # systemd manages kodi user
  install -Dm644 "$_initshit"/init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi.conf"
  install -Dm644 "$_initshit"/init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi.conf"

  # systemd service and polkit rules
  install -Dm0644 "$_initshit/init/kodi.service" "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -Dm0644 "$_initshit/polkit/polkit.rules" "$pkgdir/usr/share/polkit-1/rules.d/10-kodi.rules"
  chmod 0750 "$pkgdir/usr/share/polkit-1/rules.d/"

  # man page
  install -Dm0644 "$_initshit/doc/kodi.service.1" "$pkgdir/usr/share/man/man1/kodi.service.1"

  # avoid error <general>: GetDirectory - Error getting /usr/lib/kodi/addons
  # https://bugs.archlinux.org/task/77366
  mkdir -p "$pkgdir"/usr/lib/kodi/addons
}

package_kodi-rockpro64-git-eventclients() {
  pkgdesc="Kodi Event Clients"
  provides=("kodi-eventclients=${pkgver}")
  conflicts=('kodi-eventclients' 'kodi-eventclients-rbp4-git' 'kodi-rpi-eventclients' 'kodi-rpi-legacy-eventclients' 'kodi-rpi-git-eventclients')
  replaces=('kodi-eventclients-rbp4-git')
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

package_kodi-rockpro64-git-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker Tool"
  depends=('libpng' 'giflib' 'libjpeg-turbo' 'lzo')
  conflicts=('kodi-tools-texturepacker' 'kodi-tools-texturepacker-rbp4-git' 'kodi-rpi-tools-texturepacker' 'kodi-rpi-legacy-tools-texturepacker' 'kodi-rpi-git-tools-texturepacker')
  replaces=('kodi-tools-texturepacker-rbp4-git')

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

package_kodi-rockpro64-git-dev() {
  pkgdesc="Kodi dev files"
  depends=('kodi')
  conflicts=('kodi-dev-rbp4-git' 'kodi-rpi-dev' 'kodi-rpi-legacy-dev' 'kodi-rpi-git-dev')
  replaces=('kodi-dev-rbp4-git')
  provides=("kodi-dev=${pkgver}")

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
