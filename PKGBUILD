# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Teteros <teteros at teknik dot io>

pkgname=radium
pkgver=5.9.98
pkgrel=1
pkgdesc='A graphical music editor. A next generation tracker.'
arch=(i686 x86_64)
url=https://users.notam02.no/~kjetism/radium
license=(GPL2)
depends=(
  desktop-file-utils
  fftw
  glu
  gsfonts
  hicolor-icon-theme
  jack
  liblrdf
  libmpc
  libsndfile
  python2
  qt5-webkit
  qt5-x11extras
  speex
  ttf-bitstream-vera
  ttf-lato
)
makedepends=(
  boost
  cmake
  ladspa
  libxcursor
  libxinerama
  libxkbfile
  libxrandr
  llvm
  qt5-tools
  steinberg-vst36
)
optdepends=(
  'calf-ladspa: Default chorus plugin'
  'ladspa-plugins: Package group for default radium plugins included in binary releases'
)
options=(!strip)
source=(https://github.com/kmatheussen/radium/archive/$pkgver.tar.gz
        0001-Internal-Various-compilation-fixes-plus-assert-that-.patch
        0002-Sequencer-Fix-program-sometimes-crashing-in-debug-mo.patch
        0003-Linux-Macosx-Fix-compiling-with-newer-bdf.h.patch
        use-system-libxcb.patch
        use-system-vstsdk.patch)
sha256sums=('3b1b5b9f72536d79561f602f278611979fbc9a8720cd3064c001998a22de9e90'
            'c658253e13eb5e5dbe44d5e968634da4ea474885bd4ea33b4d7c586b8aa58cc2'
            'eb6641f77506799eab7f3fadccd5e129fc3a5f1a4cefd099d97dd1918aaa26d8'
            'b0841d5979936a87b179a5ac8a61f326493b50ddcdb79b10da27870af1b204ab'
            '6c29e825e06d1c3aec4afd915718b8c46da705d1411a94f7c0f777b888a9b50d'
            'a1ee3635dd9338e2ea2fc76cddf670fcb046afeba553a12b73158cf0b51a52f6')

prepare() {
  cd radium-$pkgver

  # Use system libxcb 1.13 rather than try to compile it
  patch -p1 < "$srcdir/use-system-libxcb.patch"

  # Set VST SDK location to steinberg-vst36 rather than look for it in user's home folder
  patch -p1 < "$srcdir/use-system-vstsdk.patch"

  # Compile fix for gdb9 https://github.com/kmatheussen/radium/issues/1246
  for commit in "$srcdir"/000?-*.patch; do patch -p1 < "$commit"; done

  # Edit new file template and demo songs to be compatible with chorus plugin from calf-ladspa
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
}

build() {
  cd radium-$pkgver

  RADIUM_QT_VERSION=5 make packages
  RADIUM_QT_VERSION=5 BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
  cd radium-$pkgver

  # Install radium and its packages to /opt
  ./install.sh "$pkgdir/opt"

  # Create startup script according to bin/packages/README
  mkdir -p "$pkgdir/usr/bin"
  echo '#!/usr/bin/env bash' > "$pkgdir/usr/bin/radium"
  echo QT_QPA_PLATFORM_PLUGIN_PATH="$($(RADIUM_QT_VERSION=5 ./find_moc_and_uic_paths.sh qmake) -query QT_INSTALL_PLUGINS)" \
    /opt/radium/radium >> "$pkgdir/usr/bin/radium"
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
