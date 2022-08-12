# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=jamesdsp
pkgver=2.3
pkgrel=5
pkgdesc="An audio effect processor for PipeWire clients"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL3')
depends=('glibmm' 'pipewire' 'qt5-svg')
makedepends=('git')
conflicts=('jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
replaces=('jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
_commit=1f49c84c222a02d9e9e2e1a4a2fb04397ce7017b
source=("git+https://github.com/Audio4Linux/JDSP4Linux.git#commit=$_commit"
        'git+https://github.com/ThePBone/EELEditor.git'
        'git+https://github.com/ThePBone/GraphicEQWidget.git'
        'git+https://github.com/ThePBone/FlatTabWidget.git'
        'git+https://github.com/ThePBone/LiquidEqualizerWidget.git'
        'jamesdsp.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c6496e6981471aa3f8d1593673991e422d243ff3efe595b3230de713588599c3')

pkgver() {
  cd "$srcdir/JDSP4Linux"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/JDSP4Linux"

  for submodule in EELEditor GraphicEQWidget FlatTabWidget LiquidEqualizerWidget; do
    git submodule init
    git config submodule.src/subprojects/"$submodule".url "$srcdir/$submodule"
    git submodule update
  done

  mkdir -p build
}

build() {
  cd "$srcdir/JDSP4Linux"

  pushd build
  qmake-qt5 ../JDSP4Linux.pro
  make
  popd
}

package() {
  cd "$srcdir/JDSP4Linux"
  install -Dm755 build/src/jamesdsp -t "$pkgdir/usr/bin/"
  install -Dm644 resources/icons/icon.png \
    "$pkgdir/usr/share/pixmaps/jamesdsp.png"
  install -Dm644 resources/icons/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/jamesdsp.svg"
  install -Dm644 "$srcdir/jamesdsp.desktop" -t "$pkgdir/usr/share/applications/"
}
