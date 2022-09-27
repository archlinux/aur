# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jesse Spangenberger <azulephoenix@gmail.com>

set -u
pkgname=notepadqq
pkgname+='-git'
pkgver=2.0.0.beta.r12.gd8000f25
pkgrel=1
pkgdesc='Notepad++-like text editor for Linux'
arch=('x86_64')
arch+=('i686')
#url='http://notepadqq.altervista.org/wp/'
url='https://notepadqq.com/'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-svg' 'qt5-webkit')
depends+=('desktop-file-utils')
depends[1]='qt5-svg>=5.6'
depends+=('qt5-webengine>=5.6' 'uchardet')
makedepends=('git' 'qt5-tools')
makedepends+=('qt5-websockets' 'qt5-tools>=5.6')
optdepends=('mathjax2: Math rendering')
options=('!emptydirs')
options+=('!strip')
provides=("notepadqq=${pkgver%%.r*}")
conflicts=('notepadqq') # 'notepadqq-bin' 'notepadqq-common' 'notepadqq-src'
#install="${pkgname#-git}.install"
_srcdir="${pkgname%-git}"
source=(
  'git+https://github.com/notepadqq/notepadqq.git'
  'git+https://github.com/notepadqq/CodeMirror.git'
)
md5sums=('SKIP'
         'SKIP')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  set -o pipefail
  if ! git describe --long | sed -e 's/^v//' -e 's/[^-]*-g/r&/' -e 's/-/./g'; then
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"

  git config submodule.src/editor/libs/codemirror.url "$srcdir/CodeMirror"
  git submodule update --init
  #git submodule update
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  qmake-qt5 PREFIX=/usr LRELEASE=/usr/bin/lrelease notepadqq.pro
  nice make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make -j1 INSTALL_ROOT="$pkgdir" install
  set +u
}
set +u
