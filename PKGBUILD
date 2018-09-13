# Maintainer: Anna <morganamilo@gmail.com>

pkgnamebase=vk9-bin
pkgname=(vk9-bin lib32-vk9-bin vk9-data-bin)
pkgver=0.27.0
pkgrel=1
pkgdesc='Direct3D 9 compatibility layer using Vulkan'
arch=('x86_64' 'i686')
url='https://github.com/doitsujin/vk9'
license=('custom:zlib/libpng')
options=(!strip)
source=(
	"$pkgname-$pkgver-x86_64.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86_64-Release.zip"
	"$pkgname-$pkgver-i686.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86-Release.zip"
	setup_vk9-{x86_64,i686}.verb
	setup_vk9{,-32})
noextract=("$pkgname-$pkgver-i686.zip")

md5sums=('22afc73d4e7d1b3c7d67b1e470a6c5c3'
         '58340f9b0bd56642b2b6cf9e5721942b'
         '6600eabb853962260068f86d9a70aed1'
         'aaf4cb6c959a9dfcab2ec8ec8f802909'
         '42de90e0a79a9eef2410799044521f39'
         'c4d6aafd335443ddc5d0cc5495511db3')

prepare() {
	mkdir -p 32
	unzip -oj "$pkgname-$pkgver-i686.zip" "d3d9.dll" -d "32"
}

package_vk9-bin() {
	arch=('x86_64' 'i686')
	depends=('vk9-data' 'vulkan-icd-loader' 'wine' 'winetricks')
	provides=('vk9')
	conflicts=('vk9')

	if [[ $CARCH == "i686" ]]; then
		install -Dm644 "32/d3d9.dll" "$pkgdir/usr/lib/d3d9.dll"
	else
		install -Dm644 "d3d9.dll" "$pkgdir/usr/lib/d3d9.dll"
	fi

	install -Dm755 "setup_vk9" "$pkgdir/usr/bin/setup_vk9"
	install -Dm644 "setup_vk9-$CARCH.verb" "$pkgdir/usr/share/vk9/setup_vk9.verb"
}


package_lib32-vk9-bin() {
	arch=('x86_64')
	depends=('vk9-data')
	provides=('lib32-vk9')
	conflicts=('lib32-vk9')

	install -Dm644 "32/d3d9.dll" "$pkgdir/usr/lib32/d3d9.dll"
	install -Dm755 "setup_vk9-32" "$pkgdir/usr/bin/setup_vk9-32"
	install -Dm644 "setup_vk9-i686.verb" "$pkgdir/usr/share/lib32-vk9/setup_vk9.verb"
}

package_vk9-data-bin() {
	arch=('any')
	provides=('vk9-data')
	conflicts=('vk9-data')
	backup=('etc/VK9.conf')

	install -Dm644 "VK9.conf" "$pkgdir/etc/VK9.conf"

	for f in VertexBuffer*; do
		install -Dm644 "$f" "$pkgdir/usr/share/vk9/$f"
	done
}
