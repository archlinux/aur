# Maintainer: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
pkgname=gtk-gnutella-git
pkgver=1.2.3.r8.g0cbba2f8b
pkgrel=2
pkgdesc='Efficient Gnutella 2 client (latest git version)'
arch=('i686' 'x86_64')
url='http://gtk-gnutella.sourceforge.net/'
license=('GPL')
depends=('gtk2' 'desktop-file-utils')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('strip' '!buildflags')
install="${pkgname}.install"
_repo='https://github.com/gtk-gnutella/gtk-gnutella'
_branch='devel'
source=("${pkgname}.install" 'connections-hmk.patch' 'timeout-hmk.patch')
md5sums=('0b6211b511da48346cecdc1d2f963c76' '126734defaa7c5b77cf0baef19c47d2c' '6f0401e9241df4f28b3fbe1bde954651')

pkgver() {
  cd ${pkgbase} && git describe --long | sed -e 's/^v\(.*\)-\([0-9]\+\)-\(g.*\)/\1.r\2.\3/'
}

prepare() {
  git clone -b ${_branch} --recursive ${_repo} ${pkgbase}
  cd ${pkgbase}
#  patch -p1 < ../connections-hmk.patch
#  patch -p1 < ../timeout-hmk.patch
}

build() {
  cd ${pkgbase}
  ./build.sh --cc=gcc --prefix=/usr #--cflags="-Os" --enable-halloc
}

package() {
  cd ${pkgbase}
  make install INSTALL_PREFIX="${pkgdir}/"
  strip -s ${pkgdir}/usr/bin/gtk-gnutella
}
