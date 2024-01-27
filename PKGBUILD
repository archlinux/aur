# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>

pkgname=qtractor-git
pkgver=0.9.39.r0.g3f5f0495
pkgrel=1
pkgdesc="Audio/MIDI multitrack sequencer"
arch=('x86_64')
url="https://qtractor.org/"
license=('GPL2')
groups=('pro-audio')
depends=(glibc gcc-libs hicolor-icon-theme libmad libxcb qt6-base qt6-svg zlib)
makedepends=(alsa-lib aubio clap cmake dssi git jack ladspa liblo libogg libsamplerate
libsndfile libvorbis lilv lv2 qt6-tools rubberband suil)
optdepends=(
  'new-session-manager: for session management'
  'qt6-wayland: for native wayland support'
)
provides=(clap-host dssi-host ladspa-host lv2-host vst-host vst3-host)
conflicts=(qtractor)
source=("${pkgname%-*}::git+https://github.com/rncbc/qtractor.git"
        "git+https://github.com/steinbergmedia/vst3_base.git"
        "git+https://github.com/steinbergmedia/vst3_pluginterfaces.git"
        "git+https://github.com/steinbergmedia/vst3_public_sdk.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd qtractor
  git submodule init
  git config submodule.src/vst3/base.url "${srcdir}/vst3_base"
  git config submodule.src/vst3/pluginterfaces.url "${srcdir}/vst3_pluginterfaces"
  git config submodule.src/vst3/public.sdk.url "${srcdir}/vst3_public_sdk"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  # cutting off the "qtractor_" prefix present in the git tag + remaining underscores (ugly but gets the job done).
  git describe --long | sed 's/^qtractor_//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/\_/./g'
}

build() {
cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DCONFIG_QT6=ON \
        -Wno-dev \
        -B build \
        -S "${pkgname%-*}"
  make VERBOSE=1 -C build
}

package() {
  depends+=(libasound.so libaubio.so libjack.so liblilv-0.so liblo.so libogg.so
  librubberband.so libsamplerate.so libsndfile.so libvorbisenc.so
  libvorbisfile.so libvorbis.so )

  make DESTDIR="${pkgdir}" install -C build
  # docs
  install -vDm 644 "qtractor/"{README,README.VST} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
