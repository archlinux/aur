# Maintainer: Dmitriy Fomichev <xomachiner@gmail.com>

pkgname=('steamforwarder-git')
_pkgname=SteamForwarder
pkgdesc="Tool that allows interaction between windows games under wine and the linux steam. (Cutting edge experimental features)"
pkgver=r195.73b671f
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/xomachine/SteamForwarder"
license=('MIT')
depends=('python' 'steam' 'nim>=0.18.0' 'binutils' 'wine')
optdepends=('steamcmd')
makedepends=()
provides=('steamforwarder')
source=("git+https://github.com/xomachine/SteamForwarder.git#branch=devel")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${_pkgname}"
  make tools
  # Touch required to avoid signatures.txt rebuilding when make install
  touch signatures.txt
  make precompile
}

package() {
  cd "$srcdir/${_pkgname}"
  make install PREFIX="/usr" DESTDIR="${pkgdir}"
}
