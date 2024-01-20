# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=jamesdsp-pulse-git
_app_id=me.timschneeberger.jdsp4linux.pulse
pkgver=2.7.0.r0.g30a30aa
pkgrel=1
pkgdesc="An audio effect processor for PulseAudio clients"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL-3.0-or-later')
depends=('glibmm' 'gst-plugins-good' 'hicolor-icon-theme' 'libarchive' 'libpulse'
         'qt6-svg')
makedepends=('git')
provides=("${pkgname%-git}" 'jamesdsp')
conflicts=("${pkgname%-git}" 'jamesdsp' 'jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
replaces=('jdsp4linux-git' 'jdsp4linux-gui-git' 'gst-plugin-jamesdsp-git')
options=('!strip' 'debug')
source=('git+https://github.com/Audio4Linux/JDSP4Linux.git'
        'git+https://github.com/ThePBone/GraphicEQWidget.git'
        'git+https://github.com/ThePBone/FlatTabWidget.git'
        'git+https://github.com/ThePBone/LiquidEqualizerWidget.git'
        'git+https://github.com/ThePBone/LiveprogIDE.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd JDSP4Linux
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd JDSP4Linux
  git submodule init
  for submodule in GraphicEQWidget FlatTabWidget LiquidEqualizerWidget LiveprogIDE; do
    git config submodule.src/subprojects/"${submodule}".url "$srcdir/${submodule}"
  done
  git -c protocol.file.allow=always submodule update

  mkdir -p build
}

build() {
  cd JDSP4Linux

  pushd build
  qmake6 .. "CONFIG += USE_PULSEAUDIO"
  make
  strip --strip-unneeded src/jamesdsp
  popd
}

package() {
  cd JDSP4Linux
  install -Dm755 build/src/jamesdsp -t "$pkgdir/usr/bin/"
  install -Dm644 resources/icons/icon.png \
    "$pkgdir/usr/share/pixmaps/${_app_id}.png"
  install -Dm644 resources/icons/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "meta/flatpak/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "meta/flatpak/${_app_id}.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"
}
