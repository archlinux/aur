# Maintainer: yustin <#archlinux-proaudio@libera.chat>
# Contributor: Teteros <teteros at teknik dot io>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=radium
pkgver=7.1.92
pkgrel=2
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
        add-vstsdk-location-var.patch
        build_libpds.patch
        radium.install
        grep.patch
        build_linux_common.patch
        sndfilexprt.patch
        gcc13faust3.patch
)
sha256sums=('324ac3df6d18eae69e1dee0ed18b4b53065098ec8b3cad7be6c0c5944e7c9b9a'
            'ed456586a1f28eec9acd081a676e61145e13f07c1a6e967c0af1f7d08be4023e' 
            '2f145e84c5940f4f82544ae68e668d5bd02ee7bce559d3354f60d12eaea1a548' 
            'f627730ff7a819e8cc5ac5c2b5f1fb2f2237327db6ea5442c55a23c1ce82ef14'
            '7ccb4eb8c2924a5b6c610b4f35bc9ff22602cb2e131035d285bef87d813460b3'
            '0decfc3adcba836004ac34d970a83d4d0b69743334a586f42be53b3de7bdd5a4'
            'f0391d772111592ac249d990ed418f87b5e083e5aaeb6b50b9198f93403ed9ab'
            'eb1400e5ec180a10455ac4e300360dba718ec586719fcb73a591f4f6e58e1a42'
           )
install=radium.install

prepare() {
  cd radium-$pkgver

  # use llvm15 to compile
  #OPATH=$PATH
  export PATH=$(pwd):$PATH
  ln -sf /usr/lib/llvm15/bin/clang clang
  ln -sf /usr/bin/llvm-config-15 llvm-config

  patch -p0 < "$srcdir/grep.patch"

  # Add VST2SDK env var so we can use VST2 headers from steinberg-vst36 in AUR
  patch -p1 < "$srcdir/add-vstsdk-location-var.patch"
  
  # fix for binutils 2.40
  patch -p0 < "$srcdir/build_linux_common.patch"
  
  # This tweak edits new file template and demo songs to be compatible with chorus plugin from calf-ladspa package
  # !! NOTE TO LMMS USERS !!
  # !! Comment next line out if you have LMMS installed as it already comes with their own version of Calf plugins !!
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
  # See comment on calf-ladspa AUR page then on how to let Radium load Calf from LMMS package
  
  # temp fix for soundfileexport
  patch -p0 < "$srcdir/sndfilexprt.patch"

  cd bin/packages
  patch -p0 < "$srcdir/build_libpds.patch"

  # patch for faust3.patch gcc13 
  patch -p0 < "$srcdir/gcc13faust3.patch"
}

build() {
  cd radium-$pkgver

  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/include/vst36 RADIUM_BUILD_LIBXCB=0 make packages
  RADIUM_QT_VERSION=5 RADIUM_VST2SDK_PATH=/usr/include/vst36 BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
  cd radium-$pkgver

  # Install radium and its packages to /opt
  RADIUM_INSTALL_LIBXCB=0 ./install.sh "$pkgdir/opt"

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
