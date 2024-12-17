# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on aegisub-arch1t3cht-git

pkgname=aegisub-arch1t3cht-xdg-git
pkgver=3.2.2.r1221.7db477c3e+xdg
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (arch1t3cht fork + XDG patch)"
arch=('x86_64')
url="https://github.com/arch1t3cht/Aegisub"
license=('GPL' 'BSD')
provides=('aegisub' 'aegisub-arch1t3cht-git')
conflicts=('aegisub' 'aegisub-arch1t3cht-git')
depends=('alsa-lib'
         'boost-libs'
         'ffmpeg'
         'fftw'
         'fontconfig'
         'hicolor-icon-theme'
         'hunspell'
         'icu'
         'libass'
         'libgl'
         'libiconv'
         'libpulse'
         'uchardet'
         'wxwidgets-gtk3'
         'xxhash'
         'zlib'
         'vapoursynth')
makedepends=('boost' 'cmake' 'ffms2' 'git' 'meson' 'openal' 'portaudio')
optdepends=('ffms2: FFMS2 video source support'
            'openal: OpenAL audio source support'
            'portaudio: PortAudio audio source support')
source=("aegisub::git+https://github.com/arch1t3cht/Aegisub.git#branch=feature"
        "aegisub-luajit::git+https://github.com/LuaJIT/LuaJIT.git#branch=v2.1"
        "aegisub-vapoursynth::git+https://github.com/vapoursynth/vapoursynth.git#tag=R70"
        "aegisub-gtest-1.8.1.zip::https://github.com/google/googletest/archive/release-1.8.1.zip"
        "aegisub-gtest-1.8.1-1-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/gtest/1.8.1/1/get_zip"
        "support-xdg-base-directory.patch::https://github.com/arch1t3cht/Aegisub/pull/160.patch")
noextract=("aegisub-gtest-1.8.1.zip" "aegisub-gtest-1.8.1-1-wrap.zip")
sha256sums=('SKIP'
            'SKIP'
            'd18d94cb2c583c0f5e570056f9b2b3996709329a4773c4168c2cb05922f1a54e'
            '927827c183d01734cc5cfef85e0ff3f5a92ffe6188e0d18e909c5efebf28a0c7'
            'f79f5fd46e09507b3f2e09a51ea6eb20020effe543335f5aee59f30cc8d15805'
            'c1d4b8c2302b2433f357c2ed9f88d1c5f99d8a2e1cf8e0185f15330ecd4d5ff1')

pkgver() {
  cd aegisub
  local tag='v3.2.2'
  printf "%s.r%s.%s+xdg" "${tag#v}" \
    "$(git rev-list --count ${tag}..HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd aegisub

  local buildtype
  declare -a meson_flags

  if [[ -d build ]]; then
    meson_flags+=('--reconfigure')
  else
    patch -N -p1 -i ../support-xdg-base-directory.patch

    ln -s ../../aegisub-vapoursynth subprojects/vapoursynth
    ln -s ../../aegisub-luajit subprojects/luajit

    mkdir subprojects/packagecache
    ln -s ../../../aegisub-gtest-1.8.1.zip subprojects/packagecache/gtest-1.8.1.zip
    ln -s ../../../aegisub-gtest-1.8.1-1-wrap.zip subprojects/packagecache/gtest-1.8.1-1-wrap.zip
  fi

  meson subprojects packagefiles --apply vapoursynth
  meson subprojects packagefiles --apply luajit

  arch-meson "${meson_flags[@]}" \
    -D b_lto=false \
    -D default_audio_output=ALSA \
    -D avisynth=disabled \
    -D bestsource=disabled \
    build
}

build() {
  cd aegisub
  meson compile -C build
}

check() {
  cd aegisub
  meson test -C build
}

package() {
  cd aegisub
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
