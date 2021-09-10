# Maintainer: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Robson Peixoto

pkgname=unzip-fs60433-patch
_pkgname=unzip
pkgver=6.0
_pkgver=${pkgver/./}
pkgrel=2
pkgdesc='Temporary patched package until FS#60433(https://bugs.archlinux.org/task/60433) is fixed.'
url='https://www.info-zip.org/UnZip.html'
arch=('x86_64')
license=('custom')
depends=('bzip2' 'bash')
makedepends=('make' 'gcc')
provides=('unzip')
conflicts=('unzip')
source=("https://downloads.sourceforge.net/infozip/${_pkgname}${_pkgver}.tar.gz"
        'overflow-fsize.patch'
        'cve20149636.patch'
        'test_compr_eb.patch'
        'getZip64Data.patch'
        'crc32.patch'
        'empty-input.patch'
        'csiz-underflow.patch'
        'nextbyte-overflow.patch'
        'unzip-initialize-the-symlink-flag.patch')
sha1sums=('abf7de8a4018a983590ed6f5cbd990d4740f8a22'
          '2852ce1a9db8d646516f8828436a44d34785a0b3'
          'e8c0bc17c63eeed97ad62b86845d75c849bcf4f8'
          '614c3e7fa7d6da7c60ea2aa79e36f4cbd17c3824'
          '691d0751bf0bc98cf9f9889dee39baccabefdc4d'
          '82c9fe9172779a0ee92a187d544e74e8f512b013'
          '4f77b01454fd2ffa69bfad985bfbdc579ee26010'
          'dccc6d6a5aed0098031bbd7cc4275ab9b10a2177'
          'b325fac556abf169264ed5ae364b9136016e43f3'
          '294ddb76704616342e3344f85f84174756d7bd58')

prepare() {
	cd "${srcdir}/${_pkgname}${_pkgver}"
	sed -i "/MANDIR =/s#)/#)/share/#" unix/Makefile
	patch -p1 -i ../overflow-fsize.patch #FS#44171
	patch -p1 -i ../cve20149636.patch #FS#44171
	patch -i ../test_compr_eb.patch # FS#43391
	patch -i ../getZip64Data.patch # FS#43300
	patch -i ../crc32.patch # FS#43300
	patch -p1 -i ../empty-input.patch # FS#46955
	patch -p1 -i ../csiz-underflow.patch # FS#46955
	patch -p1 -i ../nextbyte-overflow.patch # FS#46955
	patch -p1 -i ../unzip-initialize-the-symlink-flag.patch # FS#60433
}

build() {
	cd "${srcdir}/${_pkgname}${_pkgver}"

	# DEFINES, make, and install args from Debian
	DEFINES='-DACORN_FTYPE_NFS -DWILD_STOP_AT_DIR -DLARGE_FILE_SUPPORT \
		-DUNICODE_SUPPORT -DUNICODE_WCHAR -DUTF8_MAYBE_NATIVE -DNO_LCHMOD \
		-DDATE_FORMAT=DF_YMD -DUSE_BZIP2 -DNOMEMCPY -DNO_WORKING_ISPRINT'
    CFLAGS=$(echo $CFLAGS | sed -e "s/-Werror=format-security//g") # `-Werror=format-security` causes compilation errors, not interested in fixing the security issues.
	make -f unix/Makefile prefix=/usr \
		D_USE_BZ2=-DUSE_BZIP2 L_BZ2=-lbz2 \
		LF2="$LDFLAGS" CF="$CFLAGS $CPPFLAGS -I. $DEFINES" \
		unzips
}

package() {
	cd "${srcdir}/${_pkgname}${_pkgver}"
	make -f unix/Makefile prefix="${pkgdir}"/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
