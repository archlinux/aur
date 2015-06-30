# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=rssh
pkgver=2.3.4
pkgrel=5
pkgdesc='Restricted secure shell allowing only scp, sftp, cvs, rsync or rdist'
url='http://www.pizzashack.org/rssh/'
license=('custom:rssh')
arch=('i686' 'x86_64' 'armv6h')
backup=('etc/rssh.conf')
depends=('openssh')
validpgpkeys=('3A6FE9A6B62D6B47DC496B6D7637654281CFE75D')
source=("http://downloads.sourceforge.net/sourceforge/rssh/rssh-${pkgver}.tar.gz"{,.sig}
	'0001-fail-logging.patch'
	'0002-info-to-debug.patch'
	'0003-man-page-spelling.patch'
	'0004-mkchroot.patch'
	'0005-mkchroot-arch.patch'
	'0006-mkchroot-symlink.patch'
	'0007-destdir.patch'
	'0008-rsync-protocol.patch')
sha256sums=('f30c6a760918a0ed39cf9e49a49a76cb309d7ef1c25a66e77a41e2b1d0b40cd9'
            'SKIP'
            'd30f2f4fdb1b57f94773f5b0968a4da3356b14a040efe69ec1e976c615035c65'
            '86f6ecf34f62415b0d6204d4cbebc47322dc2ec71732d06aa27758e35d688fcd'
            '455b3bbccddf1493999d00c2cd46e62930ef4fd8211e0b7d3a89d8010d6a5431'
            'f7fd8723d2aa94e64e037c13c2f263a52104af680ab52bfcaea73dfa836457c2'
            'ac8894c4087a063ae8267d2fdfcde69c2fe6b67a8ff5917e4518b8f73f08ba3f'
            'bce98728cb9b55c92182d4901c5f9adf49376a07c5603514b0004e3d1c85e9c7'
            '7fa03644f81dc37d77cc7e2cad994f17f91b2b8a49b1a74e41030a4ac764385e'
            '0c772afe9088eeded129ead86775ef18e58c318bbc58fc3e2585e7ff09cc5e91')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# from debian package (2.3.3-4)
	# http://ftp.de.debian.org/debian/pool/main/r/rssh/rssh_2.3.3-4.debian.tar.gz

	patch -Np1 < ${srcdir}/0001-fail-logging.patch
	patch -Np1 < ${srcdir}/0002-info-to-debug.patch
	patch -Np1 < ${srcdir}/0003-man-page-spelling.patch
	patch -Np1 < ${srcdir}/0004-mkchroot.patch

	patch -Np1 < ${srcdir}/0005-mkchroot-arch.patch
	patch -Np1 < ${srcdir}/0006-mkchroot-symlink.patch

	patch -Np1 < ${srcdir}/0007-destdir.patch

	patch -Np1 < ${srcdir}/0008-rsync-protocol.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/rssh \
		--mandir=/usr/share/man \
		--sysconfdir=/etc \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	mv ${pkgdir}/etc/rssh.conf.default ${pkgdir}/etc/rssh.conf

	install -D -m0644 LICENSE "${pkgdir}"/usr/share/licenses/rssh/LICENSE

	install -D -m0755 mkchroot.sh "${pkgdir}"/usr/bin/mkchroot
}

