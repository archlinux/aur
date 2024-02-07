# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=mmdebstrap
pkgver=1.3.8
pkgrel=2
epoch=
pkgdesc="create a Debian chroot"
arch=('any')
url="https://gitlab.mister-muffin.de/josch/mmdebstrap"
license=('MIT')
groups=()
depends=('apt' 'python' 'perl')
makedepends=()
checkdepends=()
optdepends=(
	'debian-archive-keyring: Debian PKI support'
	'ubuntu-keyring: Ubuntu PKI support'
	'qemu-user-static: foreign-architecture support'
	'qemu-user-static-binfmt: foreign-architecture support'
	'arch-test: foreign-architecture support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('2c0360ce97aa246cba9b96837ef0c7d974dfcc33eb725eee42a16ee11f0a2ba1')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	sed -i 's,/usr/libexec,/usr/lib,g' gpgvnoexpkeysig mmdebstrap
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"

	source <(perl -V:vendorarch)
	mkdir -p $pkgdir$vendorarch
	h2ph -d $pkgdir$vendorarch -a syscall.h sys/ioctl.h || true

	mkdir -p $pkgdir/usr/bin
	cp -a mmdebstrap $pkgdir/usr/bin/mmdebstrap
	cp -a tarfilter $pkgdir/usr/bin/mmtarfilter
	mkdir -p $pkgdir/usr/lib/apt/solvers
	cp -a proxysolver $pkgdir/usr/lib/apt/solvers/mmdebstrap-dump-solution
	mkdir -p $pkgdir/usr/share/mmdebstrap
	cp -a hooks $pkgdir/usr/share/mmdebstrap
	mkdir -p $pkgdir/usr/lib/mmdebstrap
	cp -a gpgvnoexpkeysig $pkgdir/usr/lib/mmdebstrap
	cp -a ldconfig.fakechroot $pkgdir/usr/lib/mmdebstrap

	mkdir -p $pkgdir/usr/share/man/man1
	pod2man mmdebstrap > $pkgdir/usr/share/man/man1/mmdebstrap.1
}
