# Maintainer:
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_pkgname=qlog
pkgname="$_pkgname-git"
pkgver=r1197.08f9652
pkgrel=1
pkgdesc="Amateur radio logbook software"
arch=("x86_64" "i686")
url="https://github.com/foldynl/QLog"
license=('GPL')
depends=(
  'qt5-base'
  'qt5-charts'
  'qt5-webengine'
  'qtkeychain-qt5'
  'qt5-serialport'
  'hamlib'
)
makedepends=(
  'git'
  'qt5-tools'
)
optdepends=(
  'org.freedesktop.secrets: keyring/password support'
)

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "$_pkgname"::"git+$url"

  # submodule
  "flags"::"git+https://github.com/foldynl/QLog-Flags"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # prepare submodules
  cd "$srcdir/$_pkgname"
  _submodules=(
    'res/flags'
  )
  for submodule in ${_submodules[@]} ; do
    mkdir -p "$submodule"
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done
}

build() {
  cd "$srcdir/$_pkgname"
  qmake PREFIX="$pkgdir/usr" QLog.pro
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install
}
