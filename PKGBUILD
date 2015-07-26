# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=mars-shooter-git
pkgver=0.7.4.r7.c855d04
pkgrel=1
pkgdesc="A ridiculous space shooter with nice graphics (development version)"
arch=('i686' 'x86_64')
url="http://mars-game.sourceforge.net/"
license=('custom' 'GPL')
install=mars.install
depends=('sfml' 'taglib' 'fribidi' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
provides=('mars-shooter')
conflicts=('mars-shooter')
source=(mars-shooter::"git+https://github.com/thelaui/M.A.R.S..git"
        mars-fribidi.patch
        mars-shader.patch::"https://github.com/thelaui/M.A.R.S./pull/2.patch"
        mars-noglu.patch::"https://github.com/thelaui/M.A.R.S./pull/17.patch"
        mars-archinstall.patch)
sha256sums=('SKIP'
            '6fb105bd6c7f0b3c35bedc13240e1b1f9ad37bb5b4b1328438532b4f40e19c6e'
            '2cb61532d94eb68100ddf24888c513a06ef44c32fc867a3b20dfd901d0a0b1d2'
            '729fb013fe4ad95e2a15e59bf1ce94eddc3fc42f942253522a9e7b041e052664'
            'd33d6cd40bf6b2846c069524ed3344e2f4c3afe373e89c74d3e4888d63e2261a')

pkgver() {
  cd mars-shooter
  # todo: remove hardcoded version number (when proper tags are in repo)
  printf "0.7.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # reset build dir
  rm -rf build
  mkdir build

  cd mars-shooter
  # add include dir of fribidi
  patch -Np1 < ../mars-fribidi.patch
  # fix use of sfml2 shader
  patch -Np1 < ../mars-shader.patch
  # remove glu dependency
  patch -Np1 < ../mars-noglu.patch
  # fix install target
  patch -Np0 < ../mars-archinstall.patch
  # fix executable name in and remove mimetype from launcher
  sed 's/Exec=mars$/&-shooter/;/MimeType=.*/d' -i resources/mars.desktop
}

build() {
  cd build

  cmake ../mars-shooter -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # rename executable
  mv "$pkgdir"/usr/bin/mars "$pkgdir"/usr/bin/mars-shooter
}
