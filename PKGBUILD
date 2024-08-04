# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=cups-local
pkgname=$_pkgname-git
pkgver=r51.90c8047
pkgrel=1
pkgdesc="CUPS Local Services"
arch=('x86_64')
url="https://github.com/OpenPrinting/$_pkgname"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libcups-git' 'pappl-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'cups' 'cups-git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export LDFLAGS="$LDFLAGS -Wl,--copy-dt-needed-entries"
  cd $_pkgname
  ./configure --prefix=/usr --sbindir=/usr/bin
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname
  make test
}

package() {
  cd $_pkgname
  make BUILDROOT="${pkgdir}" install
  install -Dm644 "${srcdir}"/$_pkgname/NOTICE "${pkgdir}"/usr/share/licenses/$pkgname/LLVM-exception
}
