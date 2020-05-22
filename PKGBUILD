# Maintainer: Teteros <teteros at teknik dot io>
# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=radium
pkgver=5.9.98
pkgrel=2
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
  'ladspa-plugins: Package group for default radium plugins included in binary releases'
  'python: Used for scheme scripting'
)
options=(!strip)
source=(https://github.com/kmatheussen/radium/archive/$pkgver.tar.gz
        0001-Linux-Macosx-Fix-compiling-with-newer-bdf.h.patch
        0002-Build-Add-RADIUM_VST2SDK_PATH-environment-variable.patch
        0003-Editor-Fix-assertion-window-popping-up-when-assignin.patch
        0004-MIDI-Don-t-apply-channel-to-MIDI-system-messages-0xf.patch
        0005-Sequencer-Fix-vertical-seqtrack-scrollbar-not-always.patch
        0006-Blocks-Fix-undo-delete-insert-block.-It-messed-up-th.patch
        0007-Linux-Only-use-included-libxcb-if-the-system-version.patch
        0008-Build-Allow-skipping-libxcb-compile-with-env-vars.patch
        0009-Build-Switch-to-clang-to-build-libpd-master.patch)
sha256sums=('3b1b5b9f72536d79561f602f278611979fbc9a8720cd3064c001998a22de9e90'
            'cd8a424cbe379ab38eb705d6b56a1e65b67879fee1eb87f7e226b944af9ad3de'
            '83d90f5418ca7429ed4e3c7ba9392b3bb4191528c2681f076f56ffe6f7617eef'
            '9baab8d625955070dbf92b37095c34b8b3c7fa80c1838e651f2f1430b5221a34'
            '4642e56d315d65a8a60f5bc57fabcee5daa1a7fc45feca88a472d8d3cfedda36'
            '34f9d7e75978e8dffcb4c1f56b0d7f69376037c7c04daa44b8a7cf6b90cb0342'
            'e3e1ab4936ddbbc37eb4d0da6f6d6b8013aca22afa5944c0148675325a7760b0'
            '0be52efa89ba74c9f90cdfd5fcc29dbfbeb1f9bae12f59def113f682de84d7f6'
            'f64abc5bd3eb9373f62702dd58e047e6cad7e5c3774f5a7c1045cc58e05a5111'
            'd8610fb4e104ea6763777001c614f35ff109da046b9d47b4955a014397368fdf')

prepare() {
  cd radium-$pkgver

  # Hotfixes for 5.9.98 release suggested by developer, see issue #1250
  # https://github.com/kmatheussen/radium/issues/1250#issuecomment-631935368
  for commit in "$srcdir"/000?-*.patch; do patch -p1 < "$commit"; done

  # Edit new file template and demo songs to be compatible with chorus plugin from calf-ladspa
  for file in bin/sounds/*.rad; do sed -i -e 's/Calf MultiChorus LADSPA/Calf Multi Chorus LADSPA/g' "$file"; done
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
