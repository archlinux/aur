# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=jamesdsp
_app_id=me.timschneeberger.jdsp4linux
pkgver=2.7.0
pkgrel=1
pkgdesc="An audio effect processor for PipeWire clients"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL3')
depends=('glibmm' 'hicolor-icon-theme' 'libarchive' 'libpipewire' 'qt6-svg')
makedepends=('git')
conflicts=('jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
replaces=('jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
options=('!strip')
_commit=30a30aa5ce90f97ea2c93bc372c0a67c8e3c54c8  # tags/2.7.0^0
source=("git+https://github.com/Audio4Linux/JDSP4Linux.git#commit=$_commit"
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
  cd "$srcdir/JDSP4Linux"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/JDSP4Linux"
  git submodule init
  for submodule in GraphicEQWidget FlatTabWidget LiquidEqualizerWidget LiveprogIDE; do
    git config submodule.src/subprojects/"$submodule".url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update

  mkdir -p build
}

build() {
  cd "$srcdir/JDSP4Linux"

  pushd build
  qmake6 ..
  make
  strip --strip-unneeded src/jamesdsp
  popd
}

package() {
  cd "$srcdir/JDSP4Linux"
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
