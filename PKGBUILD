# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: nyx eles
# Contributor: yustin <#archlinux-proaudio@libera.chat>
# Contributor: Teteros <teteros at teknik dot io>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=radium
pkgname=$_pkgname-git
pkgver=7.1.92.r7.ge115ad6
pkgrel=2
pkgdesc='A graphical music editor. A next generation tracker.'
arch=(x86_64)
url='https://users.notam02.no/~kjetism/radium/'
license=(GPL2)
groups=(ladspa-host pro-audio vst-host vst3-host)
provides=($_pkgname ladspa-host vst-host vst3-host)
conflicts=($_pkgname)
depends=(
  alsa-lib
  binutils
  desktop-file-utils
  fftw
  glib2
  glu
  gmp
  gsfonts
  guile
  hicolor-icon-theme
  jack
  ladspa
  libatomic_ops
  liblo
  liblrdf
  libmicrohttpd
  libmpc
  libmpc
  libogg
  libsamplerate
  libsndfile
  libvorbis
  libxkbfile
  mpfr
  ncurses
  openssl
  openssl
  python2
  qt5-base
  qt5-svg
  qt5-webkit
  qt5-x11extras
  speex
  swh-plugins
  tk
  ttf-bitstream-vera
  ttf-croscore
  ttf-lato
  xcb-util-keysyms
  xorg-util-macros
)
makedepends=(
  boost
  cmake
  git
  libxcursor
  libxinerama
  libxkbfile
  libxrandr
  llvm
  qt5-tools
  vst2sdk
)
optdepends=(
  'new-session-manager: for session management'
  'calf-ladspa: default chorus plugin used in new file templates'
  'ladspa-plugins: package group for plugins normally included in binary releases'
  'vst-plugins: more plugins'
)
options=(!strip)
source=(
  "git+https://github.com/kmatheussen/radium"
  build_linux_common.patch
)
sha256sums=('SKIP'
            '0decfc3adcba836004ac34d970a83d4d0b69743334a586f42be53b3de7bdd5a4')
install=radium.install

pkgver() {
  cd radium

  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd radium

  git revert --no-commit f8c725e46791ce76fe71556b8dc1fac2d3bd35ff

  # fix for binutils 2.40
  patch -p0 -N -r - -i "$srcdir"/build_linux_common.patch

  # This tweak edits the new file template and demo songs to be compatible with
  # the multi chorus plugin from the 'calf-ladspa' package
  for file in \
    bin/{,sounds}/*.[Rr][Aa][Dd] \
    audio/SoundPluginRegistry.cpp \
    bin/scheme/instruments.scm \
    ladspa_info/calf.7.cached_type_info; do
    sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file";
  done
}

build() {
  cd radium

  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/include/vst36 RADIUM_BUILD_LIBXCB=0 make packages
  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/include/vst36 BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
  cd radium

  # Install radium and its packages to /opt
  RADIUM_INSTALL_LIBXCB=0 ./install.sh "$pkgdir"/opt

  # Create startup script according to bin/packages/README
  echo '#!/usr/bin/env bash' > radium.sh
  echo QT_QPA_PLATFORM_PLUGIN_PATH="$($(RADIUM_QT_VERSION=5 ./find_moc_and_uic_paths.sh qmake) -query QT_INSTALL_PLUGINS)" \
    /opt/radium/radium '"$@"' >> radium.sh
  install -vDm 755 radium.sh "$pkgdir"/usr/bin/radium

  # Icons, .desktop and mimetype files
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/{16x16,32x32,128x128,256x256}/apps \
    "$pkgdir"/usr/share/applications \
    "$pkgdir"/usr/share/mime/packages
  ln -s /opt/radium/radium_16x16x8.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/radium.png
  ln -s /opt/radium/radium_32x32x24.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/radium.png
  ln -s /opt/radium/radium_128x128x32.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/radium.png
  ln -s /opt/radium/radium_256x256x32.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/radium.png
  ln -s /opt/radium/radium.desktop "$pkgdir"/usr/share/applications/radium.desktop
  ln -s /opt/radium/radium-mimetype.xml "$pkgdir"/usr/share/mime/packages/radium.xml
}

warn_build_references() {
  # Silence warning about build dir refs as Radium's author prefers packagers don't strip binaries.
  # https://github.com/kmatheussen/radium/issues/1153#issuecomment-421543245
  true
}
