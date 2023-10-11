# Maintainer: Funami
# Maintainer: Takina Lina <0tkl.zhaoqing@gmail.com>
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: witchymary

pkgname=aegisub-arch1t3cht
pkgver=feature_10
_aspver=3.7.3
_vsver=R65-RC1
pkgrel=5
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (arch1t3cht fork)"
arch=(x86_64)
url=https://github.com/arch1t3cht/Aegisub
license=(
  GPL
  BSD
)
provides=(aegisub)
conflicts=(
  aegisub
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
  vapoursynth-plugin-bestsource-git
  vapoursynth-plugin-lsmashsource
  vapoursynth-plugin-wwxd-git
  wxwidgets-common
  wxwidgets-gtk3
  zlib
)
makedepends=(
  git
  meson
  cmake
  boost
)
optdepends=(
  'avisynthplus: AviSynth source support'
  # 'vapoursynth-plugin-wwxd: VapourSynth plugin for keyframe generation'
  'vapoursynth-plugin-scxvid: VapourSynth plugin for keyframe generation'
)
source=(
  "$pkgname.tar.gz::https://github.com/arch1t3cht/Aegisub/archive/$pkgver.tar.gz"
  "$pkgname-bestsource::git+https://github.com/vapoursynth/bestsource.git#commit=ba1249c1f5443be6d0ec2be32490af5bbc96bf99"
  "$pkgname-avisynth.tar.gz::https://github.com/AviSynth/AviSynthPlus/archive/v$_aspver.tar.gz"
  "$pkgname-vapoursynth.tar.gz::https://github.com/vapoursynth/vapoursynth/archive/$_vsver.tar.gz"
  "$pkgname-luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
  "$pkgname-gtest-1.8.1.zip::https://github.com/google/googletest/archive/release-1.8.1.zip"
  "$pkgname-gtest-1.8.1-1-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/gtest/1.8.1/1/get_zip"
  "0001-bas-to-bs.patch"
  "0002-luajit.patch::https://github.com/arch1t3cht/Aegisub/commit/4a97bb0dd25cc9753b85715793f60ff8883d3430.patch"
)
noextract=(
  $pkgname-gtest-1.8.1.zip
  $pkgname-gtest-1.8.1-1-wrap.zip
)
sha256sums=(
  '7410109623998b22d6e4b1dbfc1dec84c6d5d10b4d410511cc0277a909c5b512'
  'SKIP'
  'b847705af6f16fa26664d06e0fea2bda14a7f6aac8249a9c37e4106ecb8fd44c'
  '99200d6f1ee9145985b1a1fb64888e70ab0ff2ad9056faf4ab4e27da0d4ae468'
  'SKIP'
  '927827c183d01734cc5cfef85e0ff3f5a92ffe6188e0d18e909c5efebf28a0c7'
  'f79f5fd46e09507b3f2e09a51ea6eb20020effe543335f5aee59f30cc8d15805'
  '693f2c569c2d4321a67c201fcafbd12774bc1f963c41c21f4943d0933e2d0a5f'
  'a561a52460d0e2332840d177e138f264d4cd9a956443966bbb824d18c9af3f61'
)

AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT=${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT:=PulseAudio}

prepare() {
  cd Aegisub-$pkgver
  patch -p1 < $srcdir/0001-bas-to-bs.patch
  patch -p1 < $srcdir/0002-luajit.patch

  # If build dir exists (it won't ever if makepkg is passed --cleanbuild)
  # call --reconfigure rather than setup without it which will fail)
  local MESON_FLAGS=''
  if [ -d build ]; then
    MESON_FLAGS='--reconfigure'
  else
    # Initialize subproject wraps for bestsource
    ln -s "$srcdir/$pkgname-bestsource" subprojects/bestsource

    # Initialize subproject wraps for avisynth
    ln -s "$srcdir/AviSynthPlus-$_aspver" subprojects/avisynth

    # Initialize subproject wraps for vapoursynth
    ln -s "$srcdir/vapoursynth-$_vsver" subprojects/vapoursynth

    # Initialize subproject wraps for luajit
    ln -s "$srcdir/$pkgname-luajit" subprojects/luajit

    # Initialize subproject wraps for gtest
    mkdir subprojects/packagecache
    ln -s "$srcdir/$pkgname-gtest-1.8.1.zip" subprojects/packagecache/gtest-1.8.1.zip
    ln -s "$srcdir/$pkgname-gtest-1.8.1-1-wrap.zip" subprojects/packagecache/gtest-1.8.1-1-wrap.zip
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

  mkdir -p build
  echo """#define BUILD_GIT_VERSION_NUMBER 0
#define BUILD_GIT_VERSION_STRING \"$pkgver\"
""" > build/git_version.h

  # Disabling LTO because it seems to lead to crashing aegisub scripts for some people
  # (https://aur.archlinux.org/packages/aegisub-arch1t3cht-git#comment-911741)
  arch-meson --buildtype="${BUILDTYPE}" -D b_lto=false -D vapoursynth=enabled \
  -D default_audio_output="${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT}" ${MESON_FLAGS} build
}

build() {
  cd Aegisub-$pkgver
  meson compile -C build
}

check() {
  cd Aegisub-$pkgver
  meson test -C build --print-errorlogs --verbose "gtest main"
}

package() {
  cd Aegisub-$pkgver
  meson install -C build --destdir $pkgdir
  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
}
