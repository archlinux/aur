# Maintainer: Funami
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: witchymary

pkgname=aegisub-arch1t3cht-git
pkgver=3.2.2.r1241.9bfd5008d
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
         'libass'
         'libgl'
         'libiconv'
         'libpulse'
         'openal'
         'portaudio'
         'uchardet'
         'wxwidgets-gtk3'
         'xxhash'
         'zlib')
makedepends=('git' 'meson' 'cmake' 'boost')
optdepends=('vapoursynth: VapourSynth source support'
            'avisynthplus: AviSynth source support'
            'vapoursynth-plugin-lsmashsource: VapourSynth plugin used by default (LWLibavSource)'
            'vapoursynth-plugin-wwxd: VapourSynth plugin for keyframe generation'
            'vapoursynth-plugin-scxvid: VapourSynth plugin for keyframe generation')
options=('!lto')
source=("${pkgname}::git+https://github.com/arch1t3cht/Aegisub.git#branch=feature"
        "${pkgname}-bestsource::git+https://github.com/vapoursynth/bestsource.git#tag=R8"
        "${pkgname}-libp2p::git+https://bitbucket.org/the-sekrit-twc/libp2p.git#commit=1e3818bd7277165819f659d410873fe5dab37af6"
        "${pkgname}-avisynth::git+https://github.com/AviSynth/AviSynthPlus.git#tag=v3.7.2"
        "${pkgname}-vapoursynth::git+https://github.com/vapoursynth/vapoursynth.git#tag=R59"
        "${pkgname}-luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
        "${pkgname}-gtest-1.8.1.zip::https://github.com/google/googletest/archive/release-1.8.1.zip"
        "${pkgname}-gtest-1.8.1-1-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/gtest/1.8.1/1/get_zip")
noextract=("${pkgname}-gtest-1.8.1.zip"
           "${pkgname}-gtest-1.8.1-1-wrap.zip")
sha256sums=('SKIP'
            '2d09633a025b6b792b453d1394753b4d63b842bdd3d444fa8fffd3414e19faf1'
            'e7a3c026a9021dc3cb33fa949d8c2aa90c256a36d3a198abed3e11ade87de1d5'
            '5e3a79b7269b04f199b1e84fa87042d426391f11b4721d4d1e2d6256234c5507'
            '08803fc79758494671af1029e9178c73e717393a745075a45337d56dfa1aad6c'
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

  rm -rf ../"${pkgname}-bestsource_copy"
  cp -r ../"${pkgname}-bestsource" ../"${pkgname}-bestsource_copy"

  # If build dir exists (it won't ever if makepkg is passed --cleanbuild) call --reconfigure rather than setup without it which will fail)
  local MESON_FLAGS=''
  if [ -d build ]; then
    MESON_FLAGS='--reconfigure'

    # Initialize subproject wraps for bestsource/libp2p
    rm -rf subprojects/bestsource/libp2p
    ln -s ../"${pkgname}-libp2p" subprojects/bestsource/libp2p
  else
    # Initialize subproject wraps for bestsource
    ln -s ../../"${pkgname}-bestsource_copy" subprojects/bestsource

    # Initialize subproject wraps for bestsource/libp2p
    rm -rf subprojects/bestsource/libp2p
    ln -s ../"${pkgname}-libp2p" subprojects/bestsource/libp2p

    # Initialize subproject wraps for avisynth
    ln -s ../../"${pkgname}-avisynth" subprojects/avisynth

    # Initialize subproject wraps for vapoursynth
    ln -s ../../"${pkgname}-vapoursynth" subprojects/vapoursynth

    # Initialize subproject wraps for luajit
    ln -s ../../"${pkgname}-luajit" subprojects/luajit

    # Initialize subproject wraps for gtest
    mkdir -p subprojects/packagecache
    ln -s ../../../"${pkgname}-gtest-1.8.1.zip" subprojects/packagecache/gtest-1.8.1.zip
    ln -s ../../../"${pkgname}-gtest-1.8.1-1-wrap.zip" subprojects/packagecache/gtest-1.8.1-1-wrap.zip
  fi

  meson subprojects packagefiles --apply bestsource
  meson subprojects packagefiles --apply avisynth
  meson subprojects packagefiles --apply vapoursynth
  meson subprojects packagefiles --apply luajit

  # Check if the OPTIONS array contains "!strip"
  check_makepkg_options() (
    if [[ " ${OPTIONS[@]} " =~ ' !strip ' ]]; then
      >&2 echo '!strip found in OPTIONS array'
      echo debug
    else
      >&2 echo '!strip not found in OPTIONS array'
      echo release
    fi
  )
  local BUILDTYPE="$(check_makepkg_options 2> /dev/null)"

  # Disabling LTO because it seems to lead to crashing aegisub scripts for some people
  # (https://aur.archlinux.org/packages/aegisub-arch1t3cht-git#comment-911741)
  # Force building bestsource from source as newer versions are not compatible
  arch-meson --buildtype="${BUILDTYPE}" \
    -D b_lto=false \
    -D default_audio_output="${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT}" \
    --force-fallback-for=bestsource \
    -D bestsource:default_library=static ${MESON_FLAGS} \
    build
}

build() {
  cd "${pkgname}"
  meson compile -C build
}

package() {
  cd "${pkgname}"
  # Skip bestsource to avoid conflict with official package
  # (https://aur.archlinux.org/packages/aegisub-arch1t3cht-git#comment-979303)
  meson install --skip-subprojects bestsource -C build --destdir "${pkgdir}"
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
