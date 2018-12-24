# Maintainer: Bailey Kasin <bailey@gingertechnology.net>

pkgname=dtrace-utils
pkgver=1.1.1
pkgrel=4
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
	'libdtrace-ctf'
)
source=(
	'https://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackageSource/dtrace-utils-1.1.1-1.el7.src.rpm'
	'third_arg.patch'
	'sysmacros.patch'
)
md5sums=(
	'f8ad5199cf7e311eac044a1e52c9a431'
	'48b69bae8daf29415f45c3a22c3f4d7f'
	'5fbb6aaae1b2b2fd4f63282ff9304dcd'
)

prepare() {
	cd "$srcdir"
	tar xvf dtrace-utils-1.1.1.tar.bz2

	cd "$srcdir/$pkgname-$pkgver"
	patch -p0 < "${srcdir}/third_arg.patch"
	patch -p0 < "${srcdir}/sysmacros.patch"
}

build() {
	unset CFLAGS

	cd "$srcdir/$pkgname-$pkgver"
	mkdir ../linux
	cp -r /usr/src/kernels/4.14.35-1844.0.7.el7uek.x86_64/include/uapi/linux/dtrace ../linux/
        make HDRPREFIX="$srcdir/"
}

package() {
        cd "$srcdir/$pkgname-$pkgver"

        make DESTDIR="$pkgdir/" install
}
