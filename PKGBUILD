# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vapoursynth-editor
pkgver=R4
pkgrel=1
pkgdesc='VapourSynth script editor'
arch=('i686' 'x86_64')
url='https://bitbucket.org/mystery_keeper/vapoursynth-editor'
license=('CCPL' 'MIT')
depends=('desktop-file-utils' 'qt5-base' 'vapoursynth')
makedepends=('git')
install='vapoursynth-editor.install'
source=("git+https://bitbucket.org/mystery_keeper/vapoursynth-editor.git#tag=${pkgver,}"
        'vsedit.desktop')
sha256sums=('SKIP'
            'b6d24441cf5746ea4dc08ecf379c67695bac663deb394db4334ba6aba9474c0f')

prepare() {
  cd vapoursynth-editor

  sed 's|QCoreApplication::applicationDirPath() + "/fonts"|"/usr/share/vsedit"|g' -i src/mainwindow.cpp
}

build() {
  cd vapoursynth-editor/pro

  qmake-qt5
  make
}

package() {
  if [[ $CARCH == i686 ]]; then
    cd vapoursynth-editor/build/release-32bit-gcc
  elif [[ $CARCH == x86_64 ]]; then
    cd vapoursynth-editor/build/release-64bit-gcc
  fi

  install -dm 755 "${pkgdir}"/usr/{bin,share/{applications,pixmaps}}
  install -m 755 vsedit "${pkgdir}"/usr/bin/
  install -m 644 vsedit.svg "${pkgdir}"/usr/share/pixmaps/
  install -m 644 ../../../vsedit.desktop "${pkgdir}"/usr/share/applications/

  install -dm 755 "${pkgdir}"/usr/share/licenses/vapoursynth-editor
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/vapoursynth-editor/
}

# vim: ts=2 sw=2 et:
