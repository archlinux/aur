# Maintainer: Your Name <youremail@domain.com>
pkgname=env-modules
pkgver=3.2.10
pkgrel=4
epoch=
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/modules/"
license=('GPLv2')
groups=()
depends=('tcl>=7.4' 'procps-ng')
makedepends=()
checkdepends=('dejagnu')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("usr/Modules/init/.modulespath")
options=()
install=
changelog=
source=("https://sourceforge.net/projects/modules/files/Modules/modules-$pkgver/modules-$pkgver.tar.gz" env-modules.sh zshcomp.patch)
noextract=()
validpgpkeys=()
md5sums=('8b097fdcb90c514d7540bb55a3cb90fb'
         '04115aa1410483724a8d11ebac8598b1'
         '38eb89089803a0464a6e9e23ff23a2f2')

build() {
	cd "modules-$pkgver"
    patch -p1 < ../zshcomp.patch
	CPPFLAGS="-DUSE_INTERP_ERRORLINE" ./configure --prefix=/usr --disable-versioning
	make
}

check() {
	cd "modules-$pkgver"
#	make -k check
}

package() {
  cd "modules-$pkgver"
  make DESTDIR="$pkgdir/" install

  _profiled="$pkgdir/etc/profile.d/"
  mkdir -p "$_profiled"
  ln -sf /usr/Modules/default/init/csh $_profiled/env-modules.csh
  cp $srcdir/env-modules.sh $_profiled/env-modules.sh
}
