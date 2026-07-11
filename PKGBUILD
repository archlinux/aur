# Maintainer: Funami
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: witchymary

pkgname=aegisub-arch1t3cht-git
pkgver=3.4.1.r411.g56a8340
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
         'libass'
         'libgl'
         'libiconv'
         'libportal-gtk3'
         'libpulse'
         'openal'
         'portaudio'
         'uchardet'
         'wxwidgets-gtk3'
         'xxhash'
         'zlib')
makedepends=('git' 'meson' 'cmake' 'boost')
options=('!lto')
source=("${pkgname}::git+https://github.com/arch1t3cht/Aegisub.git#branch=migration04")
sha256sums=('SKIP')

AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT=${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT:=PulseAudio}

pkgver() {
  cd "${pkgname}"
  git describe --long --abbrev=7 --tags --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  meson subprojects download luajit
}

build() {
  cd "${pkgname}"

  # If build dir exists (it won't ever if makepkg is passed --cleanbuild) call --reconfigure rather than setup without it which will fail)
  local MESON_FLAGS=''
  if [ -d build ]; then
    MESON_FLAGS='--reconfigure'
  fi

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
  arch-meson --buildtype="${BUILDTYPE}" \
    -D b_lto=false \
    -D default_audio_output="${AEGISUB_AUR_DEFAULT_AUDIO_OUTPUT}" \
    -D tests=false ${MESON_FLAGS} \
    build
  meson compile -C build
}

package() {
  cd "${pkgname}"
  # Skip luajit to avoid conflict with official package
  meson install --skip-subprojects luajit -C build --destdir "${pkgdir}"
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
