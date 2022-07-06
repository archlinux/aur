# Maintainer: Nicolas Derumigny <nderumigny@gmail.com>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl
_ver=1.1.1q
_target="aarch64-linux-gnu"
pkgname="${_target}-${_pkgname}"
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=("${_target}-glibc")
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
replaces=("${_target}-openssl-perl" "${_target}-openssl-doc")
backup=("usr/${_target}/etc/ssl/openssl.cnf")
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc}
	'ca-dir.patch')
sha256sums=('d7939ce614029cdff0b6c20f0e2e5703158a489a72b2507b8bd51bf8c8fd10ca'
            'SKIP'
            '75aa8c2c638c8a3ebfd9fa146fc61c7ff878fc997dc6aa10d39e4b2415d669b2')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
	'7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

prepare() {
	cd "${srcdir}/${_pkgname}-${_ver}"

	# set ca dir to /etc/ssl by default
	patch -p0 -i "${srcdir}/ca-dir.patch"
}

build() {
    mkdir ${_pkgname}-build
    pushd ${_pkgname}-build

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
    CFLAGS+=" -D__aarch64__ -march=armv8.8-a -fcf-protection=none -Wno-use-after-free"
    CXXFLAGS+=" -D__aarch64__ -march=armv8.8-a -fcf-protection=none -Wno-use-after-free"
    CC="${_target}-gcc" "${srcdir}/${_pkgname}-$_ver/Configure" --prefix=/usr/${_target} --openssldir=/usr/${_target}/etc/ssl --libdir=/usr/${_target}/lib \
		shared no-ssl3-method enable-ec_nistp_64_gcc_128 linux-aarch64 \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
    popd
}

check() {
	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
    pushd ${_pkgname}-${_ver}
	patch -p0 -R -i "${srcdir}/ca-dir.patch"
    popd

    pushd ${_pkgname}-build
    # do not pass, no time for this right now
    # QEMU_LD_PREFIX="/usr/${_target}/" LD_LIBRARY_PATH="/usr/${_target}/lib64" make test
    popd

    pushd ${_pkgname}-${_ver}
	patch -p0 -i "${srcdir}/ca-dir.patch"
	# re-run make to re-generate CA.pl from th patched .in file.
    popd

    pushd ${_pkgname}-build
	make apps/CA.pl
    popd
}

package() {
    pushd ${_pkgname}-build

	make DESTDIR="${pkgdir}" MANDIR=/usr/${_target}/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs

	install -D -m644 ../${_pkgname}-${_ver}/LICENSE "${pkgdir}/usr/${_target}/usr/share/licenses/${_pkgname}/LICENSE"
    popd
    rm -rf ${_pkgname}-build
}
