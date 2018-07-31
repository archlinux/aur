# Maintainer: Bailey Kasin <bailey@gingertechnology.net>

pkgname=dtrace-utils
pkgver=1.0.2
pkgrel=1
pkgdesc="DTrace-utils contains the Userspace portion of the DTrace port to Linux"
arch=('x86_64')
url="https://github.com/oracle/dtrace-utils"
license=('UPL')
depends=(
        'elfutils'
        'zlib'
        'sudo'
        'git'
)
makedepends=(
	'glibc'
	'flex'
	'bison'
	'libelf'
	'kernel-uek-devel'
	'dtrace-utils-devel'
)
source=(
	'https://github.com/oracle/dtrace-utils/archive/1.0.2.tar.gz'
	'third_arg.patch'
)
md5sums=(
	'c344a52504d1124b2e2188dda344b43e'
	'48b69bae8daf29415f45c3a22c3f4d7f'
)

prepare() {
	cd $pkgname-$pkgver
	patch -p0 < "${srcdir}/third_arg.patch"
}

build() {
	unset CFLAGS

	cd "$srcdir/$pkgname-$pkgver"
	mkdir ../linux
	cp -r /usr/src/kernels/4.14.35-1818.0.9.el7uek.x86_64/include/uapi/linux/dtrace ../linux/
        make HDRPREFIX="$srcdir/"
}

package() {
        cd "$srcdir/$pkgname-$pkgver"

        sudo make install
}
