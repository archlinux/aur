# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname="shadowrun-returns"
pkgver=1.2.7
pkgrel=1
epoch=1407103200
pkgdesc="a science fantasy turn based tactical role-playing game"
url="http://harebrained-schemes.com/shadowrun/"
arch=('i686' 'x86_64')
license=('custom:commercial')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://${pkgname}-linux${pkgver}.tar.gz")
sha512sums=('89ebd6efeff124c2307156523c6e8aaad64757818ad1ab9d5c2ab75591f766529e128a246c5cc9461d928ed30f12bcba2df0c076ef2e76ca9f822a3e6f5c2914')

PKGEXT='.pkg.tar'

package() {
	install -dm755 "${pkgdir}"/{opt/${pkgname},usr/{bin,share/{applications,pixmaps}}}
	pushd "${srcdir}/Shadowrun Returns" > /dev/null
	find -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;
	install -m755 -t "${pkgdir}/opt/${pkgname}" Shadowrun{,Editor}
	find Shadowrun_Data -type f -exec install -m644 {} "${pkgdir}/opt/${pkgname}/{}" \;
	ln -s /opt/${pkgname}/Shadowrun_Data/Resources/UnityPlayer.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	ln -s /tmp/${pkgname} ${pkgdir}/opt/${pkgname}/DumpBox
	echo "#!/bin/sh
cd /opt/${pkgname}
if [ -z \$XDG_CONFIG_HOME ]; then
	SAVEDIR=\"\$HOME/.config/Harebrained Schemes/Shadowrun Returns\"
else
	SAVEDIR=\"\$XDG_CONFIG_HOME/Harebrained Schemes/Shadowrun Returns\"
fi
if [ ! -d \"\$SAVEDIR/DumpBox\" ]; then
	mkdir \"\$SAVEDIR/DumpBox\"
fi
ln -s \"\$SAVEDIR/DumpBox\" /tmp/${pkgname}
/opt/${pkgname}/Shadowrun -logFile \"\$SAVEDIR/output.log\"
rm /tmp/${pkgname}" > ${pkgdir}/usr/bin/${pkgname}
	chmod a+x ${pkgdir}/usr/bin/${pkgname}
	echo "[Desktop Entry]
Type=Application
Name=Shadowrun Returns
GenericName=Shadowrun Returns
Comment=${pkgdesc}
Icon=${pkgname}
Exec=/usr/bin/${pkgname}
Categories=Game;
Path=/opt/${pkgname}" > ${pkgdir}/usr/share/applications/${pkgname}.desktop
	echo "[Desktop Entry]
Type=Application
Name=Shadowrun Returns Editor
GenericName=Shadowrun Returns Editor
Comment=Level Editor for Shadowrun Returns
Icon=${pkgname}
Exec=/opt/${pkgname}/ShadowrunEditor
Categories=Game;
Path=/opt/${pkgname}" > ${pkgdir}/usr/share/applications/${pkgname}-editor.desktop
}
