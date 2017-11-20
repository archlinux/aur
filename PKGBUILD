# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=mono-addins
pkgver=1.3
pkgrel=1
pkgdesc="A generic framework for creating extensible applications and for creating libraries which extend those applications"
arch=('x86_64')
url="http://www.mono-project.com/Mono.Addins"
license=('custom:MIT')
depends=('gtk-sharp-2' 'mono')
makedepends=('pkgconfig' git)
_commit=92e17db491a2b0c27ceff5fdf156f5b5d9073c68  # pull/78/head~2
source=("git+https://github.com/mono/mono-addins#commit=$_commit")
md5sums=('SKIP')

prepare() {
  cd $pkgname
  git tag -f 92e17db491a2b0c27ceff5fdf156f5b5d9073c68 mono-addins-1.3.7
pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^mono-addins-//;s/-/+/g'
}

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd ${srcdir}/${pkgname}-$pkgname
  ./autogen.sh
  ./configure --prefix=/usr --enable-gui
  make
} 

package() {
  cd ${srcdir}/${pkgname}-$pkgname
  make GACUTIL="/usr/bin/gacutil -root ${pkgdir}/usr/lib"  DESTDIR=${pkgdir} install

  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
