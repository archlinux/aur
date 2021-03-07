# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>

pkgname=saluto-lightdm-theme-dwm
_pkgname=Saluto
pkgver=3.0.0.r162.df23021
pkgrel=1
pkgdesc="Litarvan LightDM Theme Fork, with added support for 9wm, dwm, and rio"
arch=('any')
url="https://github.com/Demonstrandum/Saluto"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
makedepends=('git' 'npm')
conflicts=("saluto-lightdm-theme" "saluto-lightdm-theme-git")
provides=("saluto-lightdm-theme")
pkgver() {
  cd "${_pkgname}"
  _pkgver=3.0.0
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

source=(
	"git+https://github.com/Demonstrandum/Saluto"
	"dwm-9wm-rio.diff"
	"9wm.desktop"
	"dwm.desktop"
	"rio.desktop"
	"9wm.png"
	"dwm.png"
	"rio.png"
)

md5sums=(
	'SKIP' # git repo
	'0830d03266233ee20799d55ed4bd56ea' # dwm-9wm-rio.diff
	'07949190c746cf5227629051ce512338' # 9wm.desktop
	'4b077e28d1dcde5ead555d6f433da37b' # dwm.desktop
	'6067704ede5dfd31de63b5e7d9e534db' # rio.desktop
	'25396090b1aa912bb31facb1ab8dc03a' # 9wm.png
	'8f007861efc61ced5abf9ee74030afb9' # dwm.png
	'83ee56f2f1d4bab75bb6c0f13a9f10d9' # rio.png
)

prepare() {
	# Add logos
	mv 9wm.png dwm.png rio.png "$srcdir/Saluto/src/assets/default_images/desktops/"

	# Add patch that includes custom logos
	mv dwm-9wm-rio.diff "$srcdir/Saluto/src/"

	# Use doas instead of sudo, if installed
	[ $(which doas) ] && rootcmd=doas || rootcmd=sudo

	# Check if desktop files exist
	if [ -f "/usr/share/xsessions/dwm.desktop" ]; then
		printf "dwm desktop file already exists, skipping...\n"
	else
		printf "dwm desktop file DOES NOT exist, creating...\n"
		$rootcmd mv dwm.desktop /usr/share/xsessions/dwm.desktop
	fi

	if [ -f "/usr/share/xsessions/9wm.desktop" ]; then
		printf "9wm desktop file already exists, skipping...\n"
	else
		printf "9wm desktop file DOES NOT exist, creating...\n"
		$rootcmd mv 9wm.desktop /usr/share/xsessions/9wm.desktop
	fi

	if [ -f "/usr/share/xsessions/rio.desktop" ]; then
		printf "rio desktop file already exists, skipping...\n"
	else
		printf "rio desktop file DOES NOT exist, creating...\n"
		$rootcmd mv rio.desktop /usr/share/xsessions/rio.desktop
	fi

	# Patch files
	cd "$srcdir/Saluto/src"
	patch -p0 -i dwm-9wm-rio.diff

	# Make sure "node-sass" version 4 is installed
	npm install "node-sass@^4.0.0"
}

package() {

	cd "$srcdir/Saluto"

	# Fix author's mistake
	sed -i "s/^cd \.\/dist/cd \.\.\/dist/" install.sh

	# Install Saluto
	sh install.sh

	# Use doas instead of sudo, if installed
	[ $(which doas) ] && rootcmd=doas || rootcmd=sudo

	# Choose lightdm-webkit2 as main LightDM greeter
	$rootcmd sed -i "s/^greeter-session = [a-zA-Z]*\-[a-zA-Z0-9]*\-greeter/greeter-session = lightdm-webkit2-greeter/g" /etc/lightdm/lightdm.conf

	# Enable XSessions directories
	$rootcmd sed -i "s/^#sessions-directory=.*/sessions-directory=/usr/share/lightdm/sessions:/usr/share/xsessions/g" /etc/lightdm/lightdm.conf

	# Choose "saluto" as webkit2 greeter
	$rootcmd sed -i "s/webkit_theme[ \t]*= [a-zA-Z0-9]*/webkit_theme        = saluto/" /etc/lightdm/lightdm-webkit2-greeter.conf
}
