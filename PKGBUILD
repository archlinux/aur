# Maintainer: Funami
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: witchymary

pkgname=aegisub-arch1t3cht-git
pkgver=3.2.2.r976.00e241d74
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (arch1t3cht fork)"
arch=('x86_64')
url="https://github.com/arch1t3cht/Aegisub"
license=('GPL' 'BSD')
provides=('aegisub')
conflicts=('aegisub')
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
         'wxwidgets-gtk3'
         'zlib')
makedepends=('git' 'meson' 'cmake' 'boost')
optdepends=('vapoursynth: VapourSynth source support'
            'avisynthplus: AviSynth source support'
            'vapoursynth-plugin-lsmashsource: VapourSynth plugin used by default (LWLibavSource)'
            'vapoursynth-plugin-bestaudiosource: VapourSynth plugin used by default (BestAudioSource)'
            'vapoursynth-plugin-wwxd: VapourSynth plugin for keyframe generation'
            'vapoursynth-plugin-scxvid: VapourSynth plugin for keyframe generation')
source=("${pkgname}::git+https://github.com/arch1t3cht/Aegisub.git#branch=feature"
        "${pkgname}-bestsource::git+https://github.com/vapoursynth/bestsource.git#commit=ba1249c1f5443be6d0ec2be32490af5bbc96bf99"
        "${pkgname}-avisynth::git+https://github.com/AviSynth/AviSynthPlus.git#tag=v3.7.2"
        "${pkgname}-vapoursynth::git+https://github.com/vapoursynth/vapoursynth.git#tag=R59"
        "${pkgname}-luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
        "${pkgname}-gtest-1.8.1.zip::https://github.com/google/googletest/archive/release-1.8.1.zip"
        "${pkgname}-gtest-1.8.1-1-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/gtest/1.8.1/1/get_zip")
noextract=("${pkgname}-gtest-1.8.1.zip"
           "${pkgname}-gtest-1.8.1-1-wrap.zip")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '927827c183d01734cc5cfef85e0ff3f5a92ffe6188e0d18e909c5efebf28a0c7'
            'f79f5fd46e09507b3f2e09a51ea6eb20020effe543335f5aee59f30cc8d15805')

AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT=${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT:=PulseAudio}

pkgver() {
  cd "${pkgname}"
  tag='v3.2.2'
  printf "%s.r%s.%s" "${tag#v}" "$(git rev-list --count ${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"

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
    ln -s ../../../"${pkgname}-gtest-1.8.1.zip" subprojects/packagecache/gtest-1.8.1.zip
    ln -s ../../../"${pkgname}-gtest-1.8.1-1-wrap.zip" subprojects/packagecache/gtest-1.8.1-1-wrap.zip
  fi

  meson subprojects packagefiles --apply bestsource
  meson subprojects packagefiles --apply avisynth
  meson subprojects packagefiles --apply vapoursynth
  meson subprojects packagefiles --apply luajit

  # Fix boost "undefined reference" error
  sed -i '/BOOST_USE_WINDOWS_H/{n;s/$/\nadd_project_arguments('"'"'-DBOOST_NO_CXX11_SCOPED_ENUMS'"'"', language: '"'"'cpp'"'"')/}' meson.build

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
