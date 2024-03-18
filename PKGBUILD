# Maintainer: yustin <#archlinux-proaudio@libera.chat>
# Contributor: Teteros <teteros at teknik dot io>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=radium
pkgver=7.3.84
pkgrel=1
pkgdesc='A graphical music editor. A next generation tracker.'
arch=(x86_64)
url=https://users.notam02.no/~kjetism/radium
license=(GPL2)
groups=(pro-audio)
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
  boost
  cmake
  libxcursor
  libxinerama
  libxkbfile
  libxrandr
  llvm15
  clang15
  qt5-tools
  vst2sdk
)
optdepends=(
  'new-session-manager: for session management'
  'calf-ladspa: default chorus plugin used in new file templates'
  'ladspa-plugins: package group for plugins normally included in binary releases'
  'vst-plugins: more plugins'
)
options=( !strip )
source=("$pkgname-$pkgver.tar.gz::https://github.com/kmatheussen/radium/archive/$pkgver.tar.gz"
        radium.install
        build_linux_common.patch
)
sha256sums=('99d42a56491812cbc04fa14f463588740eb2bed8c2f58eadd6e8f45b239fd3f6'
            'f627730ff7a819e8cc5ac5c2b5f1fb2f2237327db6ea5442c55a23c1ce82ef14'
            '0decfc3adcba836004ac34d970a83d4d0b69743334a586f42be53b3de7bdd5a4'
           )
install=radium.install

prepare() {
  cd radium-$pkgver

  # use llvm15 to compile
  export PATH=$(pwd):$PATH
  ln -sf /usr/lib/llvm15/bin/clang clang
  ln -sf /usr/bin/llvm-config-15 llvm-config

  # fix for binutils 2.40
  patch -p0 < "$srcdir/build_linux_common.patch"
  
  # This tweak edits new file template and demo songs to be compatible with chorus plugin from calf-ladspa package
  # New Demosong also needs fixes for LADSPA-Plugins
  # !! NOTE TO LMMS USERS !!
  # !! Comment next line out if you have LMMS installed as it already comes with their own version of Calf plugins !!
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
  for file in bin/sounds/*.RAD; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
  sed -ie "s/C\* Eq - 10-band equalizer/C\* Eq10 - 10-band equaliser/g" bin/sounds/ROMANCE2.RAD 
  # See comment on calf-ladspa AUR page then on how to let Radium load Calf from LMMS package 
}

build() {
  cd radium-$pkgver
  export PATH=$(pwd):$PATH
	export INCLUDE_FAUSTDEV_BUT_NOT_LLVM=1

  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/include/vst36 RADIUM_BUILD_LIBXCB=0 make packages
  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/include/vst36 BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
  cd radium-$pkgver

  # Install radium and its packages to /opt
  RADIUM_INSTALL_LIBXCB=0 ./install.sh "$pkgdir/opt"
  # radium.install will link ladspa-path here so remove it
  rm -rf $pkgdir/opt/radium/ladspa

  # Create startup script according to bin/packages/README
  mkdir -p "$pkgdir/usr/bin"
  echo '#!/usr/bin/env bash' > "$pkgdir/usr/bin/radium"
  echo QT_QPA_PLATFORM_PLUGIN_PATH="$($(RADIUM_QT_VERSION=5 ./find_moc_and_uic_paths.sh qmake) -query QT_INSTALL_PLUGINS)" \
    /opt/radium/radium '"$@"' >> "$pkgdir/usr/bin/radium"
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
