# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Teteros <teteros at teknik dot io>

pkgname=radium
pkgver=5.9.76
pkgrel=1
pkgdesc="A graphical music editor. A next generation tracker."
arch=('i686' 'x86_64')
url="https://users.notam02.no/~kjetism/radium"
license=('GPL')
depends=(
  'desktop-file-utils'
  'fftw'
  'glu'
  'hicolor-icon-theme'
  'jack'
  'liblrdf'
  'libmpc'
  'libsamplerate'
  'python2'
  'qt5-webkit'
  'qt5-x11extras'
  'speex'
)
makedepends=(
  'boost'
  'clang'
  'cmake'
  'ladspa'
  'libxcursor'
  'libxinerama'
  'libxkbfile'
  'libxrandr'
  'llvm'
  'qt5-tools'
  'steinberg-vst36'
)
optdepends=(
  'calf-ladspa: Default chorus plugin'
  'ladspa-plugins: Package group for default radium plugins incl in binary releases'
)
options=(!strip)
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz"
        "add-faust-llvm90-support.patch"
        "use-libtirpc-headers.patch"
        "use-system-libxcb.patch"
        "use-system-vstsdk.patch")
sha256sums=('e8a5d690822b87539972a1091986b6db7ec60d90018188220998d5f837a64d8b'
            'eedde2cf78989f307f35bcf7aea49052b829c459db59805502b0cb5d831e75b4'
            '0dfa3014bc6a66989564c7da2d963681f5d129eb0be28153744693dd533e4909'
            '6c29e825e06d1c3aec4afd915718b8c46da705d1411a94f7c0f777b888a9b50d'
            '045e4b4c444d1a37dffdcecb87e5245188fadf68444f9a4b14207a5b98671344')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Add support for LLVM9 in FAUST
  patch -p1 < "${srcdir}/add-faust-llvm90-support.patch"

  # glibc-2.27 deprecated legacy rpc, header files for libpd are in libtirpc
  patch -p1 < "${srcdir}/use-libtirpc-headers.patch"

  # Use system libxcb 1.13 instead of radium's to reduce build time
  patch -p1 < "${srcdir}/use-system-libxcb.patch"

  # JUCE expects the VST SDK in home directory, this adds paths for SDK in steinberg-vst36 from AUR
  patch -p1 < "${srcdir}/use-system-vstsdk.patch"

  # calf-ladspa in AUR uses LMMS's 'veal' fork of Calf LADSPA in which the chorus plugin ref contains a white space
  # Radium has not switched to veal yet for its demo songs, https://github.com/kmatheussen/radium/issues/1158
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
}

build() {
  cd "${pkgname}-${pkgver}"

  RADIUM_USE_CLANG=1 RADIUM_QT_VERSION=5 make packages
  RADIUM_USE_CLANG=1 RADIUM_QT_VERSION=5 BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install radium and its packages to /opt
  ./install.sh "${pkgdir}/opt"

  # Create startup script according to bin/packages/README
  mkdir -p "${pkgdir}/usr/bin"
  echo '#!/bin/bash' > "${pkgdir}/usr/bin/radium"
  echo LADSPA_PATH="$LADSPA_PATH:/usr/lib/ladspa" \
    QT_QPA_PLATFORM_PLUGIN_PATH="$($(RADIUM_QT_VERSION=5 ./find_moc_and_uic_paths.sh qmake) -query QT_INSTALL_PLUGINS)" \
    /opt/radium/radium >> "${pkgdir}/usr/bin/radium"
  chmod +x "${pkgdir}/usr/bin/radium"

  # Icons, .desktop and mimetype files
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{16x16,32x32,128x128,256x256}"/apps" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/mime/packages"
  ln -s "/opt/radium/radium_16x16x8.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/radium.png"
  ln -s "/opt/radium/radium_32x32x24.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/radium.png"
  ln -s "/opt/radium/radium_128x128x32.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/radium.png"
  ln -s "/opt/radium/radium_256x256x32.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radium.png"
  ln -s "/opt/radium/radium.desktop" "${pkgdir}/usr/share/applications/radium.desktop"
  ln -s "/opt/radium/radium-mimetype.xml" "${pkgdir}/usr/share/mime/packages/radium.xml"
}

warn_build_references() {
  # Radium author would prefer if binaries are left unstripped.
  # Meaning debug information inside them will reference build dir, this silences the warning from makepkg.
  # https://github.com/kmatheussen/radium/issues/1153#issuecomment-421543245
  true
}

# vim:set sw=2 ts=2 et:
