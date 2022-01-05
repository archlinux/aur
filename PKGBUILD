# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgbase=ueyed
pkgname=(ueyed ueyed-doc-en ueyed-doc-de)
pkgver=4.95.0
pkgrel=1
arch=(x86_64)
license=(custom)
url='https://en.ids-imaging.com'
makedepends=('patchelf')
install="$pkgname.install"

source=(
	"https://en.ids-imaging.com/files/downloads/ids-software-suite/software/linux-desktop/ids-software-suite-linux-64-4.95-archive.zip"
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
	'0999143973254f0cf1c670657db7be9463bc88e3713c8753d5d90a9c485470ce35cebdd867e9634212faaad5b000113242c0c31d5148125a4ed1d2ca060ff15d'
	'9e4156ecfc687b895ecf5055cd97e748760c675e8478caa46c2d19a49f1e2b31000e85a394198b9ab6da40d3b9ede4ffde4f960fc9f8ba7b1a44cffe69b77dbc'
	'82c9729a94acbe674de951a3f96fc6ab1d1257f741f48aaf6c12ad16dde51987f6d45ce09962282feb89bd14b4b5f6bd980ef5fcff499fe3709cf478708d95ff'
	'c85401d7ef4e3eefad01d065dabc9ba5dd899042a1b990af67a9b111b7055708616832e086fdd220be73ad56103d29dd6b26c1837857a54bfb1a1f7e41c97bff'
	'0b61bf73288693696fcc42c51a342e6fe231b4cf4fc2378e20d02d335e0c51ac9c15a8c20466782c8ff2f89adcd2179677007cd4fc6e9838324a58791c5e8e17'
	'65c4bf09982bf697b0e107fb19f1cbcf0552a86b75fd1a3e28fa1d68cc72e5fd6142454418ea62ec63c48c45fec80c6ea2c4da9aa682076d948f5f4408ad8c53'
	'05b961501a56b1827986aabc2a5ea8320b711fb0089615b212711814906c52af51205f04ffd9df436510362b185911797176bb6ed71bec4e35db8b1cd4d1f408'
	'a5be4a6029fba4956f1640866552a59e3fc20092ce7f58f9c70a0e181b294f1807acc1b3da882e44846fae1f96525b6b67a2e76a305aace63d1ac3824f88df41'
	'f8c034f091263143858c9f8d54339acbff58641a0120a52e07fae8e12266055df823fbda378d16f54ff85620fb341a03db473ba2744af79c61ef6e2a6579e8a7'
)

prepare() {
	shopt -s nullglob

	cd "$srcdir"
	rm "ueye_4.95.0.1134_amd64.run"

	rm -rf packages
	mkdir -p packages
	cd packages
	bsdtar -xf ../ueye_4.95.0.1134_amd64.tar.gz
	rm ueyesetup

	mkdir -p ../extracted
	for archive in *.tar.gz; do
		msg2 "Extracting %s" "$archive"
		bsdtar -xf "$archive" -C ../extracted
	done

	cd "$srcdir"
	rm extracted/opt/ids/ueye/bin/ueyesetup
}

package_ueyed() {
	pkgdesc="IDS uEye camera daemon (USB and ethernet)"
	depends=('glibc' 'openmp' 'qt5-base')
	backup=(
		'etc/ueye/ueyeethd.conf'
		'etc/ueye/ueyeusbd.conf'
	)

	cd "$srcdir"
	cp -dr extracted/opt "$pkgdir/"
	cp -dr extracted/usr "$pkgdir/"
	rm -r "$pkgdir/opt/ids/ueye/manual"

	mv "$pkgdir/opt/ids/ueye/lib/libueye_api.so" "$pkgdir/opt/ids/ueye/lib/libueye_api.so.1"
	ln -s libueye_api.so.1 "$pkgdir/opt/ids/ueye/lib/libueye_api.so"
	patchelf --replace-needed libomp.so.5 libomp.so "$pkgdir/opt/ids/ueye/lib/libueye_api.so.1"

	install -d -m 755 "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/idscameramanager" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyedemo" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyeethd" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyehotpixeleditor" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyemakeconfig" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyereport" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyesetid" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyesetip" "$pkgdir/usr/bin"
	ln -s  "/opt/ids/ueye/bin/ueyeusbd" "$pkgdir/usr/bin"

	install -d -m 755 "$pkgdir/usr/lib"
	ln -s  "/opt/ids/ueye/lib/libueye_api.so.1" "$pkgdir/usr/lib"
	ln -s  "libueye_api.so.1" "$pkgdir/usr/lib/libueye_api.so"

	install -d -m 755 "$pkgdir/usr/include/"
	ln -s  "/opt/ids/ueye/include/ueye.h" "$pkgdir/usr/include"
	ln -s  "/opt/ids/ueye/include/ueye_deprecated.h" "$pkgdir/usr/include"

	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/ueyeethd.service"
	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/ueyeusbd.service"
	install -D -m 644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir/ueyeusb.rules"
	install -D -m 644 -t "$pkgdir/etc/ueye" "$srcdir/ueyeethd.conf"
	install -D -m 644 -t "$pkgdir/etc/ueye" "$srcdir/ueyeusbd.conf"

	install -m 644 -D "$srcdir/ueye-config.cmake" "$pkgdir/usr/lib/cmake/ueye/ueye-config.cmake"
	install -m 644 -D "$srcdir/ueye-config-version.cmake" "$pkgdir/usr/lib/cmake/ueye/ueye-config-version.cmake"
	install -m 644 -D "$srcdir/ueyed-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/ueyed.conf"

	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/idscameramanager"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyedemo"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyeethd"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyesetid"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyesetip"
	patchelf --remove-rpath "$pkgdir/opt/ids/ueye/bin/ueyeusbd"
}

package_ueyed-doc-en() {
	pkgdesc="IDS uEye documentation (english)"
	arch=(any)

	cd "$srcdir"
	install -d -m 755 "$pkgdir/opt/ids/ueye/manual/"
	cp -dr extracted/opt/ids/ueye/manual/en "$pkgdir/opt/ids/ueye/manual/"
}

package_ueyed-doc-de() {
	pkgdesc="IDS uEye documentation (german)"
	arch=(any)

	cd "$srcdir"
	install -d -m 755 "$pkgdir/opt/ids/ueye/manual/"
	cp -dr extracted/opt/ids/ueye/manual/de "$pkgdir/opt/ids/ueye/manual/"
}
