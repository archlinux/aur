# Maintainer: Xiang Gao <qasdfgtyuiop(at)gmail(dot)com>

_pkgbase=jool
pkgname=${_pkgbase}-dkms-git
pkgver=4.0.6.r1.g90033801
pkgrel=1
pkgdesc="Open Source SIIT and NAT64 for Linux."
arch=('i686' 'x86_64')
url="https://www.jool.mx"
license=('GPL2')
depends=('dkms' 'libnl')

source=("git+https://github.com/NICMx/Jool.git")
md5sums=(SKIP)

pkgver() {
  cd Jool
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | grep -o '[0-9].*'
}

build() {
  cp -r Jool Jool-clean
  cd Jool
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  # Install
  cd Jool
  make DESTDIR="${pkgdir}" install
  make clean

  # Copy sources (including Makefile)
  ver=$(echo ${pkgver}| grep -o '[0-9]*\.[0-9*]\.[0-9]*')
  cd ..
  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${ver}/
  cp -r Jool-clean/* "${pkgdir}"/usr/src/${_pkgbase}-${ver}/
}
