# Maintainer: Funami
pkgname=aegisub-arch1t3cht-git
pkgver=3.2.2.r953.21f764fdf
pkgrel=2
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

pkgver() {
  cd "${pkgname}"
  tag='v3.2.2'
  printf "%s.r%s.%s" "${tag#v}" "$(git rev-list --count ${tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"

  # Initialize subproject wraps for bestsource
  ln -s ../../"${pkgname}-bestsource" subprojects/bestsource
  meson subprojects packagefiles --apply bestsource

  # Initialize subproject wraps for avisynth
  mv ../"${pkgname}-avisynth" subprojects/avisynth
  meson subprojects packagefiles --apply avisynth

  # Initialize subproject wraps for vapoursynth
  ln -s ../../"${pkgname}-vapoursynth" subprojects/vapoursynth
  meson subprojects packagefiles --apply vapoursynth

  # Initialize subproject wraps for luajit
  ln -s ../../"${pkgname}-luajit" subprojects/luajit
  meson subprojects packagefiles --apply luajit

  # Initialize subproject wraps for gtest
  mkdir subprojects/packagecache
  ln -s ../../../"${pkgname}-gtest-1.8.1.zip" subprojects/packagecache/gtest-1.8.1.zip
  ln -s ../../../"${pkgname}-gtest-1.8.1-1-wrap.zip" subprojects/packagecache/gtest-1.8.1-1-wrap.zip

  # Fix boost "undefined reference" error
  sed -i '/BOOST_USE_WINDOWS_H/{n;s/$/\nadd_project_arguments('"'"'-DBOOST_NO_CXX11_SCOPED_ENUMS'"'"', language: '"'"'cpp'"'"')/}' meson.build

  arch-meson --buildtype=release -D default_audio_output=PulseAudio build
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
