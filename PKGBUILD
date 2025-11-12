# Maintainer:

## options
: ${_build_git:=false}
: ${_use_sodeps:=false}

: ${_commit:=9bfd5008d9fc30bd86b3634416781d2c41ce8f89} # 12.r24

_pkgtype="-arch1t3cht"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+='-git' && _commit="feature"

_pkgname="aegisub"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=12
pkgrel=2
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (arch1t3cht fork)"
url="https://github.com/arch1t3cht/Aegisub"
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  'alsa-lib'
  'boost-libs'
  'ffmpeg'
  'ffms2'
  'fftw'
  'fontconfig'
  'hicolor-icon-theme'
  'hunspell'
  'icu'
  'libass'
  'libgl'
  'libpulse'
  'openal'
  'portaudio'
  'python'
  'uchardet'
  'vapoursynth'
  'wxwidgets-gtk3'
  'xxhash'
  'zlib'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'meson'
)
optdepends=(
  'avisynthplus: AviSynth source support'
  'vapoursynth-plugin-lsmashsource: VapourSynth source plugin'
  'vapoursynth-plugin-scxvid: VapourSynth plugin for keyframe generation'
  'vapoursynth-plugin-wwxd: VapourSynth plugin for keyframe generation'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

noextract=(
  "$_pkgname-gtest-1.8.1.zip"
  "$_pkgname-gtest-1.8.1-1-wrap.zip"
)

options=('!lto')

_pkgsrc="arch1t3cht.aegisub"
source=(
  "$_pkgsrc"::"git+https://github.com/arch1t3cht/Aegisub.git#commit=${_commit:?}"
  "vapoursynth.bestsource"::"git+https://github.com/vapoursynth/bestsource.git#tag=R14"
  "the-sekrit-twc.libp2p"::"git+https://bitbucket.org/the-sekrit-twc/libp2p.git#commit=1e3818bd7277165819f659d410873fe5dab37af6"
  "avisynth"::"git+https://github.com/AviSynth/AviSynthPlus.git#tag=v3.7.5"
  "vapoursynth"::"git+https://github.com/vapoursynth/vapoursynth.git#tag=R72"
  "luajit"::"git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
  "gtest-1.8.1.zip"::"https://github.com/google/googletest/archive/release-1.8.1.zip"
  "gtest-1.8.1-1-wrap.zip"::"https://wrapdb.mesonbuild.com/v1/projects/gtest/1.8.1/1/get_zip"
)
sha256sums=(
  '2883aad621360727ea93e433f8918e9322aea267dce6734e4f6c41e2a57bb222'
  '96d6c9fc58922ed26d1e0e5374b10d5820cc3a44663e5afd929200a17b186ee8'
  'e7a3c026a9021dc3cb33fa949d8c2aa90c256a36d3a198abed3e11ade87de1d5'
  'd84be209f08a5a967a92ce396a93ce73c109536e3617c4eb909de0287b465397'
  'abc97f386da37d93a9a7e3f44e86f18784115118189ff56ebc743faf848f9275'
  'SKIP'
  '927827c183d01734cc5cfef85e0ff3f5a92ffe6188e0d18e909c5efebf28a0c7'
  'f79f5fd46e09507b3f2e09a51ea6eb20020effe543335f5aee59f30cc8d15805'
)

prepare() {
  cd "$_pkgsrc"

  ln -sf ../../"avisynth" subprojects/avisynth
  ln -sf ../../"luajit" subprojects/luajit
  ln -sf ../../"vapoursynth" subprojects/vapoursynth

  ln -sf ../../"vapoursynth.bestsource" subprojects/bestsource
  rm -rf subprojects/bestsource/libp2p
  ln -sf ../"the-sekrit-twc.libp2p" subprojects/bestsource/libp2p

  mkdir -p subprojects/packagecache
  ln -sf ../../../"gtest-1.8.1.zip" subprojects/packagecache/gtest-1.8.1.zip
  ln -sf ../../../"gtest-1.8.1-1-wrap.zip" subprojects/packagecache/gtest-1.8.1-1-wrap.zip

  meson subprojects packagefiles --apply bestsource
  meson subprojects packagefiles --apply avisynth
  meson subprojects packagefiles --apply vapoursynth
  meson subprojects packagefiles --apply luajit

  # fix for BestAudioSource > R8
  sed -E -e '/make_unique<BestAudioSource>/s&, -1, false, 0, 1,&, -1, 1, 0,&' -i src/audio_provider_bestsource.cpp
}

pkgver() {
  cd "$_pkgsrc"
  local _pkgver=$(
    git describe --long --tags --abbrev=7 --match="feature_*" --exclude='feature_*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
  )

  [ "${_build_git::1}" != "t" ] && _pkgver="${_pkgver%.r*}"
  printf "%s" "${_pkgver:?}"
}

build() {
  local _meson_options=(
    -Ddefault_audio_output=PulseAudio
    -Dbestsource:default_library=static
  )

  cd "$_pkgsrc"
  arch-meson build "${_meson_options[@]}"
  meson compile -C build
}

check() {
  cd "$_pkgsrc"
  meson test -C build --print-errorlogs --verbose "gtest main"
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libGL.so'
      'libasound.so'
      'libass.so'
      'libavcodec.so'
      'libavformat.so'
      'libavutil.so'
      'libboost_filesystem.so'
      'libboost_locale.so'
      'libfftw3.so'
      'libfontconfig.so'
      'libicui18n.so'
      'libicuuc.so'
      'libopenal.so'
      'libportaudio.so'
      'libpulse.so'
      'libswscale.so'
      'libxxhash.so'
      'libz.so'
    )"
  fi

  local _meson_options=(
    --skip-subprojects bestsource
  )

  cd "$_pkgsrc"
  meson install -C build --destdir "$pkgdir" "${_meson_options[@]}"
  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
