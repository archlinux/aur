# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbasename=openssl
pkgname=lib32-openssl098
_ver=0.9.8zh
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]*/.${_ver//[0-9.]/}}
pkgrel=2
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (32-bit, 0.9.8 branch)'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('lib32-zlib' $_pkgbasename)
makedepends=('perl' 'gcc-multilib')
optdepends=('ca-certificates')
provides=('lib32-openssl-compatibility')
conflicts=('lib32-openssl-compatibility')
options=(!makeflags)
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'  # Matt Caswell <matt@openssl.org>
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C') # Richard Levitte <richard@levitte.org>
source=("https://www.openssl.org/source/old/0.9.x/${_pkgbasename}-${_ver}.tar.gz"{,.asc}
        'no-rpath.patch'
        'ca-dir.patch')
sha256sums=('f1d9f3ed1b85a82ecf80d0e2d389e1fda3fca9a4dba0bf07adbf231e1a5e2fd6'
            'SKIP'
            '754d6107a306311e15a1db6a1cc031b81691c8b9865e8809ac60ca6f184c957c'
            '9e8126f3a748f4c1d6fe34d4436de72b16a40e97a6d18234d2e88caa179d50c4')

prepare() {
	cd "${srcdir}/${_pkgbasename}-${_ver}"

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i "${srcdir}/no-rpath.patch"
	# set ca dir to /etc/ssl by default
	patch -p0 -i "${srcdir}/ca-dir.patch"

	sed -i '/^push(@INC/s|)|,".")|' crypto/des/asm/des-586.pl
}

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "${srcdir}/${_pkgbasename}-${_ver}"

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure linux-elf --prefix=/usr --openssldir=/etc/ssl --libdir=lib32 \
		shared zlib enable-md2 -Wa,--noexecstack

	make
}

package() {
	cd "${srcdir}/${_pkgbasename}-${_ver}"

	install -D -m0755 libssl.so.0.9.8 "${pkgdir}/usr/lib32/libssl.so.0.9.8"
	install -D -m0755 libcrypto.so.0.9.8 "${pkgdir}/usr/lib32/libcrypto.so.0.9.8"

	mkdir -p "${pkgdir}/usr/share/licenses"
	ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}

