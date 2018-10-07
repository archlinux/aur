# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Teteros <teteros at teknik dot io>

pkgname=radium
pkgver=5.9.5
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
sha256sums=('f353e9a3dbc18f2497cc78d9d5e1a8f48c7d25b117069b1c1d77ca50cbd44534'
            'f2596261f9ebd859f9850cbfc97edb7fd5d45cf8768ce47d0721cbf4b2d80c7e'
            '94de9befbe6530c721917445ee3a0c0202371e1b2229784b2ea6e0c0efaf7808'
            '75c606ed2c0f1f42449b2b2a7f6936c37be7a78e658ef4306f21edcd16eb2304'
            '413523f60ae7dea7aa2e223fc035f57b05693eea17ba3889eafaca9173fe5f3d')

prepare() {
  cd "${pkgname}-${pkgver}"

  # glibc-2.27 deprecated legacy rpc, header files for libpd are in libtirpc
  patch -p1 < "${srcdir}/use-libtirpc-headers.patch"

  # Use system libxcb 1.13 instead of radium's to reduce build time
  patch -p1 < "${srcdir}/use-system-libxcb.patch"

  # JUCE expects the VST SDK in home directory, this adds paths for SDK in steinberg-vst36
  patch -p1 < "${srcdir}/use-system-vstsdk.patch"

  # FAUST package is not compatible with LLVM<4.0.1
  # Link llvm40 statically in radium and faust binaries to avoid conflicts with system llvm
  # https://github.com/kmatheussen/radium/issues/1068
  # https://users.notam02.no/~kjetism/radium/forum/viewtopic.php?f=7&t=39
  patch -p1 < "${srcdir}/use-static-llvm40.patch"
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
  echo '#!/bin/sh' > "${pkgdir}/usr/bin/radium"
  echo QT_QPA_PLATFORM_PLUGIN_PATH="$($(RADIUM_QT_VERSION=5 ./find_moc_and_uic_paths.sh qmake) -query QT_INSTALL_PLUGINS)" \
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
