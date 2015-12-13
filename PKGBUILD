# Maintainer: ssf <punx69 at gmx dot net>

pkgbase='glare-themes-git'
pkgname=('glare-themes')
pkgver=2015.12.13
pkgrel=1
pkgdesc='simple platform independent theme'
arch=('any')
url='http://sixsixfive.deviantart.com/art/Glare-494114516'
license=('CCBYSA4')
makedepends=('sed' 'p7zip' 'bc' 'make' 'findutils' 'git' 'imagemagick')
source=("${pkgbase}::git+https://github.com/sixsixfive/Glare.git")
sha256sums=('SKIP')

pkgver() {
	printf "$(date +%Y.%m.%d)"
}

build() {
	cd ${pkgbase}
	msg "executing color script...."
	cat <<\EOF
 
Would You like to change the blue hilight color to something else? [N/y]
NOTE: Choose a color that has a good contrast to white!
 
EOF
	read _askcolor
	case $_askcolor in
		[Yy])
			bash x-changecolor.sh;;
		*)
			bash x-changecolor.sh -c "#407dec";;
	esac
}

package_glare-themes() {
	pkgname=("${pkgname}" "${pkgname}-git=${pkgver}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='A generic theme for X11 desktops(includes GTK2, GTK3, Kvantum, XFWM, Marco, LXQt, WinAMP & SLiM themes)'
	optdepends=(
	'gtk2: for the GTK2 theme'
	'gtk-engines: for transparent Icons and text in the GTK2 theme'
	'gtk3: for the GTK3 theme'
	'gtk3-nocsd: strongly recommend for the GTK3 theme'
	'qt4-style-kvantum: for the Qt4 theme'
	'qt5-style-kvantum: for the Qt5 theme'
	'kvantum-manager: to easily change the Qt themes'
	'xfwm4: for full Xfce support'
	'xfce4-notifyd: for full Xfce support'
	'slim: inludes a SLiM theme'
	'audacious: includes a Winamp2.x Skin'
	'qmmp: includes a Winamp 2.x Skin'
	'palemoon: Inludes a PaleMoon fix'
	'lxqt-config: Includes a LXQt theme')	
	###start here
	install -d ${pkgdir}/usr/{share/{themes,color-schemes,apps/color-schemes,lxqt/themes,audacious/Skins,qmmp/skins,slim/themes,aurorae/themes},lib/palemoon/browser/extensions/}
	mv ${pkgbase} ${pkgdir}/usr/share/themes/Glare
	cd ${pkgdir}/usr/share/themes
	ln -sv Glare/GlareYang
	ln -sv Glare/GlareYin
	ln -sv Glare/EXTRAS/WinDecos/Glare-cupertino-dusK-x1.5
	ln -sv Glare/EXTRAS/WinDecos/Glare-cupertino-dusK
	ln -sv Glare/EXTRAS/WinDecos/Glare-cupertino
	ln -sv Glare/EXTRAS/WinDecos/Glare-default
	if [ -f /usr/bin/gtk3-widget-factory ]; then
		_gtk3majver=$(pacman -Q gtk3|cut -d" " -f2|sed 's/^\(.\{4\}\).*/\1/')
		cd ${pkgdir}/usr/share/themes/Glare/GlareYang
		if [ -d gtk-"$(echo $_gtk3majver)" ]; then
			printf "\nGTK3 version is $_gtk3majver, relinking themes\n"
			rm -v gtk-3.0
			ln -sv gtk-"$(echo $_gtk3majver)" gtk-3.0
			cd ../GlareYin
			rm -v gtk-3.0
			ln -sv gtk-"$(echo $_gtk3majver)" gtk-3.0
		fi
	fi
#KDEStuff
	cd ${pkgdir}/usr/share/color-schemes
	ln -sv ../themes/Glare/EXTRAS/ConfigFiles/KDEColorScheme/GlareYang.colors
	ln -sv ../themes/Glare/EXTRAS/ConfigFiles/KDEColorScheme/GlareYin.colors
	cd ${pkgdir}/usr/share/apps/color-schemes
	ln -sv ../../themes/Glare/EXTRAS/ConfigFiles/KDEColorScheme/GlareYang.colors
	ln -sv ../../themes/Glare/EXTRAS/ConfigFiles/KDEColorScheme/GlareYin.colors
	cd ${pkgdir}/usr/share/aurorae/themes
	ln -sv ../../themes/Glare/EXTRAS/WinDecos/Glare-default/Aurorae/Glare
#otherstuff
	install -Dm0644 ${pkgdir}/usr/share/themes/Glare/EXTRAS/Winamp2.xSkin/Glare-qmmp.wsz ${pkgdir}/usr/share/qmmp/skins/Glare-qmmp.wsz
	install -Dm0644 ${pkgdir}/usr/share/themes/Glare/EXTRAS/Winamp2.xSkin/Glare.wsz ${pkgdir}/usr/share/audacious/Skins/Glare.wsz
	cd ${pkgdir}/usr/share/lxqt/themes
	ln -sv ../../themes/Glare/EXTRAS/LXQtTheme/Glare
	cd ${pkgdir}/usr/share/slim/themes
	ln -sv ../../themes/Glare/EXTRAS/SLiMTheme/GlareSimple
	cd ${pkgdir}/usr/lib/palemoon/browser/extensions
	ln -sv ../../../../share/themes/Glare/EXTRAS/PaleMoonFixes/Glare.xpi Glare@ssfgh.com.xpi
}
