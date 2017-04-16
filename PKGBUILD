# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=q2pro
pkgver=1093
pkgrel=2
pkgdesc="An enhanced Quake 2 client and server"
arch=( 'i686' 'x86_64' )
url="http://skuller.net/q2pro/"
license=( 'GPL2' )
_pkgname=q2pro
conflicts=('q2pro-git')
requires=('sdl' 'zlib')
optdepends=('quake2: additional mods (symlink to ~/.q2pro)')
makedepends=('libpng12' 'libjpeg6-turbo' 'curl' 'openal')
install=q2pro.install
changelog=
noextract=()
source=("https://github.com/AndreyNazarov/q2pro/archive/r1093.tar.gz"
        "r1093.tar.gz.sig")
sha512sums=('2cca3504681ff9a2cab6c1061245c660f1bfbfd1ec4acf91a798b697ed62b029d0cda969830d7ad282e5cbbd004b766285212e723340c5c98a31ddef0e034aa1'
            'SKIP')

build() {
        cd "${srcdir}/${_pkgname}-r${pkgver}"
	if [ ! -f VERSION ];
	then
		echo "${pkgver}" > VERSION
	fi
	# Extended configure options, useful if sdl isn't available etc.
	#./configure --prefix=/usr ...
	#--enable-baseq2
	#--disable-client
	#--enable-server
	#--enable-dinput
	#--enable-lirc
	#--disable-tga
	#--disable-md3
	#--disable-ui
	#--disable-mvd-server
	#--disable-mvd-client
	#--disable-icmp
	#--single-user
	./configure --prefix=/usr \
	--enable-baseq2 \
	--enable-server \
	--enable-curl \
	--enable-jpg \
	--enable-dinput \
	--enable-openal \
	--enable-dsound \
	--enable-anticheat \
	--enable-fps \
	--bindir=/bin \
	--libdir=/lib \
	--mandir=/share/man/man6
	#--enable-png \  # broken in 1093
	#--datadir=/usr/share/games/q2pro \

	# TODO: see "Mouse input on Linux" in INSTALL.

	make

}
package() {
        cd "${srcdir}/${_pkgname}-r${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -D -m 0644 ${srcdir}/${_pkgname}-r${pkgver}/README ${pkgdir}/usr/share/doc/${_pkgname}/README
	install -D -m 0644 ${srcdir}/${_pkgname}-r${pkgver}/INSTALL ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
	cp -a ${srcdir}/${_pkgname}-r${pkgver}/doc/* ${pkgdir}/usr/share/doc/${_pkgname}/.
	# r1093 doesn't seem to honor manpage installation
	install -d -m 0755 ${pkgdir}/usr/share/man/man6
	gzip -c ${srcdir}/${_pkgname}-r${pkgver}/man/q2pro.6.txt > ${pkgdir}/usr/share/man/man6/q2pro.6.gz
	gzip -c ${srcdir}/${_pkgname}-r${pkgver}/man/q2proded.6.txt > ${pkgdir}/usr/share/man/man6/q2proded.6.gz

}
