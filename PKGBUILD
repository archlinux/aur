# Maintainer: Johann Klahn <kljohann@gmail.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>

pkgname=ledger-git
pkgdesc="A double-entry accounting system with a command-line reporting interface"
pkgver=20150609
pkgrel=1

_branch=next

## Uncomment this line if you want a debug build:
# _build=debug

_defines=(BUILD_DOCS=ON CMAKE_INSTALL_LIBDIR=lib/)

## Uncomment this line if you want to include the ledger-mode:
# _defines+=(BUILD_EMACSLISP=ON)

depends=('mpfr' 'boost-libs' 'libedit')
makedepends=('boost' 'git' 'sed' 'python2' 'cmake' 'texinfo' 'texlive-plainextra')
url="http://ledger-cli.org"
license=('BSD')
arch=('i686' 'x86_64')
provides=('ledger')
conflicts=('ledger')
[[ "${_build}" == "debug" ]] && options=('!strip')
install="ledger.install"
source=("ledger::git://github.com/ledger/ledger.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd ledger
  # git describe --always | sed 's|-|.|g'
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
  cd ledger
  find -iname '*.py' -execdir sed -i 's|^#!.*python$|#!/usr/bin/python2|' '{}' \;
  sed -i 's|^#!.*python$|#!/usr/bin/python2|' ./acprep

  # build fixes for boost 1.58
  git cherry-pick 48aec0f093ff64 68c9d649caa2c7
}

build() {
  cd ledger; rm -rf build
  ./acprep submodule
  ./acprep "${_build:-opt}" --output=./build --prefix=/usr make all doc -- "${_defines[@]/#/-D}"
}

package () {
  cd ledger/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
