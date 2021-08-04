# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>
# Contribuytor: Stefan Husmann <stefan-husmann@t-online.de>

_gitname=CuteMarkEd-NG
pkgname=cutemarked
pkgver=20210729.r935
pkgrel=1
pkgdesc="Qt Markdown Editor"
url="https://github.com/Waqar144/${_gitname}"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-webengine')
makedepends=('git' 'qt5-tools')
source=("git+$url.git"
	"git+https://github.com/hunspell/hunspell.git"
	"git+https://github.com/mity/md4c"
	"https://github.com/pbek/qmarkdowntextedit"
       )
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd $_gitname
   printf "%s.r%s" $(git log -1 --format="%cd" --date=short | tr -d '-') $(git rev-list --count HEAD)
}

prepare() {
  cd $_gitname
  git submodule init
  for __submodule in hunspell md4c qmarkdowntextedit
  do git config submodule.${__submodule}.url "$srcdir"/${_gitname}/3rdparty/${__submodule}
  done
  git submodule update
}

build() {
  cd $_gitname
  [[ -d build ]] || mkdir build
  cd build
  qmake ..
  make
}

package() {
  cd $_gitname/build
  make INSTALL_ROOT="$pkgdir" install
}
