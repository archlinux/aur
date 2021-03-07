# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>

pkgname=saluto-lightdm-theme-dwm
_pkgname=Saluto
pkgver=3.0.0
pkgrel=1
pkgdesc="Saluto: Litarvan LightDM Theme Fork, with added support for DWM and 9wm"
arch=('any')
url="https://github.com/Demonstrandum/Saluto"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
makedepends=('git' 'npm')
conflicts=("saluto-lightdm-theme" "saluto-lightdm-theme-git")
provides=("saluto-lightdm-theme")
md5sums=(
	'SKIP' # git repo
	'14d9664d047ee55374b9cdf3aaba4e64' # dwm-9wm.diff
	'4b077e28d1dcde5ead555d6f433da37b' # dwm.desktop
	'07949190c746cf5227629051ce512338' # 9wm.desktop
	'8f007861efc61ced5abf9ee74030afb9' # dwm.png
	'25396090b1aa912bb31facb1ab8dc03a' # 9wm.png
)

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

source=(
	"git+https://github.com/Demonstrandum/Saluto"
	"dwm-9wm.diff"
	"dwm.desktop"
	"9wm.desktop"
	"dwm.png"
	"9wm.png"
)

prepare() {
	# Add dwm & 9wm logos
	mv dwm.png 9wm.png "$srcdir/Saluto/src/assets/default_images/desktops/"

	# Add patch that includes custom logos
	mv dwm-9wm.diff "$srcdir/Saluto/src/" # /components

	# Use doas instead of sudo, if installed
	[ $(which doas) ] && rootcmd=doas || rootcmd=sudo

	# Check if desktop files exist
	[[ -f "/usr/share/xsessions/dwm.desktop" ]] && printf "dwm desktop file already exists, skipping...\n" || printf "dwm desktop file DOES NOT exist, creating...\n"; $rootcmd mv dwm.desktop /usr/share/xsessions/dwm.desktop

	[[ -f "/usr/share/xsessions/9wm.desktop" ]] && printf "9wm desktop file already exists, skipping...\n" || printf "9wm desktop file DOES NOT exist, creating...\n"; $rootcmd mv 9wm.desktop /usr/share/xsessions/9wm.desktop

	# Patch files
	cd "$srcdir/Saluto/src"
	patch -i dwm-9wm.diff

	# Make sure "node-sass" version 4 is installed
	npm install "node-sass@^4.0.0"
}

package() {
	# Install saluto
	cd "$srcdir/Saluto" && sh install.sh

	# Use doas instead of sudo, if installed
	[ $(which doas) ] && rootcmd=doas || rootcmd=sudo

	# Choose lightdm-webkit2 as main LightDM greeter
	$rootcmd sed -i "s/^greeter-session = [a-zA-Z]*\-[a-zA-Z0-9]*\-greeter/greeter-session = lightdm-webkit2-greeter/g" /etc/lightdm/lightdm.conf

	# Enable XSessions directories
	$rootcmd sed -i "s/^#sessions-directory=.*/sessions-directory=/usr/share/lightdm/sessions:/usr/share/xsessions/g" /etc/lightdm/lightdm.conf

	# Choose "saluto" as webkit2 greeter
	$rootcmd sed -i "s/webkit_theme[ \t]*= [a-zA-Z0-9]*/webkit_theme        = saluto/" /etc/lightdm/lightdm-webkit2-greeter.conf
}
