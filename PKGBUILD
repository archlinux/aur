pkgname=k-meleon-bin-wine
pkgver=75.1
pkgrel=1
pkgdesc="A Firefox Based Browser (runs through wine)"
arch=('i686' 'x86_64')
url="http://kmeleonbrowser.org/"
license=('GPL')
depends=(wine)
optdepends=(wine-mono wine_gecko)
makedepends=(p7zip)
source=("https://netix.dl.sourceforge.net/project/kmeleon/k-meleon/$pkgver/K-Meleon$pkgver.7z" "https://a.fsdn.com/allura/p/kmeleon/icon?1499965860")
sha256sums=('451af1cfcd32981668dc91d5c4daed093704af83edd82f458dfa34dcea1d1a56' '3d728db875f17ac7387b6dcdc5f39a10610170990076c67b866c7cae287fb960')
prepare() {
	7z x -o"${srcdir}/k-meleon.d" K-Meleon$pkgver.7z
	echo -e ${wine_script} >| ${srcdir}/k-meleon
	echo -e ${desktop_script} >| ${srcdir}/k-meleon.desktop
	chmod 755 ${srcdir}/k-meleon
	mv "${srcdir}/icon?1499965860" "${srcdir}/kmeleon.png"
	
}
wine_script='
 if [ ! -d ${HOME}/.kmeleon ] ; then \n
  cp -r /opt/k-meleon ${HOME}/.kmeleon \n
  chown -R $(whoami):$(whoami) ${HOME}/.kmeleon \n
 fi \n
 wine ${HOME}/.kmeleon/k-meleon.exe \n
'
desktop_script='
	[Desktop Entry] \n
	Name=K-Meleon (wine) \n
	Exec=/usr/bin/k-meleon \n
	Icon=kmeleon.png \n
	Comment="A Firefox Based Browser (runs through wine)" \n
	Type=Application \n
	Terminal=false \n
	Category=Network \n
	
	
	
'
package(){
	mkdir "${pkgdir}/opt" 
	cp -r ${srcdir}/k-meleon.d "${pkgdir}/opt/k-meleon"
	find "${pkgdir}/opt/k-meleon" -type d | xargs chmod 755 
	install -D "${srcdir}/k-meleon" "${pkgdir}/usr/bin/k-meleon"
	
	#desktop link
	install -Dm644 "${srcdir}/kmeleon.png" "${pkgdir}/usr/share/pixmaps/kmeleon.png"
	install -Dm644 "${srcdir}/k-meleon.desktop" "${pkgdir}/usr/share/applications/k-meleon.desktop"
	
	
}
