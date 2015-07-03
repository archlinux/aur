# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=strikesuitzero-hib
pkgver=1389211698
pkgrel=3
pkgdesc="A space flight combat game"
arch=('i686' 'x86_64')
url="http://strikesuitzero.com/"
license=('custom:commercial')

# libfmod and lib32-libfmod can be replaced by fmodex and lib32-fmodex respectively
depends_x86_64=('lib32-libfmod' 'lib32-sdl2')
optdepends_x86_64=('lib32-libpulse: For sound on systems using pulse')
depends_i686=('libfmod' 'sdl2')
optdepends_i686=('libpulse: For sound on systems using pulse')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

options=("!strip")

source=("hib://StrikeSuitZero_linux_${pkgver}.zip"
	"${pkgname%-hib}.desktop"
	"${pkgname%-hib}.png")

sha512sums=('9c18adeb0547eff9b88fbb4c5f93bf03713e06eea368d300acf69ee829076ee9213e97d6c52eb9e7ef1dc70b36ed044d2e2536639df73992a27fe491694ceb89'
            'ab9162b063057d1f0304fe2e2d008fdc5136400b417c6bc43de84aea4cab9d0d972056b898f9316d7bfa447b0894069dd73ee3b0aa64beda4776dc1dc087eaf7'
            '25c636f99943133445966353f6cab11eaf36e4909505b53ba1087d72911e19e74efade0c7a8c3e3b43f0beca3d795b188f549434aed8e09b1c774f1fe7ee87e1')

PKGEXT='.pkg.tar'

package() {
	# directory 'main' required by stupid binary. doesn't find resources without it
	install -d "${pkgdir}"/{opt/${pkgname%-hib},usr/bin}
	mv "${srcdir}/linux/main" "${pkgdir}/opt/${pkgname%-hib}/"
	rm "${pkgdir}/opt/${pkgname%-hib}/main/binary/"libfmod*
	rm "${pkgdir}/opt/${pkgname%-hib}/main/binary/"lib[Ss][Dd]*
	install -Dm644 "${srcdir}/${pkgname%-hib}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-hib}.png"
	install -Dm644 "${srcdir}/${source[1]}" "${pkgdir}/usr/share/applications/${source[1]}"
	ln -s /tmp/sszMain.sav ${pkgdir}/opt/strikesuitzero/main/binary/Main.sav
	ln -s /tmp/sszoutput.txt ${pkgdir}/opt/strikesuitzero/main/binary/output.txt
	ln -s /tmp/sszsettings.sav ${pkgdir}/opt/strikesuitzero/main/binary/settings.sav
	ln -s /tmp/sszbackground.sav ${pkgdir}/opt/strikesuitzero/main/binary/background.sav
	echo '#!/bin/bash
if [[ -n $XDG_DATA_HOME ]]; then
	SAVEDIR=$XDG_DATA_HOME
else
	SAVEDIR="$HOME/.local/share"
fi
if [[ -d ~/.strikesuitzero ]]; then
	mv ~/.strikesuitzero "$SAVEDIR"
fi
if [[ ! -d $SAVEDIR/strikesuitzero ]]; then
	mkdir $SAVEDIR/strikesuitzero
fi
ln -s $SAVEDIR/strikesuitzero/Main.sav /tmp/sszMain.sav
ln -s $SAVEDIR/strikesuitzero/settings.sav /tmp/sszsettings.sav
ln -s $SAVEDIR/strikesuitzero/background.sav /tmp/sszbackground.sav
cd /opt/strikesuitzero/main/binary/
./StrikeSuitZero
rm /tmp/sszMain.sav
rm /tmp/sszoutput.txt
rm /tmp/sszsettings.sav
rm /tmp/sszbackground.sav' > ${pkgdir}/usr/bin/strikesuitzero
	chmod a+x ${pkgdir}/usr/bin/strikesuitzero
	chmod a+x ${pkgdir}/opt/strikesuitzero/main/binary/StrikeSuitZero
}
