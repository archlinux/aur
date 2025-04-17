# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=jamesdsp
_app_id=me.timschneeberger.jdsp4linux
pkgver=2.7.0
pkgrel=4
pkgdesc="An audio effect processor for PipeWire clients"
arch=('x86_64')
url="https://github.com/Audio4Linux/JDSP4Linux"
license=('GPL-3.0-or-later')
depends=(
  'glibmm'
  'hicolor-icon-theme'
  'libarchive'
  'libpipewire'
  'qt6-svg'
)
makedepends=('git')
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
conflicts=('jdsp4linux' 'jdsp4linux-gui' 'gst-plugin-jamesdsp')
options=('!strip')
source=("git+https://github.com/Audio4Linux/JDSP4Linux.git#tag=$pkgver"
        'git+https://github.com/ThePBone/GraphicEQWidget.git'
        'git+https://github.com/ThePBone/FlatTabWidget.git'
        'git+https://github.com/ThePBone/LiquidEqualizerWidget.git'
        'git+https://github.com/ThePBone/LiveprogIDE.git'
        'gcc14.patch'
        'pipewire-1.4.0.patch'
        'qt-6.9.patch')
sha256sums=('5ec9e4a5206d164804848982b0948ba5d7bb1c742feb5c669869847c2cb5575e'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'cd327a8356072202368e0965c1e5aa6a57abddd13c5d6483af03d0f4deff7143'
            '08070aa68a68d84bd7672d2f8306a476a831ee97a3f94d93e53c02286d80c659'
            'f3e20cb99a4e8d4535a3ee0c5ae2bc9ee5faa3ba95b17444d3bdd7120cd19eeb')

prepare() {
  cd JDSP4Linux
  git submodule init
  for submodule in GraphicEQWidget FlatTabWidget LiquidEqualizerWidget LiveprogIDE; do
    git config submodule.src/subprojects/"${submodule}".url "$srcdir/${submodule}"
  done
  git -c protocol.file.allow=always submodule update

  mkdir -p build

  # https://github.com/Audio4Linux/JDSP4Linux/pull/191 (merged)
  patch -Np1 -i ../gcc14.patch

  # https://github.com/Audio4Linux/JDSP4Linux/pull/241 (merged)
  patch -Np1 -i ../pipewire-1.4.0.patch

  # https://github.com/Audio4Linux/JDSP4Linux/pull/246 (merged)
  patch -Np1 -i ../qt-6.9.patch
}

build() {
  cd JDSP4Linux

  pushd build
  qmake6 ..
  make
  strip --strip-unneeded src/jamesdsp
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
