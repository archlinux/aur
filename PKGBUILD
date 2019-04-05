# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Teteros <teteros at teknik dot io>

pkgname=radium
pkgver=5.9.52
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
  'cmake'
  'libxcursor'
  'libxinerama'
  'libxkbfile'
  'libxrandr'
  'llvm40'
  'qt5-tools'
  'steinberg-vst36'
)
optdepends=(
  'calf-ladspa: Default chorus plugin'
  'ladspa-plugins: Package group for default radium plugins incl in binary releases'
)
options=(!strip) # https://github.com/kmatheussen/radium/issues/1153#issuecomment-421543245
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz"
        "use-libtirpc-headers.patch"
        "use-system-libxcb.patch"
        "use-system-vstsdk.patch"
        "use-static-llvm40.patch")
sha256sums=('86afd2977bc091faca0235f1fd48226233e111e9e50b4c52e1762e8e07cdbc3b'
            'f2596261f9ebd859f9850cbfc97edb7fd5d45cf8768ce47d0721cbf4b2d80c7e'
            '94de9befbe6530c721917445ee3a0c0202371e1b2229784b2ea6e0c0efaf7808'
            'aefb2973d28056956d55ff89c7ff77e36e6a1213463741d72bf1afe2cfb5affe'
            '8b5a038fd3320bd49ed2cd81150aa2550c5f5389529f24fbcd603755977644a7')

prepare() {
  cd "${pkgname}-${pkgver}"

  # glibc-2.27 deprecated legacy rpc, header files for libpd are in libtirpc
  patch -p1 < "${srcdir}/use-libtirpc-headers.patch"

  # Use system libxcb 1.13 instead of radium's to reduce build time
  patch -p1 < "${srcdir}/use-system-libxcb.patch"

  # JUCE expects the VST SDK in home directory, this adds paths for SDK in steinberg-vst36 from AUR
  patch -p1 < "${srcdir}/use-system-vstsdk.patch"

  # Bundled FAUST package is not compatible with LLVM above 4.0.1
  # Link llvm40 statically in radium and faust binaries to avoid conflicts with system llvm
  # https://github.com/kmatheussen/radium/issues/1174
  patch -p1 < "${srcdir}/use-static-llvm40.patch"

  # The optional calf-ladspa package in AUR switched to LMMS's 'veal' fork of Calf LADSPA
  # Radium's demo and new .rad song files reference the old/unmaintained calf plugins used in its binary distribution
  # Currently only Calf's 'Multi-Chorus' plugin is used in the preset chorus bus which is replaced by a pipe if missing
  # Simple sed search and replace can be used to replace the old chorus plugin name with the one used in 'veal' plugins
  # https://github.com/kmatheussen/radium/issues/1158
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
}

build() {
  cd "${pkgname}-${pkgver}"

  RADIUM_QT_VERSION=5 make packages
  RADIUM_QT_VERSION=5 BUILDTYPE=RELEASE ./build_linux.sh
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

# vim:set sw=2 ts=2 indentexpr=GetShIndent() et:
