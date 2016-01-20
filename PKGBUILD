# Maintainer: Poppy Schmo <poppyschmo at users dot noreply.github.com>
pkgname=chromebook_keyboard_backlight_driver
pkgver=1.0.r7.g7b8a863
pkgrel=1
epoch=
pkgdesc="Keyboard backlight driver for various chromebook models"
arch=('i686' 'x86_64')
url="https://github.com/corcoran/chromebook_keyboard_backlight_driver"
license=('GPL')
depends=()
makedepends=('linux-headers')
provides=(${pkgname})
conflicts=(${pkgname})
install=${pkgname}.install
source=("git://github.com/corcoran/chromebook_keyboard_backlight_driver.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	echo ${pkgrel}'.0.r'`git log --oneline | wc -l`'.'`git describe --all --long \
		| awk -F '-' '{print $NF}'`
}

build() {
	cd ${srcdir}/${pkgname}
	make
}

package() {
	local _excl='_bl' # don't install chromeos_keyboard_bl.ko variant
	local _shortr=$(uname -r \
		| sed 's/\([0-9]\.[0-9]\+\)\.[0-9]\+-[0-9]\+\(-[A-Z]\+\)/\1\2/')
	local _destd=${pkgdir}'/usr/lib/modules/extramodules-'"$_shortr"
	local _confd=${pkgdir}'/etc/modules-load.d'
	local _conf='chromebook_keyboard_backlight_driver.conf'
	local _docd=${pkgdir}'/usr/share/doc/'${pkgname}
	cd ${srcdir}/${pkgname}
	echo '# modules for' ${pkgname} > "$_conf"
	for each in $(echo "*.ko"); do
		if [[ $(file "$each") =~ BuildID && ! "$each" =~ "$_excl" ]] ; then
			gzip --keep "$each"
			[ -f "$each".gz ] && install -Dm 644 "$each".gz "$_destd"/"$each".gz
			echo $(basename "$each" '.ko') >> "$_conf"
		fi
	done
	install -Dm 644 README.markdown "$_docd"/README.markdown
	install -Dm 644 $_conf "$_confd"/"$_conf"
}

# vim:ts=4:sw=4:sts=4:ft=sh:noet:list:
