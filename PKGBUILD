# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=q2pro
pkgver=r1504
pkgrel=1
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
source=("https://github.com/AndreyNazarov/q2pro/archive/${pkgver}.tar.gz"
	"buildconfig.arch"
        "${pkgver}.tar.gz.sig"
	"buildconfig.arch.sig")
sha512sums=('a2b7e945dcc36cf2521546ccd97add1d565aa0a0acb8d3238e543d4713af0be95626929a62585ab48d1f50b1743ecd97d6e0cb3c1efda36048b822a2b2631e33'
	    '7cc08a87b07d704b926d703638f6ff045ab9a86e7a9a1d8b0d384037ceafa07b84ec9faa35881737ecb2e5735436e4fe44c836f575f01f3c301fb741b4024134'
            'SKIP'
	    'SKIP')

prepare() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
	cp "${srcdir}/buildconfig.arch" ./.config
}

build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
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
	# NO LONGER USES A ./CONFIGURE SCRIPT
#	./configure --prefix=/usr \
#	--enable-baseq2 \
#	--enable-server \
#	--enable-curl \
#	--enable-jpg \
#	--enable-dinput \
#	--enable-openal \
#	--enable-dsound \
#	--enable-anticheat \
#	--enable-fps \
#	--bindir=/bin \
#	--libdir=/lib \
#	--mandir=/share/man/man6
	#--enable-png \  # broken in 1093
	#--datadir=/usr/share/games/q2pro \

	# TODO: see "Mouse input on Linux" in INSTALL.

	make

}
package() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
	install -d -m 0755 ${pkgdir}/usr/{bin,share/{doc,games}/${_pkgname}}
	install -d -m 0755 ${pkgdir}/usr/share/games/${_pkgname}/baseq2
	install -D -m 0644 ${srcdir}/${_pkgname}-${pkgver}/src/client/ui/q2pro.menu ${pkgdir}/usr/share/games/${_pkgname}/baseq2/q2pro.menu
	install -D -m 0644 ${srcdir}/${_pkgname}-${pkgver}/README ${pkgdir}/usr/share/doc/${_pkgname}/README
	install -D -m 0644 ${srcdir}/${_pkgname}-${pkgver}/INSTALL ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
	cp -a ${srcdir}/${_pkgname}-${pkgver}/doc/* ${pkgdir}/usr/share/doc/${_pkgname}/.
	cp -a ${srcdir}/${_pkgname}-${pkgver}/game*.so ${pkgdir}/usr/share/games/${_pkgname}/baseq2/.
	# r1093 doesn't seem to honor manpage installation
	install -d -m 0755 ${pkgdir}/usr/share/man/man6
	gzip -c ${srcdir}/${_pkgname}-${pkgver}/man/q2pro.6.txt > ${pkgdir}/usr/share/man/man6/q2pro.6.gz
	gzip -c ${srcdir}/${_pkgname}-${pkgver}/man/q2proded.6.txt > ${pkgdir}/usr/share/man/man6/q2proded.6.gz
	install -D -m 0755 ${srcdir}/${_pkgname}-${pkgver}/q2pro ${pkgdir}/usr/bin/q2pro
	install -D -m 0755 ${srcdir}/${_pkgname}-${pkgver}/q2proded ${pkgdir}/usr/bin/q2proded

}
