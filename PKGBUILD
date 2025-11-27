# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

_pkgname=pwsafe
pkgname=passwordsafe
pkgver=1.23.0
pkgrel=1
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="https://pwsafe.org/"
license=('Artistic-2.0')
depends=('wxwidgets-gtk3' 'yubikey-personalization' 'xerces-c' 'qrencode' 'file')
makedepends=('zip' 'libxt' 'cmake')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'pwsafe' 'pwsafe-gui')
source=(passwordsafe-$pkgver.tar.gz::https://github.com/pwsafe/pwsafe/archive/$pkgver.tar.gz
	passwordsafe-$pkgver.tar.gz.sig::https://github.com/pwsafe/pwsafe/releases/download/$pkgver/$pkgver.tar.gz.sig)
# Rony Shapiro (PasswordSafe signing key) <ronys@pwsafe.org>
# https://keyserver.ubuntu.com/pks/lookup?search=0xB131423D7F2F1BB9&fingerprint=on&op=index
validpgpkeys=('C8876BE69A8EC6414C8C8729B131423D7F2F1BB9')
sha1sums=('fbef705250df9d89aa4648116d7469f38e46adfe'
          'SKIP')

prepare() {
	cd $_pkgname-$pkgver
	# prevent harmless messages about =3 overrides
	sed -i '/_FORTIFY_SOURCE=2/d' ./CMakeModules/harden/harden-gcc.cmake
}

build() {
	cd $_pkgname-$pkgver
	mkdir -p build
	cd build

	cmake .. -DNO_GTEST=ON \
		 -DCMAKE_INSTALL_PREFIX=/usr \
		 -DCMAKE_BUILD_TYPE=None

	make
}

package() {
	cd $_pkgname-$pkgver
	cd build

	DESTDIR="$pkgdir" make install
}
