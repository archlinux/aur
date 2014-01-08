# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=gngeo
pkgname=$_pkgbase-hg
pkgver=0.8.r95.6ad2a3d1bba3
pkgrel=1
pkgdesc="A portable command-line NeoGeo Emulator (development version)"
arch=('i686' 'x86_64')
url="https://code.google.com/p/gngeo/"
license=('custom GPL')
depends=('zlib' 'sdl')
optdepends=('libgl: OpenGL renderer backend')
makedepends=('mercurial' 'nasm' 'glu')
# nasm is x86-only
[ "$CARCH" == "x86_64" ] && makedepends=('mercurial' 'glu')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$pkgname.install
source=($_pkgbase::"hg+$url"
        "$_pkgbase.desktop"
        "$_pkgbase.png"
        "$pkgname.install")
sha256sums=('SKIP'
            'b66038445a4ac8f2fdc088a37013bc14cd2cca86e5bb2c5a68aa7942c17662d2'
            'b543425d51bd669fe5081b0b89492f18163c292194ac2a4acff683ba2a60063e'
            'a1fe0ad7b8f601abcca92650e225c28af45db0b9eb4d96f3bdc055af0fe5c635')

pkgver() {
  cd $_pkgbase

  # get latest tag, revision count and commit identifier
  printf "%s.r%s.%s" "$(hg parents --template {latesttag} | sed 's/gngeo_//')" \
    "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd $_pkgbase

  # change path
  sed 's#games/lib#share#' -i sample_gngeorc
}

build() {
  cd $_pkgbase

  ./configure --prefix=/usr
  # force single threaded build
  make -j1
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir/" install

  # install icon, .desktop, sample config and license file
  install -Dm644 ../$_pkgbase.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
  install -Dm644 ../$_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
  install -Dm644 sample_gngeorc "$pkgdir"/usr/share/$_pkgbase/sample_gngeorc
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgbase/COPYING
}
