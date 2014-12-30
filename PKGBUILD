# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=vapoursynth-editor-git
pkgver=r4.1.g545df58
pkgrel=1
pkgdesc="A simple program for edit/create VapourSynth scripts. (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?p=1688477"
license=('CCPL' 'MIT' 'LGPL')
depends=('desktop-file-utils' 'qt5-base' 'vapoursynth')
makedepends=('git')
provides=('vapoursynth-editor')
conflicts=('vapoursynth-editor')
install=vapoursynth-editor-git.install
source=('git+https://bitbucket.org/mystery_keeper/vapoursynth-editor.git'
        'vsedit.desktop')
sha1sums=('SKIP'
          '24f1d7b833b7e0d69efad2c2276673ced3f02f6b')
_gitname='vapoursynth-editor'

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  rm -fr build
  git clone "file://${srcdir}/vapoursynth-editor" build
}

build() {
  cd build/pro
  qmake-qt5
  make
}

package() {
  install -Dm644 ../vsedit.desktop "${pkgdir}/usr/share/applications/vsedit.desktop"

  [ "${CARCH}" = "i686" ] && _arch=32
  [ "${CARCH}" = "x86_64" ] && _arch=64

  cd "build/build/release-${_arch}bit-gcc"
  install -Dm755 vsedit "${pkgdir}/usr/bin/vsedit"
  install -Dm644 vsedit.svg "${pkgdir}/usr/share/pixmaps/vsedit.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/vsedit/README"
}
