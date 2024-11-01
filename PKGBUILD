# Maintainer: nyxkn <dev@nyxkn.net>
# Contributor: yustin <#archlinux-proaudio@libera.chat>
# Contributor: Teteros <teteros at teknik dot io>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=radium
pkgname=$_pkgname-git
pkgver=7.4.76.r69.gc7fa14e
pkgrel=1
pkgdesc='A graphical music editor. A next generation tracker.'
arch=(x86_64)
url=https://users.notam02.no/~kjetism/radium
license=(GPL2)
groups=(pro-audio)
provides=(radium)
conflicts=(radium)
depends=(
  desktop-file-utils
  fftw
  glu
  gsfonts
  hicolor-icon-theme
  jack
  liblo
  liblrdf
  libmpc
  libsndfile
  python2
  qt5-svg
  qt5-webkit
  qt5-x11extras
  speex
  ttf-bitstream-vera
  ttf-croscore
  ttf-lato
  libatomic_ops
  libsamplerate
  tk
  guile
  libxkbfile
  openssl
  ncurses
  gmp
  xcb-util-keysyms
  mpfr
  libmpc
  libogg
  libvorbis
  openssl
  alsa-lib
  glib2
  binutils
  xorg-util-macros
  qt5-base
  libmicrohttpd
  ladspa
)
makedepends=(
  git
  boost
  cmake
  libxcursor
  libxinerama
  libxrandr
  qt5-tools
  vst2sdk
)
optdepends=(
  'new-session-manager: for session management'
  'calf-ladspa: default chorus plugin used in new file templates'
  'lmms-git: provides veal.so (instead of calf-ladspa)'
  'ladspa-plugins: package group for plugins normally included in binary releases'
  'vst-plugins: more plugins'
)
options=(!strip)
source=("git+https://github.com/kmatheussen/radium")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  # This tweak edits new file template and demo songs to be compatible with chorus plugin from calf-ladspa package or with veal.so from lmms>=1.3
  # New Demosong also needs fixes for LADSPA-Plugins
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
  for file in bin/sounds/*.RAD; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
  sed -ie "s/C\* Eq - 10-band equalizer/C\* Eq10 - 10-band equaliser/g" bin/sounds/ROMANCE2.RAD

  sed -i 's/cd \$(dirname \$0)/cd \$(dirname \${BASH_SOURCE[0]})/' configuration.sh
}

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export INCLUDE_FAUSTDEV_BUT_NOT_LLVM=1
  # export RADIUM_USE_CLANG=1

  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/src/vst2sdk RADIUM_BUILD_LIBXCB=0 make packages
  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/src/vst2sdk BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
  cd "$_pkgname"

  # install.sh will create opt/radium/ladspa dir and complain if something already exists. so we remove the existing symlink first
  # (bin/ is the dir of the build output that gets copied to opt/radium by install.sh)
  rm -f "bin/ladspa"
  # Install radium and its packages to /opt
  RADIUM_INSTALL_LIBXCB=0 ./install.sh "$pkgdir/opt"

  # Create startup script according to bin/packages/README
  mkdir -p "$pkgdir/usr/bin"
  echo '#!/usr/bin/env bash' >"$pkgdir/usr/bin/radium"
  echo QT_QPA_PLATFORM_PLUGIN_PATH="$($(RADIUM_QT_VERSION=5 ./find_moc_and_uic_paths.sh qmake) -query QT_INSTALL_PLUGINS)" \
    /opt/radium/radium '"$@"' >>"$pkgdir/usr/bin/radium"
  chmod +x "$pkgdir/usr/bin/radium"

  # Icons, .desktop and mimetype files
  mkdir -p "$pkgdir/usr/share/icons/hicolor/"{16x16,32x32,128x128,256x256}"/apps" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/mime/packages"
  ln -s "/opt/radium/radium_16x16x8.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/radium.png"
  ln -s "/opt/radium/radium_32x32x24.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/radium.png"
  ln -s "/opt/radium/radium_128x128x32.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/radium.png"
  ln -s "/opt/radium/radium_256x256x32.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/radium.png"
  ln -s "/opt/radium/radium.desktop" "$pkgdir/usr/share/applications/radium.desktop"
  ln -s "/opt/radium/radium-mimetype.xml" "$pkgdir/usr/share/mime/packages/radium.xml"
}

warn_build_references() {
  # Silence warning about build dir refs as Radium's author prefers packagers don't strip binaries.
  # https://github.com/kmatheussen/radium/issues/1153#issuecomment-421543245
  true
}
