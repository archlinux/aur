# Contributor/Maintainer: ilikenwf/Matt Parnell <parwok@gmail.com>
# Contributor: liliff/Musee U <icelandisbeingcolouredbywrens@gmail.com>
# Contributor: tomoaki/Tomoaki Hashizaki <thashisaki@yahoo.com>
pkgname=lkeyholetv
pkgver=2.3
pkgrel=4
pkgdesc="A client for KeyHoleTV, an online television portal that links to Japanese television channels, radio stations, and user-made channels."
arch=('i686' 'x86_64')
url="http://www.oiseyer.com/index-e.html"
license=('custom')
depends=('alsa-lib' 'gtk2' 'cairo' 'pango' 'libx11' 'libpng')
optdepends=('sdl: SDL video support')
provides=('lkeyholetv')
install=lkeyholetv.install
source_i686=("http://www.oiseyer.com/Download/Ubuntu/LKeyHoleTV-32bits-Ubuntu.zip"
	'lkeyholetv.desktop'
	'lkeyholetv')
md5sums_i686=('d0ac2fa20a6c7c46ddfc2d95dfcf2a79'
					'7a6d0d5ca7092918919431796787e574'
					'ae00db79eb19f3f1515f873852c903d2')
source_x86_64=("http://www.oiseyer.com/Download/Linux64/LKeyHoleTV-64bits.zip"
	'lkeyholetv.desktop'
	'lkeyholetv')
md5sums_x86_64=('bf5b14afa33d24ed9a002fe86c109c1e'
         '7a6d0d5ca7092918919431796787e574'
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
	#rm -v ${srcdir}/KeyHoleTV/.KeyHoleTV/KeyHoleTVAddr.dat~ || return 1 #backup file in the 64bit tarball
	#rm -v ${srcdir}/KeyHoleTV/.KeyHoleTV/ESDObj.so || #esound unsupported/is in AUR

	# Time to install the program itself

	install -d ${srcdir}/KeyHoleTV/.KeyHoleTV ${pkgdir}/opt/LKeyHoleTV/
	install ${srcdir}/KeyHoleTV/lkeyholetv ${pkgdir}/opt/LKeyHoleTV/
	cp -r ${srcdir}/KeyHoleTV/.KeyHoleTV ${pkgdir}/opt/LKeyHoleTV/
	install ${srcdir}/lkeyholetv ${pkgdir}/usr/bin/

	install -m644 ${srcdir}/lkeyholetv.desktop ${pkgdir}/usr/share/applications/ || return 1
	install -m644 ${srcdir}/KeyHoleTV/Lkeyholetv.png ${pkgdir}/usr/share/pixmaps/Lkeyholetv.png || return 1
	install -m644 ${srcdir}/KeyHoleTV/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
