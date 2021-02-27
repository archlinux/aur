# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com >
# Based on corebird-non-streaming-git PKGBUILD

pkgname=cawbird-git
_pkgname=cawbird
pkgver=1.3.2.r76.g825a7825
pkgrel=1
pkgdesc="A fork of the Corebird GTK Twitter client that continues to work with Twitter "
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/ibboard/cawbird/"
depends=('gspell' 'gstreamer' 'liboauth')
optdepends=('noto-fonts-emoji: Emoji support')
makedepends=('vala' 'git' 'meson' 'intltool')
provides=('corebird')
conflicts=('corebird' 'corebird-git' 'corebird-non-streaming-git')
source=("${pkgname}::git+https://github.com/IBBoard/cawbird.git"
        'consumer_k.dat'
        'consumer_s.dat')
sha1sums=('SKIP'
          'SKIP'
          'SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48

}

prepare() {
  cd "$pkgname"
  cp -t data/ "$srcdir/consumer_k.dat" "$srcdir/consumer_s.dat"
}

build() {
  cd ${pkgname}

  meson builddir --prefix=/usr -D VIDEO=yes -D SPELLCHECK=yes
  ninja -C builddir
}

package() {
  cd ${pkgname}

  DESTDIR="${pkgdir}" ninja -C builddir install
}
