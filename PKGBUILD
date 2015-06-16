# Contributor/Maintainer: ilikenwf/Matt Parnell <parwok@gmail.com>
# Contributor: liliff/Musee U <icelandisbeingcolouredbywrens@gmail.com>

pkgname=lkeyholetv
pkgver=2.1
pkgrel=8
pkgdesc="A client for KeyHoleTV, an online television portal that links to Japanese television channels, radio stations, and user-made channels."
arch=('i686' 'x86_64')
url="http://www.v2p.jp/video/english/"
license=('custom')
depends=('alsa-lib' 'gtk2' 'cairo' 'pango' 'libx11' 'libpng')
optdepends=('sdl: SDL video support')
provides=('lkeyholetv')
install=lkeyholetv.install
source=("http://www.oiseyer.com/Download/Ubuntu/LinuxKeyHoleTV${pkgver}-Ubuntu.tar.gz"
	'lkeyholetv.desktop'
	'lkeyholetv')
md5sums=('d60b1fc652605cebc4a5fe478e3ab32b'
         '59fdf1ff19320034a3797d823211e535'
         'ae00db79eb19f3f1515f873852c903d2')

[ "$CARCH" = "x86_64" ] && source=("http://www.oiseyer.com/Download/Linux64/LinuxKeyHoleTV${pkgver}-64.bit.tar.gz"
				   'lkeyholetv.desktop'
				   'lkeyholetv') \
			&& md5sums=('56a221e76dbcdcdf7b98d304a48cfb65'
						'59fdf1ff19320034a3797d823211e535'
						'ae00db79eb19f3f1515f873852c903d2')

_lang='en_US'
[ "`echo $LANG | cut -d. -f1`" = "ja_JP" ] && _lang='ja_JP'

build()
{
	cd ${srcdir}/KeyHoleTV
}

package()
{
	mkdir -p ${pkgdir}/{usr/{bin,share/{applications,pixmaps,licenses/${pkgname}}},opt/LKeyHoleTV} || return 1

	# Audio Interface: ALSA should work
	cd ${srcdir}/KeyHoleTV/ALSA
	make || return 1
	make install || return 1  # The install here copies a .so to .KeyHoleTV.

	# Adding in DSP since it's native
        cd ${srcdir}/KeyHoleTV/DSP
        make || return 1
        make install || return 1  # Similar to the last install

	# Language: en_US by default, ja_JP if locale is ja_JP.*
	cd ${srcdir}/KeyHoleTV/${_lang}
	make || return 1
	make install || return 1 # Similar to the last install.

	# Some cleanup
	rm -v ${srcdir}/KeyHoleTV/.KeyHoleTV/KeyHoleTVAddr.dat~ || return 1 #backup file in the 64bit tarball
	rm -v ${srcdir}/KeyHoleTV/.KeyHoleTV/ESDObj.so || #esound unsupported/is in AUR

	# Time to install the program itself

	install -c ${srcdir}/KeyHoleTV/.KeyHoleTV ${pkgdir}/opt/LKeyHoleTV/
	install -c ${srcdir}/KeyHoleTV/lkeyholetv ${pkgdir}/opt/LKeyHoleTV/
	cp -r ${srcdir}/KeyHoleTV/.KeyHoleTV ${pkgdir}/opt/LKeyHoleTV/
	install -c ${srcdir}/lkeyholetv ${pkgdir}/usr/bin/

	install -m644 ${srcdir}/lkeyholetv.desktop ${pkgdir}/usr/share/applications/ || return 1
	install -m644 ${srcdir}/KeyHoleTV/keyholetv.xpm ${pkgdir}/usr/share/pixmaps/keyholetv.xpm || return 1
	install -m644 ${srcdir}/KeyHoleTV/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
