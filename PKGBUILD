# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Alad Wenter <alad@linuxbbq.org>
pkgname=cowdancer
pkgver=0.89
pkgrel=1
pkgdesc="Copy-on-write wrapper for pbuilder"
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/cowdancer"
license=('GPL')
depends=('pbuilder'
         'ncurses'
	 'ncurses5-compat-libs')
makedepends=('quilt')
optdepends=('qemu: if you want to use qemubuilder'
            'bash-completion: bash autocomplete support')

source=(http://httpredir.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.tar.xz
        series
	makedev_glibc_fix.patch)
sha256sums=('9c55432561b67e493bd48eba131ed871cd6c30e64537496af48cc2ae47bd5be3'
            'c7345323ff3cf9f3e7f7339319f06b14a001dd75fc7720ad4e58ae99db2a62ea'
            'ef983677d8218b3301f194129d9b97f39abf9a4463aa5b6da7b4c376b5b20ed1')

prepare() {
  mkdir ${pkgname}-${pkgver}/patches
  cp series ${pkgname}-${pkgver}/patches/
  cp makedev_glibc_fix.patch ${pkgname}-${pkgver}/patches/
  cd ${pkgname}-${pkgver}
  quilt push -a
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# cow-shell fails to compile if linker is called with '--as-needed'
	# therefore we strip that flag from LDFLAGS from makepkg.conf
	export LDFLAGS=$(echo $LDFLAGS | sed 's/,--as-needed//g')
	autoreconf --install
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	
}
