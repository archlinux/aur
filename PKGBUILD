# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: pigt <pay2630 at gmail dot com>

_name=todour
pkgname=${_name}-git
pkgver=2.22.r0.g900cada
pkgrel=1
pkgdesc="An application for handling todo.txt files."
arch=('i686' 'x86_64')
url="https://nerdur.com/todour-pl/"
license=('GPL')
depends=(qt5-base)
makedepends=(git)
conflicts=(${_name})
provides=(${_name})
source=('git+https://github.com/SverrirValgeirsson/todour.git'
        'git+https://github.com/falceeffect/UGlobalHotkey.git'
        'git+https://github.com/gamecreature/QtAwesome.git'
        'todour.desktop')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '1c2c52be2c88a64ad58d8ac935b08aae')


pkgver() {
  cd ${_name}
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd ${_name}
  git submodule init
  git config submodule.UGlobalHotkey.url "$srcdir"/UGlobalHotkey
  git config submodule.QtAwesome.url "$srcdir"/QtAwesome
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_name}
  qmake-qt5
  make
}

package() {
  cd ${_name}
  install -dm755 ${pkgdir}/usr/bin
  install -m755 Todour ${pkgdir}/usr/bin/

  mkdir -p "$pkgdir"/usr/share/applications
  install -m 755 $_name.desktop $pkgdir/usr/share/applications/$_name.desktop
}
