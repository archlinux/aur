# Maintainer: Funami
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: witchymary
# Contributor: Takina Lina <0tkl.zhaoqing@gmail.com>

pkgname=aegisub-arch1t3cht-qt5-git
pkgver=3.2.2.r1036.66127f8c4
pkgrel=2
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (arch1t3cht fork)"
arch=('x86_64')
url="https://github.com/arch1t3cht/Aegisub"
license=('GPL' 'BSD')
provides=('aegisub')
conflicts=('aegisub' 'aegisub-arch1t3cht-git')
depends=('alsa-lib'
         'boost-libs'
         'ffmpeg'
         'ffms2'
         'fftw'
         'fontconfig'
         'hicolor-icon-theme'
         'hunspell'
         'icu'
         'jansson'
         'libass'
         'libgl'
         'libiconv'
         'libpulse'
         'openal'
         'portaudio'
         'uchardet'
         'wxwidgets-qt5'
         'zlib')
makedepends=('git' 'meson' 'cmake' 'boost')
optdepends=('vapoursynth: VapourSynth source support'
            'avisynthplus: AviSynth source support'
            'vapoursynth-plugin-lsmashsource: VapourSynth plugin used by default (LWLibavSource)'
            'vapoursynth-plugin-bestaudiosource: VapourSynth plugin used by default (BestAudioSource)'
            'vapoursynth-plugin-wwxd: VapourSynth plugin for keyframe generation'
            'vapoursynth-plugin-scxvid: VapourSynth plugin for keyframe generation')
source=("${pkgname}::git+https://github.com/arch1t3cht/Aegisub.git#branch=feature"
        "${pkgname}-bestsource::git+https://github.com/vapoursynth/bestsource.git#commit=530cc4b7a8e1d3b96ccf913eb8db9f5f8d7c565d"
        "${pkgname}-avisynth::git+https://github.com/AviSynth/AviSynthPlus.git#tag=v3.7.3"
        "${pkgname}-vapoursynth::git+https://github.com/vapoursynth/vapoursynth.git#tag=R63"
        "${pkgname}-luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
        "${pkgname}-gtest-1.13.0.tar.gz::https://github.com/google/googletest/archive/refs/tags/v1.13.0.tar.gz"
        "${pkgname}-gtest_1.13.0-1_patch.zip::https://wrapdb.mesonbuild.com/v2/gtest_1.13.0-1/get_patch"
        "${pkgname}-gtest.wrap::https://wrapdb.mesonbuild.com/v2/gtest_1.13.0-1/gtest.wrap")
noextract=("${pkgname}-gtest-1.13.0.tar.gz"
           "${pkgname}-gtest_1.13.0-1_patch.zip")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'ad7fdba11ea011c1d925b3289cf4af2c66a352e18d4c7264392fead75e919363'
            '6d82a02c3a45071cea989983bf6becde801cbbfd29196ba30dada0215393b082'
            '22da946c529535ad27cb434b03ca139695b014e4e65a2427833b64c559839571')

AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT=${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT:=PulseAudio}

pkgver() {
  cd "${pkgname}"
  tag='v3.2.2'
  printf "%s.r%s.%s" "${tag#v}" "$(git rev-list --count ${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"

  mv -f ../../"${pkgname}-gtest.wrap" subprojects/gtest.wrap
  sed -i 's/\tsort/\tstd::sort/' tests/tests/fs.cpp
  sed -i '26i#include <algorithm>' libaegisub/include/libaegisub/fs.h

  # If build dir exists (it won't ever if makepkg is passed --cleanbuild) call --reconfigure rather than setup without it which will fail)
  local MESON_FLAGS=''
  if [ -d build ]; then
    MESON_FLAGS='--reconfigure'
  else
    # Initialize subproject wraps for bestsource
    ln -s ../../"${pkgname}-bestsource" subprojects/bestsource

    # Initialize subproject wraps for avisynth
    mv ../"${pkgname}-avisynth" subprojects/avisynth

    # Initialize subproject wraps for vapoursynth
    ln -s ../../"${pkgname}-vapoursynth" subprojects/vapoursynth

    # Initialize subproject wraps for luajit
    ln -s ../../"${pkgname}-luajit" subprojects/luajit

    # Initialize subproject wraps for gtest
    mkdir subprojects/packagecache
    ln -s ../../../"${pkgname}-gtest-1.13.0.tar.gz" subprojects/packagecache/gtest-1.13.0.tar.gz
    ln -s ../../../"${pkgname}-gtest_1.13.0-1_patch.zip" subprojects/packagecache/gtest_1.13.0-1_patch.zip
  fi

  meson subprojects packagefiles --apply bestsource
  meson subprojects packagefiles --apply avisynth
  meson subprojects packagefiles --apply vapoursynth
  meson subprojects packagefiles --apply luajit

  # check if the OPTIONS array contains "!strip"
  check_makepkg_options() (
    source /etc/makepkg.conf

    if [ "$?" -ne 0 ]; then
      >&2 echo 'Failed to source /etc/makepkg.conf'
      echo release # use release as fallback buildtype
      return 1
    fi

    if [[ " ${OPTIONS[@]} " =~ ' !strip ' ]]; then
      >&2 echo '!strip found in OPTIONS array'
      echo debug
    else
      >&2 echo '!strip not found in OPTIONS array'
      echo release
    fi
  )
  local BUILDTYPE="$(check_makepkg_options 2> /dev/null)"

  echo -e "[binaries]\nwx-config = '/usr/bin/wx-config-qt'" > tmp.ini
  meson setup --native-file tmp.ini build

  # Disabling LTO because it seems to lead to crashing aegisub scripts for some people (https://aur.archlinux.org/packages/aegisub-arch1t3cht-git#comment-911741)
  arch-meson --buildtype="${BUILDTYPE}" -D b_lto=false -D default_audio_output="${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT}" ${MESON_FLAGS} build
}

build() {
  cd "${pkgname}"
  meson compile -C build
}

package() {
  cd "${pkgname}"
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
