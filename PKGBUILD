# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=ob-xd
pkgname=(
  'ob-xd'
  'ob-xd-common'
  'ob-xd-standalone'
  'ob-xd-lv2'
  'ob-xd-vst3'
)
pkgver=2.10
pkgrel=2
pkgdesc='Virtual analog synthesizer based on the Oberheim OB-X, OB-Xa and OB-8 synths'
arch=('x86_64')
url='https://github.com/reales/OB-Xd'
license=('GPL3')
groups=('pro-audio')
_common_depends=(
  'glibc'
  'gcc-libs'
  'libogg'
  'libpng'
  'zlib'
  'alsa-lib'
  'libjpeg-turbo'
  'libvorbis'
  'flac'
  'freetype2'
  'libglvnd'
  'curl'
)
makedepends=(
  "${_common_depends[@]}"
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
# NOTE: Upstream nuked the repository, not sure why.
# Thankfully, I had a copy lying around, and have
# reuploaded to github.com/grawlinson/OB-Xd
_commit='4f4e47bada73be219b414019ea5353503a2479d2'
source=(
  "$pkgname::git+https://github.com/grawlinson/OB-Xd#commit=$_commit"
  'use-global-path.patch'
  'skip-legacy-vst2-plugin.patch'
  'skip-plugin-copy.patch'
  'use-system-juce.patch'
)
b2sums=('SKIP'
        '9e9954ff7aeedc176e4f12ed9fcc97bac7b2a1c45450adf27af7b7ab1f3869121b98eb4d5c93926416d09073b6bfb937d89115f31730abfdc4399b3c2526bac2'
        '44fe61c94be2e8727c548e729f2acaf15bd5dd401c24085d5bbec38914c182f92ab4fd09a5feddc85b3fbb41459360796643cc7a5703afb2944b8743d89aac3b'
        'c52749354ab0a8cd1e2a8d071f3d27ca5f8b9b6d3dd9b46855de9b8d883cea25e8aa649b661e50b276149a9f72d6208d5333680d86713c71040ca9f9e2082bb9'
        '4037b2a97d841e59f380028903127e81c439d93c21f1397ee1d05b1c3047f35a78115aa58de8fdd325e6ed3bdbb5cc4cf5d36d582cf7557fb96fed5edda4a5f3')

prepare() {
  cd "$pkgbase"

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
  cd "$pkgbase"

  Projucer --resave OB-Xd\ Linux.jucer

  cd Builds/LinuxMakefile

  # skip copying plugins to user home directory
  #patch -p1 -i "$srcdir/skip-plugin-copy.patch"

  make
}

package_ob-xd() {
  depends=($pkgbase-{common,standalone,vst3,lv2})
}

package_ob-xd-common() {
  pkgdesc="Common files for OB-Xd"

  cd "$pkgbase"

  # application data
  install -vd "$pkgdir/usr/share/$pkgbase"
  cp -vr Documents/discoDSP/OB-Xd/{Banks,MIDI,Themes} "$pkgdir/usr/share/$pkgbase"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" Documents/discoDSP/OB-Xd/*.pdf README.md
}

package_ob-xd-standalone() {
  pkgdesc+=' - standalone'
  depends=(
    "ob-xd-common=$pkgver"
    "${_common_depends[@]}"
    'hicolor-icon-theme'
  )
  optdepends=('jack: audio backend')

  cd "$pkgbase"

  # application icon
  install -vDm644 Source/Images/appicon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  # desktop file
  install -vDm644 -t "$pkgdir/usr/share/applications" com.discoDSP.Obxd.desktop

  # standalone
  cd Builds/LinuxMakefile/build
  install -vDm755 -t "$pkgdir/usr/bin" OB-Xd
}

package_ob-xd-vst3() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "ob-xd-common=$pkgver"
    "${_common_depends[@]}"
    'vst3-host'
  )
  optdepends=('jack: audio backend')

  # create directory
  install -vd "$pkgdir/usr/lib/vst3"

  # vst3 plugin
  cd "$pkgbase/Builds/LinuxMakefile/build"
  cp -vr OB-Xd.vst3 "$pkgdir/usr/lib/vst3"
}

package_ob-xd-lv2() {
  pkgdesc+=' - LV2 plugin'
  groups+=('lv2-plugins')
  depends=(
    "ob-xd-common=$pkgver"
    "${_common_depends[@]}"
    'lv2-host'
  )
  optdepends=('jack: audio backend')

  # create directory
  install -vd "$pkgdir/usr/lib/lv2"

  # lv2 plugin
  cd "$pkgbase/Builds/LinuxMakefile/build"
  cp -vr OB-Xd.lv2 "$pkgdir/usr/lib/lv2"
}
