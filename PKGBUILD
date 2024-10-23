# This fork of cryptsetup made by Kriswebdev
# Archlinux package contributor is Dimadenisjuk <dimadenisjuk@yandex.ru>
pkgname=('cryptsetup-deluks')
pkgver=0.2BETA
pkgrel=4
epoch=
pkgdesc="Cryptsetup version with 'Deniable encryption' support"
arch=('any')
license=('GPL')
groups=()
depends=('device-mapper' 'libdevmapper.so' 'openssl' 'popt' 'libutil-linux'
	'libuuid.so' 'json-c' 'libjson-c.so' 'argon2' 'libargon2.so')
makedepends=('util-linux' 'git')
checkdepends=()
optdepends=()
provides=('cryptsetup-deluks')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/dimadenisjuk/cryptsetup-deluks")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	bash ./autogen.sh
  	sed -i 's/$PATH:\/sbin/$PATH:\/bin/g' configure
  	sed -i 's/$PATH:\/sbin/$PATH:\/bin/g' libtool
	sed -i 's/${exec_prefix}\/sbin/${exec_prefix}\/bin/g' configure
  	sed -i 's/\/sbin\//\/bin\//g' configure
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	# needs to change binary directory from /usr/sbin to /usr/bin
	make DESTDIR="$pkgdir/opt/cryptsetup-deluks/" install
	mv "$pkgdir/opt/cryptsetup-deluks/usr/"* "$pkgdir/opt/cryptsetup-deluks/"
	echo "see https://github.com/kriswebdev/cryptsetup-deluks/wiki/System-encryption for more information."
	mkdir -p "$pkgdir/usr/bin/"
	echo '#!/bin/bash' > "$pkgdir/usr/bin/cryptsetup-deluks"
	echo 'LD_LIBRARY_PATH=/opt/cryptsetup-deluks/lib/:$LD_LIBRARY_PATH /opt/cryptsetup-deluks/bin/cryptsetup' >> "$pkgdir/usr/bin/cryptsetup-deluks"
	chmod 755 "$pkgdir/usr/bin/cryptsetup-deluks"
}
