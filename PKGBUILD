# Maintainer: Anna <morganamilo@gmail.com>

pkgnamebase=vk9-bin
pkgname=(vk9-bin lib32-vk9-bin)
pkgver=0.29.0
pkgrel=1
pkgdesc='Direct3D 9 compatibility layer using Vulkan'
arch=('x86_64' 'i686')
url='https://github.com/disks86/VK9'
license=('custom:zlib/libpng')
options=(!strip)
source=(
	"$pkgname-$pkgver-x86_64.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86_64-Release.zip"
	"$pkgname-$pkgver-i686.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86-Release.zip"
	setup_vk9-{x86_64,i686}.verb
	setup_vk9{,-32})
noextract=("$pkgname-$pkgver-i686.zip")

md5sums=('808d09e34c5aeae5971a2259423fc01a'
         '2086a2ab04aa27e6101463723695e3b6'
         '6600eabb853962260068f86d9a70aed1'
         'aaf4cb6c959a9dfcab2ec8ec8f802909'
         '42de90e0a79a9eef2410799044521f39'
         'c4d6aafd335443ddc5d0cc5495511db3')

prepare() {
	mkdir -p 32
	unzip -oj "$pkgname-$pkgver-i686.zip" "$pkgver-bin-*-Release/d3d9.dll" -d "32"
}

package_vk9-bin() {
	arch=('x86_64' 'i686')
	depends=('vulkan-icd-loader' 'wine' 'winetricks')
	provides=('vk9')
	conflicts=('vk9')

	if [[ $CARCH == "i686" ]]; then
		install -Dm644 "32/d3d9.dll" "$pkgdir/usr/lib/d3d9.dll"
	else
		install -Dm644 $pkgver-bin-*-Release/d3d9.dll "$pkgdir/usr/lib/d3d9.dll"
	fi

	install -Dm755 "setup_vk9" "$pkgdir/usr/bin/setup_vk9"
	install -Dm644 "setup_vk9-$CARCH.verb" "$pkgdir/usr/share/vk9/setup_vk9.verb"
}


package_lib32-vk9-bin() {
	pkgdesc+=" (32-bit)"
	arch=('x86_64')
	depends=('lib32-vulkan-icd-loader' 'wine' 'winetricks')
	provides=('lib32-vk9')
	conflicts=('lib32-vk9')

	install -Dm644 "32/d3d9.dll" "$pkgdir/usr/lib32/d3d9.dll"
	install -Dm755 "setup_vk9-32" "$pkgdir/usr/bin/setup_vk9-32"
	install -Dm644 "setup_vk9-i686.verb" "$pkgdir/usr/share/lib32-vk9/setup_vk9.verb"
}
