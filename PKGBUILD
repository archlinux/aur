# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Teteros <teteros at teknik dot io>

pkgname=radium
pkgver=5.9.86
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
  python2
  qt5-webkit
  qt5-x11extras
  speex
  ttf-bitstream-vera
  ttf-lato
)
makedepends=(
  boost
  clang
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
  'ladspa-plugins: Package group for default radium plugins incl in binary releases'
)
options=(!strip)
source=(https://github.com/kmatheussen/radium/archive/$pkgver.tar.gz
        use-system-libxcb.patch
        use-system-vstsdk.patch)
sha256sums=('a8bf4dd70690c1e443c0f3a8c31949f931e728928ed8794e21298d0c453b740a'
            '6c29e825e06d1c3aec4afd915718b8c46da705d1411a94f7c0f777b888a9b50d'
            '045e4b4c444d1a37dffdcecb87e5245188fadf68444f9a4b14207a5b98671344')

prepare() {
  cd radium-$pkgver

  # Use system libxcb 1.13 rather than try to compile it
  patch -p1 < "$srcdir/use-system-libxcb.patch"

  # Set VST SDK location to steinberg-vst36 rather than look for it in user's home folder
  patch -p1 < "$srcdir/use-system-vstsdk.patch"

  # Edit new file template and demo songs to be compatible with chorus plugin from calf-ladspa
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
}

build() {
  cd radium-$pkgver

  RADIUM_USE_CLANG=1 RADIUM_QT_VERSION=5 make packages
  RADIUM_USE_CLANG=1 RADIUM_QT_VERSION=5 BUILDTYPE=RELEASE ./build_linux.sh
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
