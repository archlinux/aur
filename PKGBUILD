# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=jamesdsp-git
pkgver=2.4.r124.gd46304d
pkgrel=2
pkgdesc="An audio effect processor for PipeWire clients"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL3')
depends=('glibmm' 'pipewire' 'qt5-svg')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
replaces=('jdsp4linux-git' 'jdsp4linux-gui-git' 'gst-plugin-jamesdsp-git')
options=('debug')
source=('git+https://github.com/Audio4Linux/JDSP4Linux.git'
        'git+https://github.com/ThePBone/EELEditor.git'
        'git+https://github.com/ThePBone/GraphicEQWidget.git'
        'git+https://github.com/ThePBone/FlatTabWidget.git'
        'git+https://github.com/ThePBone/LiquidEqualizerWidget.git'
        'jamesdsp.desktop'
        'gcc13.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c6496e6981471aa3f8d1593673991e422d243ff3efe595b3230de713588599c3'
            '55588ee09012aeb3def9f32265b78570a2ffbcbba4a975d43b8d94673ecfb285')

pkgver() {
  cd "$srcdir/JDSP4Linux"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/JDSP4Linux"

  for submodule in EELEditor GraphicEQWidget FlatTabWidget LiquidEqualizerWidget; do
    git submodule init
    git config submodule.src/subprojects/"$submodule".url "$srcdir/$submodule"
    git -c protocol.file.allow=always submodule update
  done

  mkdir -p build

  # Fix build with GCC 13
  patch -Np1 -i ../gcc13.patch
}

build() {
  cd "$srcdir/JDSP4Linux"

  pushd build
  qmake-qt5 ..
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
