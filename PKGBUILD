# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ob-xd
pkgver=2.9
pkgrel=1
pkgdesc='Virtual analog synthesizer based on the Oberheim OB-X, OB-Xa and OB-8 synths'
arch=('x86_64')
url='https://github.com/reales/OB-Xd'
license=('GPL3')
groups=('pro-audio' 'vst3-plugins' 'lv2-plugins')
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
  'lv2-host: for LV2 plugins'
)
options=('debug')
_commit='15a7e10297f7349cab3b3e7893b5fe7af7536661'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'use-global-path.patch'
  'skip-legacy-vst2-plugin.patch'
)
b2sums=('SKIP'
        '72a750e36d3b204472e78ed50e09ff2de5531f286b43fe4ab86ff7854868405caaa765d419cf35b2865c5edb2d5e105d15bfa91a38ce6491504f2cd7bbe2bed6'
        '37f805531f8986b2a409912c0f0d60589e4bfa27932a4b583b57d889f99501870f7b60647c02e73d14b0945476377d9d926edb9ceb2001a395e8c292f6867926')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # use global path
  patch -p1 -i "$srcdir/use-global-path.patch"

  # skip legacy VST2 plugin
  patch -p1 -i "$srcdir/skip-legacy-vst2-plugin.patch"
  sed -e 's/JUCEOPTIONS /JUCEOPTIONS JUCE_VST3_CAN_REPLACE_VST2="0" /' -i OB-Xd.jucer

  # use system juce
  sed -e 's/useGlobalPath="0"/useGlobalPath="1"/g' -i OB-Xd.jucer

  # generate desktop file
  gendesk -n \
    --exec OB-Xd \
    --name OB-Xd \
    --pkgname com.discoDSP.Obxd \
    --pkgdesc "$pkgdesc" \
    --icon "$pkgname" \
    --genericname "Virtual analog synthesizer"
}

build() {
  cd "$pkgname"

  Projucer --resave OB-Xd.jucer

  make -C Builds/LinuxMakefile
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/"{ob-xd,doc/ob-xd} \
    "$pkgdir/usr/lib/"{vst3,lv2}

  # application data
  cp -vr Documents/discoDSP/OB-Xd/{Banks,MIDI,Themes} "$pkgdir/usr/share/$pkgname"

  # application icon
  install -vDm644 Source/Images/appicon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # desktop file
  install -vDm644 -t "$pkgdir/usr/share/applications" com.discoDSP.Obxd.desktop

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" Documents/discoDSP/OB-Xd/*.pdf README.md

  # vst3
  cp -vr "$HOME"/.vst3/* "$pkgdir/usr/lib/vst3"

  # lv2
  cp -vr "$HOME"/.lv2/* "$pkgdir/usr/lib/lv2"

  # standalone
  install -vDm755 -t "$pkgdir/usr/bin" Builds/LinuxMakefile/build/OB-Xd
}
