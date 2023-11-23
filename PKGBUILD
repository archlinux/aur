# Maintainer: Funami
# Maintainer: Takina Lina <0tkl.zhaoqing@gmail.com>
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: witchymary

pkgname=aegisub-arch1t3cht-qt5-git
_subproj=aegisub-arch1t3cht-sub
pkgver=3.2.2.r1103.20caaabc0
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (arch1t3cht fork)"
arch=('x86_64')
url="https://github.com/arch1t3cht/Aegisub"
license=(
  GPL
  BSD
)
provides=(aegisub)
conflicts=(
  aegisub
  aegisub-arch1t3cht
  aegisub-arch1t3cht-git
)
depends=(
  alsa-lib
  boost-libs
  ffmpeg
  ffms2
  fftw
  fontconfig
  hicolor-icon-theme
  hunspell
  icu
  jansson
  libass
  libgl
  libpulse
  openal
  portaudio
  python
  uchardet
  vapoursynth
  wxwidgets-common
  wxwidgets-qt5
  zlib
)
makedepends=(
  git
  meson
  cmake
  boost
)
optdepends=('avisynthplus: AviSynth source support'
            'vapoursynth-plugin-lsmashsource: VapourSynth plugin used by default (LWLibavSource)'
            'vapoursynth-plugin-bestsource: VapourSynth plugin used by default (BestSource)'
            'vapoursynth-plugin-wwxd: VapourSynth plugin for keyframe generation'
            'vapoursynth-plugin-scxvid: VapourSynth plugin for keyframe generation')
source=(
  "$pkgname::git+https://github.com/arch1t3cht/Aegisub.git#branch=feature"
  "$pkgname-bestsource::git+https://github.com/vapoursynth/bestsource.git#branch=master"
  "$_subproj-avisynth::git+https://github.com/AviSynth/AviSynthPlus.git#tag=v3.7.3"
  "$pkgname-vapoursynth::git+https://github.com/vapoursynth/vapoursynth.git#tag=R65"
  "$pkgname-luajit::git+https://luajit.org/git/luajit.git#branch=v2.1"
  "$pkgname-gtest-1.14.0.tar.gz::https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz"
  "$pkgname-gtest_1.14.0-1_patch.zip::https://wrapdb.mesonbuild.com/v2/gtest_1.14.0-1/get_patch"
  "$pkgname-gtest.wrap::https://wrapdb.mesonbuild.com/v2/gtest_1.14.0-1/gtest.wrap"
)
noextract=(
  $pkgname-gtest-1.14.0.tar.gz
  $pkgname-gtest_1.14.0-1_patch.zip
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7'
  '2e693c7d3f9370a7aa6dac802bada0874d3198ad4cfdf75647b818f691182b50'
  '2ba6bda5e7afa70d4aafc3a262a4eda0dce9a9cee72f5d0f00056cef645dd06b'
)

pkgver() {
  cd $pkgname
  tag='v3.2.2'
  printf "%s.r%s.%s" "${tag#v}" "$(git rev-list --count $tag..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname

  cp -f $srcdir/$pkgname-gtest.wrap subprojects/gtest.wrap
  sed -i 's/\tsort/\tstd::sort/' tests/tests/fs.cpp
  sed -i '26i#include <algorithm>' libaegisub/include/libaegisub/fs.h
  sed -i '55s/-1, Get/-1, 0, Get/' src/audio_provider_bestsource.cpp
  sed -i '111s/0, ""/0, 0, ""/' src/video_provider_bestsource.cpp

  # If build dir exists (it won't ever if makepkg is passed --cleanbuild) call --reconfigure rather than setup without it which will fail)
  local MESON_FLAGS=''
  if [ -d build ]; then
    MESON_FLAGS='--reconfigure'
  else
    # Initialize subproject wraps for bestsource
    ln -s "$srcdir/$pkgname-bestsource" subprojects/bestsource

    # Initialize subproject wraps for avisynth
    ln -s "$srcdir/$_subproj-avisynth" subprojects/avisynth

    # Initialize subproject wraps for vapoursynth
    ln -s "$srcdir/$pkgname-vapoursynth" subprojects/vapoursynth

    # Initialize subproject wraps for luajit
    ln -s "$srcdir/$pkgname-luajit" subprojects/luajit

    # Initialize subproject wraps for gtest
    mkdir subprojects/packagecache
    ln -s "$srcdir/$pkgname-gtest-1.14.0.tar.gz" subprojects/packagecache/gtest-1.14.0.tar.gz
    ln -s "$srcdir/$pkgname-gtest_1.14.0-1_patch.zip" subprojects/packagecache/gtest_1.14.0-1_patch.zip
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
  arch-meson --buildtype="${BUILDTYPE}" -D default_audio_output=PulseAudio -D vapoursynth=enabled --native-file tmp.ini ${MESON_FLAGS} build
}

build() {
  cd $pkgname
  meson compile -C build
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
}
