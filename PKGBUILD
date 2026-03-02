# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=spandsp
pkgname=${_pkgname}-git
pkgver=3.0.0.r563.g7977601
pkgrel=1
pkgdesc="A DSP library for telephony (FreeSWITCH version)"
arch=('x86_64')
depends=('libtiff')
provides=('spandsp')
conflicts=('spandsp')
url="https://github.com/freeswitch/spandsp"
license=('LGPL' 'GPL')
source=("git+https://github.com/freeswitch/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.g%s" "$(awk '/^Version:/ { print $2 }' spandsp.spec)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  sed -i "s|libdir='\${exec_prefix}/lib/x86_64-linux-gnu'|libdir='\${exec_prefix}/lib'|g" configure.ac
  sed -i "s|libdir='\${exec_prefix}/lib64'|libdir='\${exec_prefix}/lib'|g" configure.ac

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --disable-static
  make -C src
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" -C src install
  make DESTDIR="$pkgdir" install-pkgconfigDATA
}
