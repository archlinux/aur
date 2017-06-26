# Maintainer: Poppy Schmo <poppyschmo at users dot noreply.github.com>
pkgname=chromebook_keyboard_backlight_driver
pkgver=1.0r14.g86bac41
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
	cd "${srcdir}/${pkgname}"
	printf "1.0r%s.g%s" "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	local _excl _confd _conf _docd _newest each tdir
	_excl=_bl # don't autoload chromeos_keyboard_bl.ko variant
	_confd=$pkgdir/etc/modules-load.d
	_conf=chromebook_keyboard_backlight_driver.conf
	_docd=$pkgdir/usr/share/doc/$pkgname
	_newest=
	_multi=$pkgdir/multi-kernel.install
	echo "# Run as sudo to enable driver for multiple kernels" > "$_multi"
	cd "$srcdir/$pkgname"
	echo '# modules for' ${pkgname} > "$_conf"
	for each in *.ko; do
		if [[ $(file "$each") != *BuildID* ]]; then
			continue
		fi
		gzip --keep "$each"
		for tdir in $(ls -d /usr/lib/modules/extramodules* | sort -Vr); do
			[[ ! -f "$each.gz" || ! -d "$tdir" ]] && continue
			if [[ -z "$_newest" || $_newest == "$tdir" ]]; then
				install -Dm 644 "$each.gz" "$pkgdir/$tdir/$each.gz"
				_newest=$tdir
			else
				echo "ln -s $_newest/$each ..$tdir" >> "$_multi"
			fi
		done
		if [[ ! $each == *"$_excl"* ]]; then
			basename "$each" '.ko' >> "$_conf"
		else
			echo "#$(basename "$each" '.ko')" >> "$_conf"
		fi
	done
	install -Dm 644 README.markdown "$_docd/README.markdown"
	install -Dm 644 keyboard_brightness.sh "$_docd/keyboard_brightness.sh"
	install -Dm 644 "$_conf" "$_confd/$_conf"
}

# vim:noet:list:ft=sh
