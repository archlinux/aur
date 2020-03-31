# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=ueyed
pkgdesc="IDS uEye camera daemon (USB and ethernet)"
pkgver=4.93.0
pkgrel=2
arch=(x86_64)
license=(custom)
url='https://en.ids-imaging.com'
depends=('glibc' 'qt5-base')
makedepends=('patchelf')
install="$pkgname.install"
backup=(
	'etc/ueye/ueyeethd.conf'
	'etc/ueye/ueyeusbd.conf'
)

source=(
	"https://en.ids-imaging.com/files/downloads/ids-software-suite/software/linux-desktop/ids-software-suite-linux-$pkgver-64.tgz"
	"ueyeethd.service"
	"ueyeusbd.service"
	"ueyeusb.rules"
	"ueyeethd.conf"
	"ueyeusbd.conf"
	"ueyed-sysusers.conf"
	"ueye-config.cmake"
	"ueye-config-version.cmake"
)

sha512sums=('bac9da4940ba8aca085850975d8b73cec77c8b67b6c7fcbc77923f4b62c716b00217321f2a7f6e8ebdc83896ee4aab6729aea8cadee41fd7ab24ef2be0b83be5'
            '9e4156ecfc687b895ecf5055cd97e748760c675e8478caa46c2d19a49f1e2b31000e85a394198b9ab6da40d3b9ede4ffde4f960fc9f8ba7b1a44cffe69b77dbc'
            '3e5d357f43e68a143b9da9c712043224304e30699618da9d17f0916297c48d4865d7af2a040561f1b13c6bdef7c613bc441549f152ce0669f67001f0d401fb5a'
            'fe1901eb22210e7c3f23171197e9316c2a400d68e62d32b52c3900d1d30c38654c90cf101db483dc140103a1c36c2de28b28e6d8a135564c382b0d3e70d37549'
            '8069b0b2c07d7ad3d283bea903f38676db8b6402b5a2830335ef14586cb5c1176bca4eeba94aadb534c02a3383c85feec7a048de818edac575543d6fb9ca193e'
            'a65feca40b879b3f9b84bf1a58c0dfd8a891444e39caf48c77a7565efbb4426a57b37e202f4ccf19f724711b96674bf98bb0797317bfc2b008b9f4898d53cb78'
            '05b961501a56b1827986aabc2a5ea8320b711fb0089615b212711814906c52af51205f04ffd9df436510362b185911797176bb6ed71bec4e35db8b1cd4d1f408'
            '701e2b52ddcbac80a2c59c5e6bddeb636a5197002118a7db4eae868290f91bdb0eaec1e4825914661fd5758f0bf1e80205d6ac6b1c148ee99707cc15ac5ce29b'
            '6ee23ba61c82b672fa1ad5eba4c1c2218516be9fdb68a7a2f4bd583197b010d28cd78bc8589a732c5f5c83e355e45689d1d43568c3c96dc857d062c9360ef5ec')

prepare() {
	cd "$srcdir"

	tail +149 "ueye_4.93.0.989_amd64.run" | tar -xz

	rm "$srcdir/usr/bin/ueyesetup"
}

__install_dir() {
	local source_dir="$1"
	local target_dir="$2"
	local mode="$3"

	[[ -d "$source_dir" ]] || return 0

	for file in $(find "$source_dir" -type f); do
		install -m "$mode" -D "$file" "$target_dir/${file#${source_dir}/}"
	done

	for file in $(find "$source_dir" -type l); do
		target_file="$target_dir/${file#${source_dir}/}"
		install -m 755 -d "$(dirname "$target_file")"
		cp --no-dereference --no-target-directory --preserve=links "$file" "$target_file"
	done
}

package() {
	cd "$srcdir"

	__install_dir     "$srcdir/usr/share"             "$pkgdir/usr/share"               644
	__install_dir     "$srcdir/usr/include"           "$pkgdir/usr/include"             644
	__install_dir     "$srcdir/usr/lib"               "$pkgdir/usr/lib"                 755
	__install_dir     "$srcdir/lib/firmware/ids/ueye" "$pkgdir/usr/lib/ueyed/firmware"  644

	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/idscameramanager"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyedemo"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyeethd"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyemakeconfig"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyereport"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyesetid"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyesetip"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyeusbd"
	# Notably missing: ueyesetup
	# It does not do what we want for Arch Linux.
	# Running it as root may actually damage your system.

	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system"           "$srcdir/ueyeethd.service"
	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system"           "$srcdir/ueyeusbd.service"
	install -D -m 644 -t "$pkgdir/usr/lib/udev/rules.d"             "$srcdir/ueyeusb.rules"
	install -D -m 644 -t "$pkgdir/etc/ueye"                         "$srcdir/ueyeethd.conf"
	install -D -m 644 -t "$pkgdir/etc/ueye"                         "$srcdir/ueyeusbd.conf"

	install -m 644 -D "$srcdir/ueye-config.cmake"         "$pkgdir/usr/lib/cmake/ueye/ueye-config.cmake"
	install -m 644 -D "$srcdir/ueye-config-version.cmake" "$pkgdir/usr/lib/cmake/ueye/ueye-config-version.cmake"
	install -m 644 -D "$srcdir/ueyed-sysusers.conf"       "$pkgdir/usr/lib/sysusers.d/ueyed.conf"

	patchelf --remove-rpath "$pkgdir/usr/bin/idscameramanager"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyedemo"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyeethd"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyesetid"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyesetip"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyeusbd"
}
