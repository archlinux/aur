# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=jamesdsp-git
_app_id=me.timschneeberger.jdsp4linux.pipewire
pkgver=2.4.r150.g9691df5
pkgrel=1
pkgdesc="An audio effect processor for PipeWire clients"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL3')
depends=('glibmm' 'hicolor-icon-theme' 'libarchive' 'libportal-qt5' 'libpipewire'
         'qt5-svg')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
replaces=('jdsp4linux-git' 'jdsp4linux-gui-git' 'gst-plugin-jamesdsp-git')
options=('debug')
source=('git+https://github.com/Audio4Linux/JDSP4Linux.git'
        'git+https://github.com/ThePBone/GraphicEQWidget.git'
        'git+https://github.com/ThePBone/FlatTabWidget.git'
        'git+https://github.com/ThePBone/LiquidEqualizerWidget.git'
        'git+https://github.com/ThePBone/EELEditor.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
    "$pkgdir/usr/share/pixmaps/${_app_id}.png"
  install -Dm644 resources/icons/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "meta/flatpak/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "meta/flatpak/${_app_id}.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"
}
