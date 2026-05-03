# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=jamesdsp-git
_app_id=me.timschneeberger.jdsp4linux
pkgver=2.7.0.r78.geb848bf
pkgrel=1
pkgdesc="An audio effect processor for PipeWire clients"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL-3.0-or-later')
depends=(
  'glibmm'
  'hicolor-icon-theme'
  'libarchive'
  'libpipewire'
  'libxcb'
  'qt6-base'
  'qt6-svg'
)
makedepends=(
  'desktop-file-utils'
  'git'
)
checkdepends=('appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
options=('debug')
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
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd JDSP4Linux
  git submodule init
  for submodule in GraphicEQWidget FlatTabWidget LiquidEqualizerWidget LiveprogIDE; do
    git config submodule.src/subprojects/"${submodule}".url "$srcdir/${submodule}"
  done
  git -c protocol.file.allow=always submodule update

  mkdir -p build

  # Add StartupWMClass to desktop file
  desktop-file-edit --set-key=StartupWMClass --set-value=jamesdsp \
    "meta/flatpak/${_app_id}.desktop"
}

build() {
  cd JDSP4Linux

  pushd build
  qmake6 \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}" \
    ..
  make
  popd
}

check() {
  cd JDSP4Linux
  appstreamcli validate --no-net "meta/flatpak/${_app_id}.metainfo.xml" || :
  desktop-file-validate "meta/flatpak/${_app_id}.desktop"
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
