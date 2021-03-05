# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>

pkgname=saluto-lightdm-theme-dwm
_pkgname=Saluto
pkgver=3.0.0
pkgrel=1
pkgdesc="Saluto: Litarvan LightDM Theme Fork, with added support for DWM"
arch=('any')
url="https://github.com/Demonstrandum/Saluto"
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
makedepends=('git' 'npm')
conflicts=("saluto-lightdm-theme" "saluto-lightdm-theme-git")
provides=("saluto-lightdm-theme")
md5sums=(
	'SKIP' # git repo
	'4b077e28d1dcde5ead555d6f433da37b' # dwm.desktop
	'6db4d11c5632c5b41bad0ac1b3b581b1' # dwm-lightdm.diff
	'c7a7e64586bebde20886cc731bf2d38c' # dwm-vue.diff
	'8f007861efc61ced5abf9ee74030afb9' # dwm.png
)

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

source=(
	"git+https://github.com/Demonstrandum/Saluto"
	"dwm.desktop"
	"dwm-lightdm.diff"
	"dwm-vue.diff"
	"dwm.png"
)

prepare() {
	# Add dwm logo
	mv dwm.png "$srcdir/Saluto/src/assets/default_images/desktops/dwm.png"
	# Add patches that include dwm logo
	mv dwm-vue.diff "$srcdir/Saluto/src/components/"
	mv dwm-lightdm.diff "$srcdir/Saluto/src/"

	# Check if dwm desktop file exists
	[[ -f "/usr/share/xsessions/dwm.desktop" ]] && printf "dwm desktop file already exists, skipping...\n" || printf "dwm desktop file DOES NOT exist, creating...\n"; sudo mv dwm.desktop /usr/share/xsessions/dwm.desktop

	# Patch "lightdm.js"
	cd "$srcdir/Saluto/src"
	patch < dwm-lightdm.diff

	# Patch "SelectItem.vue"
	cd "$srcdir/Saluto/src/components"
	patch < dwm-vue.diff
}

package() {
	# Install saluto
	cd "$srcdir/Saluto" && sh install.sh

	# Choose lightdm-webkit2 as main LightDM greeter
	sudo sed -i "s/^greeter-session = [a-zA-Z]*\-[a-zA-Z0-9]*\-greeter/greeter-session = lightdm-webkit2-greeter/g" /etc/lightdm/lightdm.conf
	# Choose "saluto" as webkit2 greeter
	sudo sed -i "s/webkit_theme[ \t]*= [a-zA-Z0-9]*/webkit_theme        = saluto/" /etc/lightdm/lightdm-webkit2-greeter.conf
}
