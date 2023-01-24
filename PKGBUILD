# Maintainer: KNOSSOS team <knossosteam ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIN/

pkgname=knossos-git
pkgver=5.1+899.g17e8d9d6
pkgrel=1
arch=(x86_64)
pkgdesc='A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity.'
url='https://knossos.app'
license=(GPL2)
depends=(glu
  qt5-base
  pythonqt-knossos-git
  quazip-qt5
  snappy
)
makedepends=(boost
  cmake
  git
  ninja
)
checkdepends=(xorg-server-xvfb)
optdepends=(qt5-imageformats) # Jp2
source=('git+https://github.com/knossos-project/knossos.git' 'knossos-git.desktop')
md5sums=('SKIP'
         '85ae9c1721e627ccbe4eb850dcb7c42d')

pkgver() {
  cd 'knossos'
  git describe --always --dirty --tags | sed 's/^v//;s/-/+/;s/-/./g'
}

prepare() {
  pythonqt="Qt5Python$(pacman -Q python | cut -d' ' -f2 | cut -d. -f1-2 --output-delimiter '')"
  echo using $pythonqt
  cmake -G Ninja -Dpythonqt="$pythonqt" -S knossos -B "build-$CHOST-$pkgname"
}

build() {
  cmake --build "build-$CHOST-$pkgname"
}

check() {
  env QT_QPA_PLATFORM=offscreen xvfb-run "build-$CHOST-$pkgname/knossos" exit
}

package() {
  env DESTDIR="$pkgdir" cmake --install "build-$CHOST-$pkgname"
  install -Dm755 "build-$CHOST-$pkgname/knossos" "$pkgdir/usr/bin/knossos-git"
  install -Dm644 "knossos/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos-git.png"
  install -Dm644 "knossos-git.desktop" "$pkgdir/usr/share/applications/knossos-git.desktop"
}
