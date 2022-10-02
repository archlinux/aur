# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=opl-synth
pkgver=2.2
pkgrel=1
pkgdesc='FM synthesizer that emulates the Yamaha OPL sound chip'
arch=('x86_64')
url='https://discodsp.com/opl/'
license=('GPL2')
groups=('pro-audio' 'vst3-plugins')
depends=(
  'alsa-lib'
  'hicolor-icon-theme'
  'libjpeg-turbo'
  'libvorbis'
  'flac'
  'freetype2'
  'libglvnd'
  'curl'
)
makedepends=(
  'git'
  'juce'
  'zlib'
  'libpng'
  'libogg'
  'jack'
  'libx11'
  'libxext'
  'libxrandr'
  'libxinerama'
  'libxcursor'
  'gendesk'
)
optdepends=(
  'jack: backend for standalone'
  'vst3-host: for VST3 plugins'
)
options=('debug')
_commit='e365b6d26afd66cb6d050d39102b5ac7c2225dd8'
source=(
  "$pkgname::git+https://github.com/reales/OPL#commit=$_commit"
  'use-global-path.patch'
)
b2sums=('SKIP'
        '842ffc32c162c170d885fa3e399e327dc146edbf79ae7beb64da607a6b2467a1942bd02a92a4ee4981142740a80caa76e2896bc9009c80c5740ffd44ac983fd9')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # skip VST2 generation
  sed -e 's:\(JUCE_VST3_CAN_REPLACE_VST2="\)1:\10:' -i OPL.jucer

  # use correct version
  # TODO figure out why the application strips the last digit
  # (e.g. x.y.z is displayed as x.y)
  sed -e "s:version=\"2.0.0\":version=\"${pkgver}.0\":" -i OPL.jucer

  # disable JUCE splash screen
  sed -e 's:\(displaySplashScreen="\)1:\10:' -i OPL.jucer

  # use global path for loading instruments
  patch -p1 -i "$srcdir/use-global-path.patch"

  # generate desktop file
  gendesk -n \
    --exec "$pkgname" \
    --name 'OPL Synthesizer' \
    --pkgname com.discoDSP.OPL \
    --pkgdesc "$pkgdesc" \
    --icon "$pkgname" \
    --genericname "Virtual FM synthesizer"
}

build() {
  cd "$pkgname"

  Projucer --resave OPL.jucer

  make -C Builds/Linux V=1
}

package() {
  cd "$pkgname"

  # create required directories
  install -vd \
    "$pkgdir/usr/lib/vst3" \
    "$pkgdir/usr/share/$pkgname"

  # standalone
  install -vDm755 Bin/Linux/Release/OPL "$pkgdir/usr/bin/$pkgname"

  # vst3
  cp -vr Bin/Linux/Release/OPL.vst3 "$pkgdir/usr/lib/vst3"

  # data
  cp -vr Documents/discoDSP/OPL/* "$pkgdir/usr/share/$pkgname"

  # desktop file
  install -vDm644 -t "$pkgdir/usr/share/applications" com.discoDSP.OPL.desktop

  # application icon
  install -vDm644 Media/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" readme.md
}
