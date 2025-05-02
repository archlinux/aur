# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: éclairevoyant
# Contributor: Sefa Eyeoglu <contact at scrumplex dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
pkgver=1.0.0
pkgrel=5
pkgdesc="A feature-rich digital audio workstation with support for various plugin formats and advanced audio processing capabilities"
arch=('x86_64' 'aarch64')
url="https://www.zrythm.org/"
license=('AGPL-3.0-or-later')
depends=(
  'bash'
  'carla-git'
  'cairo'
  'curl'
  'dconf'
  'fftw'
  'file'
  'fluidsynth'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gtk4'
  'gtksourceview5'
  'hicolor-icon-theme'
  'libadwaita'
  'libbacktrace'
  'libcyaml'
  'libglvnd'
  'liblo'
  'libpanel'
  'libpulse'
  'libsndfile'
  'libsoxr'
  'libx11'
  'libxcursor'
  'libxext'
  'libxrandr'
  'lsp-dsp-lib'
  'pango'
  'pcre2'
  'pipewire-jack'
  'qt5-base'
  'rubberband'
  'rtaudio'
  'rtmidi'
  'sdl2'
  'vamp-plugin-sdk'
  'xxhash'
  'yyjson'
  'zix'
  'zstd'
)
makedepends=(
  'blueprint-compiler'
  'boost'
  'glib2-devel'
  'guile'
  'help2man'
  'lilv'
  'meson'
  'sassc'
)
optdepends=(
  'graphviz: for process graph export (only used for debugging)'
  'jack: low latency audio/MIDI backend'
  'libsoundio: alternative audio backend'
  'portaudio: alternative audio backend'
  'realtime-privileges: for real-time scheduling privileges'
)
source=("https://www.zrythm.org/releases/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('d143a0a17066b50db8a6db875d2699c9e5b70f1bbe18db00fee034840144fede'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3') # Alexandros Theodotou <alex@zrythm.org>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local meson_options=(
    -Dcarla=enabled
    -Dopus=true
    -Drtaudio=enabled
    -Drtmidi=enabled
    -Dsdl=enabled
    -Dcheck_updates=false
    -Dgraphviz=disabled  # Enable/Disable Graphviz support
    -Dportaudio=disabled # Enable/Disable PortAudio support
    -Dsoundio=disabled   # Enable/Disable libsoundio support
  )

  arch-meson build "${meson_options[@]}"
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the package
  DESTDIR="${pkgdir}" ninja -C build install

  # Install the custom license file
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSES/LicenseRef-ZrythmLicense.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
