# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=ueyed
pkgdesc="IDS uEye camera daemon (USB and ethernet)"
pkgver=4.92.0
pkgrel=1
arch=(x86_64)
license=(custom)
url='https://en.ids-imaging.com'
depends=('glibc' 'qt4')
makedepends=('patchelf' 'sed')
install="$pkgname.install"
backup=(
	'etc/ueye/ueyeethd.conf'
	'etc/ueye/ueyeusbd.conf'
)

source=(
	"https://en.ids-imaging.com/download-ueye-lin64.html?file=tl_files/downloads/uEye_SDK/driver/uEye-Linux-$pkgver-64.tgz"
	"ueyeethd.service"
	"ueyeusbd.service"
	"ueyeusb.rules"
	"ueyeethd.conf"
	"ueyeusbd.conf"
)

sha512sums=('3dcb73451ebb96273ce422c5a68818bacf18012f063c69f8fd0b7381c3c6d3d9fd0443af415f973c63986a4b03099a313117f2a219f89f1c7f541171af9c489e'
            '9e4156ecfc687b895ecf5055cd97e748760c675e8478caa46c2d19a49f1e2b31000e85a394198b9ab6da40d3b9ede4ffde4f960fc9f8ba7b1a44cffe69b77dbc'
            '3e5d357f43e68a143b9da9c712043224304e30699618da9d17f0916297c48d4865d7af2a040561f1b13c6bdef7c613bc441549f152ce0669f67001f0d401fb5a'
            'fe1901eb22210e7c3f23171197e9316c2a400d68e62d32b52c3900d1d30c38654c90cf101db483dc140103a1c36c2de28b28e6d8a135564c382b0d3e70d37549'
            'c366ec985d541155f66e7ee0d97e0410b42d54136d8848398768a2b375b93dfe0d30bc1d8249ebbdab82a40db0aa26714b11c220fdbbfc69655e0d303df430f0'
            'c14076c66ab907a8f0d271401b322298522460f405749b27179718479f3596eecc8704411a5f41ee7394d1598c4e58acc3cd3fef38646a2156878bdd18f934d4')

prepare() {
	cd "$srcdir"

	# Comment out the the lines that run ueyesetup in the installer.
	tail +149 "ueye_4.92.0.0_amd64.run" | tar -xz
}

__install_dir() {
	local source_dir="$1"
	local target_dir="$2"
	local mode="$3"

	[[ -d "$source_dir" ]] || return 0


	for file in $(find "$source_dir" -type f); do
		install -m "$mode" -D "$file" "$target_dir/${file#${source_dir}/}"
	done
}

package() {
	cd "$srcdir"

	__install_dir     "$srcdir/usr/share"        "$pkgdir/usr/share"             644
	__install_dir     "$srcdir/usr/include"      "$pkgdir/usr/include"           644
	__install_dir     "$srcdir/usr/lib"          "$pkgdir/usr/lib"               644
	__install_dir     "$srcdir/lib/firmware/ids" "$pkgdir/usr/lib/firmware/ids"  644

	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/idscameramanager"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyedemo"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyeethd"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyemakeconfig"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyenotify"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyereport"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyesetid"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyesetip"
	install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/usr/bin/ueyeusbd"
	# Notably missing: ueyesetup
	# It does not do what we want for Arch Linux.
	# Running it as root may actually damage your system.

	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/ueyeethd.service"
	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/ueyeusbd.service"
	install -D -m 644 -t "$pkgdir/usr/lib/udev/rules.d"   "$srcdir/ueyeusb.rules"
	install -D -m 644 -t "$pkgdir/etc/ueye"               "$srcdir/ueyeethd.conf"
	install -D -m 644 -t "$pkgdir/etc/ueye"               "$srcdir/ueyeusbd.conf"

	patchelf --remove-rpath "$pkgdir/usr/bin/idscameramanager"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyedemo"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyeethd"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyenotify"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyesetid"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyesetip"
	patchelf --remove-rpath "$pkgdir/usr/bin/ueyeusbd"
}
