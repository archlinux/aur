# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=pam_csync
pkgver=0.42.0
pkgrel=3
pkgdesc="PAM modules that synchronizes home directories upon logins using libcsync"
arch=("i686" "x86_64")
license=('GPL2')
url="http://www.csync.org"
depends=('ocsync' 'iniparser')
makedepends=('cmake')
backup=(etc/security/pam_csync.conf)
source=(http://www.csync.org/files/$pkgname-$pkgver.tar.gz
        pam-csync-0.42.0-ocsync.patch)

prepare() {
	cd "$srcdir"/$pkgname-$pkgver
	patch -p0 -i "$srcdir"/pam-csync-0.42.0-ocsync.patch
	sed 's|2\.2|2.4|' -i src/CMakeLists.txt
}

build() {
	cd "$srcdir"
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPAM_MODULE_INSTALL_DIR=/usr/lib/security \
	      "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
}

sha256sums=('bba01854ee5929ecc90428275a50f804d361e92f2805f1d2eff7d3f2bca48802'
            'b0d8e7f02d41355e5a238a07f3a1c408e429be1769337e4b30388e020f0fbe11')
