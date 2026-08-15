# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
# Contributor: Milkii Brewster <milkii on Freenode IRC>
# Based on the zrythm AUR package by Nikos Toutountzoglou et al.

_pkgname=zrythm
pkgname=${_pkgname}-debug-git
pkgver=1.0.0.r0.g8b3de7881
pkgrel=1
pkgdesc='A highly automated and intuitive digital audio workstation (debug git build)'
arch=('x86_64' 'aarch64')
url="https://www.zrythm.org/"
license=('AGPL-3.0-or-later')
depends=(
  'bash' 'boost-libs' 'cairo' 'carla-git' 'curl' 'dconf' 'fftw' 'file'
  'fluidsynth' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc'
  'graphene' 'gtk4' 'gtksourceview5' 'hicolor-icon-theme' 'libadwaita'
  'libbacktrace' 'libcyaml' 'libglvnd' 'liblo' 'libpanel' 'libpulse'
  'libsndfile' 'libsoxr' 'libx11' 'libxcursor' 'libxext' 'libxrandr'
  'lsp-dsp-lib' 'pango' 'pcre2' 'pipewire-jack' 'qt5-base' 'rtaudio'
  'rtmidi' 'rubberband' 'sdl2' 'vamp-plugin-sdk' 'xxhash' 'yyjson' 'zix' 'zstd'
)
makedepends=(
  'blueprint-compiler' 'boost' 'cmake' 'glib2-devel' 'guile' 'help2man'
  'lilv' 'meson' 'sassc' 'git'
)
optdepends=(
  'graphviz: for process graph export'
  'jack: low latency audio/MIDI backend'
  'libsoundio: alternative audio backend'
  'portaudio: alternative audio backend'
  'realtime-privileges: for real-time scheduling privileges'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("$_pkgname::git+https://github.com/zrythm/zrythm.git")
md5sums=('SKIP')
options=(debug !strip)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  local meson_options=(
    -Dcarla=enabled
    -Dopus=true
    -Drtaudio=enabled
    -Drtmidi=enabled
    -Dsdl=enabled
    -Dcheck_updates=false
    -Dgraphviz=disabled
    -Dportaudio=disabled
    -Dsoundio=disabled
    -Dstatic_deps=false
    -Dcompletions=true
    -Db_sanitize=none
    -Ddebug=true
    -Doptimization=0
  )

  arch-meson build "${meson_options[@]}"
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname"

  meson install -C build --destdir "$pkgdir"

  install -Dm644 LICENSES/LicenseRef-ZrythmLicense.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  if [[ -f "${pkgdir}/usr/share/fish/vendor_completions.d/zrythm.fish" ]]; then
    sed -i "s|${srcdir}||g" "${pkgdir}/usr/share/fish/vendor_completions.d/zrythm.fish"
  fi
}

# vim:set ts=2 sw=2 et:
