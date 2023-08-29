# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgbase=ueyed
pkgname=(ueye-base ueye-cli ueye-gui ueyed ueye-doc-en ueye-doc-de)
pkgver=4.96.1
pkgrel=1
arch=(x86_64)
license=(custom)
url='https://en.ids-imaging.com'
makedepends=('patchelf')

source=(
	"https://en.ids-imaging.com/files/downloads/ids-software-suite/software/linux-desktop/ids-software-suite-linux-64-4.96.1-archive.tgz"
	"ueyeethd.service"
	"ueyeusbd.service"
	"ueyeusb.rules"
	"ueyeethd.conf"
	"ueyeusbd.conf"
	"ueyed-sysusers.conf"
	"ueye-config.cmake"
	"ueye-config-version.cmake"
)

sha512sums=(
	'8c0c91b2d4b3fe7e141a1c5fdedf6090d2efbf36e2eeb5e7aed981a8600d05354014a212605c434cdcfaece50560c09d558282b74a8ad230c79a91bf5954b5cc'
	'9e4156ecfc687b895ecf5055cd97e748760c675e8478caa46c2d19a49f1e2b31000e85a394198b9ab6da40d3b9ede4ffde4f960fc9f8ba7b1a44cffe69b77dbc'
	'82c9729a94acbe674de951a3f96fc6ab1d1257f741f48aaf6c12ad16dde51987f6d45ce09962282feb89bd14b4b5f6bd980ef5fcff499fe3709cf478708d95ff'
	'c85401d7ef4e3eefad01d065dabc9ba5dd899042a1b990af67a9b111b7055708616832e086fdd220be73ad56103d29dd6b26c1837857a54bfb1a1f7e41c97bff'
	'0b61bf73288693696fcc42c51a342e6fe231b4cf4fc2378e20d02d335e0c51ac9c15a8c20466782c8ff2f89adcd2179677007cd4fc6e9838324a58791c5e8e17'
	'65c4bf09982bf697b0e107fb19f1cbcf0552a86b75fd1a3e28fa1d68cc72e5fd6142454418ea62ec63c48c45fec80c6ea2c4da9aa682076d948f5f4408ad8c53'
	'05b961501a56b1827986aabc2a5ea8320b711fb0089615b212711814906c52af51205f04ffd9df436510362b185911797176bb6ed71bec4e35db8b1cd4d1f408'
	'61fd1192f400664a5e7140fc2a04a2c409cb8005b46b1ff097ae51c6cde26e82e3ed6768173c5a9e486c51889bebc4122970e9d7ca456179d734dcc05301d7e9'
	'a9b4758615e1f2a42c7daf1d2cb4aed9a52d9f2295917c5fe8d2efe957f045167aeee853aaf3e7eede61738820490ae2badb4b941b75ae73513771385b932cd0'
)

prepare() {
	shopt -s nullglob

	cd "$srcdir"
	rm "ueye_4.96.1.2054_amd64.run"

	rm -rf packages
	mkdir -p packages
	cd packages
	bsdtar -xf ../ueye_4.96.1.2054_amd64.tar.gz
	rm ueyesetup

	mkdir -p ../extracted
	for archive in *.tar.gz; do
		msg2 "Extracting %s" "$archive"
		bsdtar -xf "$archive" -C ../extracted
	done

	cd "$srcdir"
	rm extracted/opt/ids/ueye/bin/ueyesetup
}

package_ueye-base() {
	pkgdesc="IDS uEye libraries"
	group=('ueye')
	depends=(
		'gcc-libs'
		'glibc'
		'openmp'
	)

	cd "$srcdir"
	install -d -m 755 "$pkgdir/opt/ids/ueye/"
	cp -dr extracted/opt/ids/ueye/include "$pkgdir/opt/ids/ueye/"
	cp -dr extracted/opt/ids/ueye/lib "$pkgdir/opt/ids/ueye/"
	cp -dr extracted/opt/ids/ueye/share "$pkgdir/opt/ids/ueye/"

	mv "$pkgdir/opt/ids/ueye/lib/x86_64-linux-gnu/libueye_api.so" "$pkgdir/opt/ids/ueye/lib/x86_64-linux-gnu/libueye_api.so.1"
	ln -s libueye_api.so.1 "$pkgdir/opt/ids/ueye/lib/x86_64-linux-gnu/libueye_api.so"
	patchelf --replace-needed libomp.so.5 libomp.so "$pkgdir/opt/ids/ueye/lib/x86_64-linux-gnu/libueye_api.so.1"

	install -d -m 755 "$pkgdir/usr/lib/"
	ln -s  "../../opt/ids/ueye/lib/x86_64-linux-gnu/libueye_api.so.1" "$pkgdir/usr/lib/"
	ln -s  "libueye_api.so.1" "$pkgdir/usr/lib/libueye_api.so"

	install -d -m 755 "$pkgdir/usr/include/"
	ln -s  "../../opt/ids/ueye/include/ueye.h" "$pkgdir/usr/include/"
	ln -s  "../../opt/ids/ueye/include/ueye_deprecated.h" "$pkgdir/usr/include/"

	install -D -m 644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir/ueyeusb.rules"

	install -m 644 -D "$srcdir/ueye-config.cmake" "$pkgdir/usr/lib/cmake/ueye/ueye-config.cmake"
	install -m 644 -D "$srcdir/ueye-config-version.cmake" "$pkgdir/usr/lib/cmake/ueye/ueye-config-version.cmake"
}

package_ueye-cli() {
	pkgdesc="IDS uEye command line tools"
	group=('ueye')
	depends=(
		'bash'
		'gcc-libs'
		'glibc'
		'ueye-base'
	)

	cd "$srcdir"

	install -d -m 755 "$pkgdir/opt/ids/ueye/bin"
	cp -dr extracted/opt/ids/ueye/bin/ueyemakeconfig "$pkgdir/opt/ids/ueye/bin/"
	cp -dr extracted/opt/ids/ueye/bin/ueyereport "$pkgdir/opt/ids/ueye/bin/"
	cp -dr extracted/opt/ids/ueye/bin/ueyesetid "$pkgdir/opt/ids/ueye/bin/"
	cp -dr extracted/opt/ids/ueye/bin/ueyesetip "$pkgdir/opt/ids/ueye/bin/"

	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyesetid"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyesetip"

	install -d -m 755 "$pkgdir/usr/bin"
	ln -s  "../../opt/ids/ueye/bin/ueyemakeconfig" "$pkgdir/usr/bin/"
	ln -s  "../../opt/ids/ueye/bin/ueyereport" "$pkgdir/usr/bin/"
	ln -s  "../../opt/ids/ueye/bin/ueyesetid" "$pkgdir/usr/bin/"
	ln -s  "../../opt/ids/ueye/bin/ueyesetip" "$pkgdir/usr/bin/"
}

package_ueye-gui() {
	pkgdesc="IDS uEye GUI tools"
	group=('ueye')
	depends=(
		'gcc-libs'
		'glibc'
		'qt5-base'
		'systemd-libs'
		'ueye-base'
	)

	cd "$srcdir"

	install -d -m 755 "$pkgdir/usr/share/"
	cp -dr extracted/usr/share/applications "$pkgdir/usr/share/"
	cp -dr extracted/usr/share/pixmaps "$pkgdir/usr/share/"

	install -d -m 755 "$pkgdir/opt/ids/ueye/bin"
	cp -dr extracted/opt/ids/ueye/bin/idscameramanager "$pkgdir/opt/ids/ueye/bin/"
	cp -dr extracted/opt/ids/ueye/bin/ueyedemo "$pkgdir/opt/ids/ueye/bin/"
	cp -dr extracted/opt/ids/ueye/bin/ueyehotpixeleditor "$pkgdir/opt/ids/ueye/bin/"

	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/idscameramanager"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyedemo"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyehotpixeleditor"

	install -d -m 755 "$pkgdir/usr/bin"
	ln -s  "../../opt/ids/ueye/bin/idscameramanager" "$pkgdir/usr/bin/"
	ln -s  "../../opt/ids/ueye/bin/ueyedemo" "$pkgdir/usr/bin/"
	ln -s  "../../opt/ids/ueye/bin/ueyehotpixeleditor" "$pkgdir/usr/bin/"
}

package_ueyed() {
	pkgdesc="IDS uEye camera daemon (USB and ethernet)"
	group=('ueye')
	depends=(
		'gcc-libs'
		'glibc'
		'libcap'
		'libusb'
		'ueye-base'
	)
	optdepends=(
		'ueye-cli: for CLI tools'
		'ueye-gui: for GUI tools'
	)
	backup=(
		'etc/ueye/ueyeethd.conf'
		'etc/ueye/ueyeusbd.conf'
	)
	install="$pkgname.install"

	cd "$srcdir"

	install -d -m 755 "$pkgdir/opt/ids/ueye"
	cp -dr extracted/opt/ids/ueye/firmware "$pkgdir/opt/ids/ueye/"

	install -d -m 755 "$pkgdir/opt/ids/ueye/bin"
	cp -dr extracted/opt/ids/ueye/bin/ueyeethd "$pkgdir/opt/ids/ueye/bin"
	cp -dr extracted/opt/ids/ueye/bin/ueyeusbd "$pkgdir/opt/ids/ueye/bin"

	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyeethd"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyeusbd"

	install -d -m 755 "$pkgdir/usr/bin"
	ln -s  "../../opt/ids/ueye/bin/ueyeethd" "$pkgdir/usr/bin/"
	ln -s  "../../opt/ids/ueye/bin/ueyeusbd" "$pkgdir/usr/bin/"

	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/ueyeethd.service"
	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/ueyeusbd.service"
	install -D -m 644 -t "$pkgdir/etc/ueye" "$srcdir/ueyeethd.conf"
	install -D -m 644 -t "$pkgdir/etc/ueye" "$srcdir/ueyeusbd.conf"

	install -m 644 -D "$srcdir/ueyed-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/ueyed.conf"
}

package_ueye-doc-en() {
	pkgdesc="IDS uEye documentation (english)"
	arch=(any)

	cd "$srcdir"
	install -d -m 755 "$pkgdir/opt/ids/ueye/manual/"
	cp -dr extracted/opt/ids/ueye/manual/en "$pkgdir/opt/ids/ueye/manual/"
}

package_ueye-doc-de() {
	pkgdesc="IDS uEye documentation (german)"
	arch=(any)

	cd "$srcdir"
	install -d -m 755 "$pkgdir/opt/ids/ueye/manual/"
	cp -dr extracted/opt/ids/ueye/manual/de "$pkgdir/opt/ids/ueye/manual/"
}
