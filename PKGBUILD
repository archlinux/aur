# Maintainer: door4258@disroot.org  
pkgname=pkgit-git
pkgver=0.1.1.2.g5484ced  
pkgrel=1
pkgdesc="Universal system-agnostic package manager"
arch=('any')
url="https://git.symlinx.net/pkgit"
license=('GPLv2') 
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://git.symlinx.net/pkgit")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail; git describe --long --tags 2>/dev/null | sed 's/\([^-]*-\)$/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  # Nejdříve spustíme konfiguraci, jak je zvykem
  make defconfig
}

build() {
  cd "${srcdir}/${pkgname}"
  # Samotná kompilace
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  # Instalace do dočasného adresáře balíčku. 
  # Většina Makefile respektuje DESTDIR, případně upravujeme PREFIX.
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
