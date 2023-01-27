# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

_name=music-radar
pkgname=${_name}-git
pkgver=0.1+git45.4e4b5aac
pkgrel=1
pkgdesc="Music Recognition application for Linux Desktop"
arch=('i686' 'x86_64')
url="https://github.com/keshavbhatt/${_name}"
license=('GPL')
depends=('qt5-multimedia')

conflicts=(${_name})
provides=(${_name})

source=("git+https://github.com/keshavbhatt/${_name}.git"
        "git+https://github.com/chrizbee/QtStyler")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  _ver=0.1
  [ -z "$(git tag -l ${_ver})" ] && git tag ${_ver} f0d4368 
  git describe --tags --always --abbrev=8 | sed 's/-g/./;s/-/+git/;s/^v//g'
}

prepare() {
  cd ${srcdir}/${_name}
  git submodule init
  git config submodule.src/lib/QtStyler.url "$srcdir/QtStyler"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${srcdir}/${_name}
  qmake src/${_name}.pro
  make PREFIX=/usr
}

package() {
  cd ${srcdir}/${_name}
  make INSTALL_ROOT="${pkgdir}" install
}
