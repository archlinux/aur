# Maintainer: Poppy Schmo <poppyschmo at users dot noreply.github.com>
pkgname=chromebook_keyboard_backlight_driver
pkgver=1.0.r9.fa4f860
pkgrel=3
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
	echo '1.0.r'$(git log --oneline | wc -l)'.'$( git log --oneline | \
		awk 'NR == 1 {print $1}')
}

build() {
	cd ${srcdir}/${pkgname}
	make
}

package() {
	local _excl='_bl' # don't autoload chromeos_keyboard_bl.ko variant
	local _confd=${pkgdir}'/etc/modules-load.d'
	local _conf='chromebook_keyboard_backlight_driver.conf'
	local _docd=${pkgdir}'/usr/share/doc/'${pkgname}
	cd ${srcdir}/${pkgname}
	echo '# modules for' ${pkgname} > "$_conf"
	for each in $(echo "*.ko"); do
		if [[ $(file "$each") =~ BuildID ]]; then
			gzip --keep "$each"
			for tdir in $(echo /usr/lib/modules/extramodules*); do
				[ -f "$each".gz ] && \
					install -Dm 644 "$each".gz ${pkgdir}/${tdir}/${each}.gz
			done
			if [[ ! "$each" =~ "$_excl" ]]; then
				echo $(basename "$each" '.ko') >> "$_conf"
			else
				echo '#'$(basename "$each" '.ko') >> "$_conf"
			fi
		fi
	done
	install -Dm 644 README.markdown "$_docd"/README.markdown
	install -Dm 644 keyboard_brightness.sh "$_docd"/keyboard_brightness.sh
	install -Dm 644 $_conf "$_confd"/"$_conf"
}

# vim:ts=4:sw=4:sts=4:ft=sh:noet:list:
