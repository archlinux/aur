# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Stefano Capitani <stefano@manjaro.org>

_pkgbase=papirus-icon-theme
pkgname=papirus-maia-icon-theme-git
pkgver=20180322.102d72b7e
pkgrel=1
pkgdesc="Manjaro variation of Papirus icon theme (git version)"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("LGPL3")
depends=('gtk-update-icon-cache')
makedepends=('git')
options=('!strip')
conflicts=(
    "${_pkgbase}"
    "${_pkgbase}-git"
    "${pkgname/-git/}"
    "papirus-gtk-icon-theme"
    "papirus-gtk-icon-theme-git"
    "papirus-icon-theme-gtk"
    "papirus-icon-theme-gtk-git"
    "papirus-icon-theme-kde"
    "papirus-icon-theme-kde-git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgbase}
    (
    git show --format='%cI' -q master | sed 's/T.*//g;s/-//g'
    echo .
    git rev-parse --short master
    ) | tr -d '\n'
}

prepare() {
	cd ${_pkgbase}

#Change color for Manjaro

msg "Create Papirus-Maia: this next bit might take a little while..."

	find . -type f -name '*.*' -exec sed -i "s|#4877b1|#3c8d7d|Ig;\
											s|#5294e2|#16a085|Ig;\
											s|#1d344f|#266357|Ig;\
											s|#0096aa|#188694|Ig;\
											s|#00bcd4|#16a085|Ig" {} \;
msg "Done Manjarifications"

#Change Icons folders name											
	sed -i -e 's/ePapirus Papirus Papirus-Adapta Papirus-Adapta-Nokto Papirus-Dark Papirus-Light/Papirus-Maia Papirus-Adapta-Maia Papirus-Adapta-Nokto-Maia Papirus-Dark-Maia Papirus-Light-Maia/g' Makefile

#Remove unused icon theme
	rm -R ePapirus

#Change Folders name
	mv Papirus Papirus-Maia
	mv Papirus-Light Papirus-Light-Maia
	mv Papirus-Dark Papirus-Dark-Maia
	mv Papirus-Adapta Papirus-Adapta-Maia
	mv Papirus-Adapta-Nokto Papirus-Adapta-Nokto-Maia

#Change Theme name	
	find . -type f -name '*.theme' -exec sed -i '2s/$/-Maia/g' {} \;
	find . -type f -name '*.theme' -exec sed -i '3s/$/ Maia/g' {} \;
}

package() {
	make -C "${_pkgbase}" DESTDIR="$pkgdir" install
  
#Recreate all symlinks to match with Papirus tree
	cd $pkgdir/usr/share/icons
	mkdir -p Papirus
	mkdir -p Papirus-Adapta
	
	for i in symbolic 64x64 48x48 32x32 24x24 22x22 16x16; do
		ln -sr $pkgdir/usr/share/icons/Papirus-Maia/$i $pkgdir/usr/share/icons/Papirus/$i
		ln -sr $pkgdir/usr/share/icons/Papirus-Adapta-Maia/$i $pkgdir/usr/share/icons/Papirus-Adapta/$i
	done
}
