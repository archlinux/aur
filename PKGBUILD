# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ob-xd
pkgver=2.10
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
_commit='2afc035ac3e70171a71840bbc2f859715b6ce765'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'use-global-path.patch'
  'skip-legacy-vst2-plugin.patch'
  'skip-plugin-copy.patch'
  'use-system-juce.patch'
)
b2sums=('SKIP'
        '9e9954ff7aeedc176e4f12ed9fcc97bac7b2a1c45450adf27af7b7ab1f3869121b98eb4d5c93926416d09073b6bfb937d89115f31730abfdc4399b3c2526bac2'
        'b71a23ba0d7f48df9039fa7e8951e96818dfd0c57a49491d9984860cf0dccd120b3c54c3833a01d94cb723432493f282e9073a6ce6ab190d1abc616401600202'
        'c52749354ab0a8cd1e2a8d071f3d27ca5f8b9b6d3dd9b46855de9b8d883cea25e8aa649b661e50b276149a9f72d6208d5333680d86713c71040ca9f9e2082bb9'
        '9bfaf21ab88a016bff1adfa916252335757a387ba95fed5ab3584c4a03bd10795fb23108e8e0d645f84d94e789c1498717d472106b176b4336dbed34e3e149f7')

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

  # use system juce
  patch -p1 -i "$srcdir/use-system-juce.patch"

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

  cd Builds/LinuxMakefile

  # skip copying plugins to user home directory
  patch -p1 -i "$srcdir/skip-plugin-copy.patch"

  make
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

  cd Builds/LinuxMakefile/build

  # vst3
  cp -vr OB-Xd.vst3 "$pkgdir/usr/lib/vst3"

  # lv2
  cp -vr OB-Xd.lv2 "$pkgdir/usr/lib/lv2"

  # standalone
  install -vDm755 -t "$pkgdir/usr/bin" OB-Xd
}
