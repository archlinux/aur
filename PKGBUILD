#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=k-meleon-bin-wine
pkgver=76.4
timecode=20210213
pkgrel=1
pkgdesc="A Firefox Based Browser (runs through wine)"
arch=('i686' 'x86_64')
url="http://kmeleonbrowser.org/"
license=('GPL')
depends=(wine)
optdepends=(wine-mono wine_gecko)
makedepends=(p7zip)
source=("https://o.rthost.win/kmeleon/KM${pkgver}-Goanna-${timecode}.7z" "https://a.fsdn.com/allura/p/kmeleon/icon?1499965860")
sha256sums=('4be6d342a9a132f2b141d1bb5d85696a1b0aebbc48f4bd36f47b3accb35bec4a' '3d728db875f17ac7387b6dcdc5f39a10610170990076c67b866c7cae287fb960')
prepare() {
	7z x -o"${srcdir}/k-meleon.d" KM${pkgver}-Goanna-${timecode}.7z
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
