# Maintainer: Morganamilo <morganamilo@gmail.com>

pkgname=(vk9-bin lib32-vk9-bin)
pkgver=0.29.0
pkgrel=2
pkgdesc='Direct3D 9 compatibility layer using Vulkan'
arch=('x86_64' 'i686')
url='https://github.com/disks86/VK9'
license=('custom:zlib')
makedepends=('unzip')
options=(!strip)
source=(
	"$pkgname-$pkgver-x86_64.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86_64-Release.zip"
	"$pkgname-$pkgver-i686.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86-Release.zip"
	setup_vk9-{x86_64,i686}.verb
	setup_vk9{,-32}
	"$pkgname-$pkgver-LICENSE"::https://raw.githubusercontent.com/disks86/VK9/$pkgver/LICENSE.md)
noextract=("$pkgname-$pkgver-i686.zip")

sha256sums=('26370c1444268ad5ac8b36d35fc6a723e8274b5d8ca81793984fff1b2a65d21c'
            'fbbfebf849c08665311ccf8ca52576d5076deef28097dca54e3209234deb97ab'
            '13e6128f9ee92707e70503dbdd97c44644debbe7923aeb20cec21a54430c2284'
            '67b2df7679df7f9a0f915612e2121f98fe7794cef37ee12dc3382be6d3a24303'
            'd2eeac1250303bb2314e0fc7897247bd1c3902292e9ac24bc0275e8b4ed5f439'
            '152d177355e42bbc0a1f8b9f4ad80710fc4afccc8d14f5327636a9710b6b51f9'
            '43f8589a138d048786b5a8529a33fd98bc1d7319ea2aebb606ca3ab4510a7507')

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
	install -Dm644 "setup_vk9-$CARCH.verb" "$pkgdir/usr/share/vk9/setup_vk9.verb"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


package_lib32-vk9-bin() {
	pkgdesc+=" (32-bit)"
	arch=('x86_64')
	depends=('lib32-vulkan-icd-loader' 'wine' 'winetricks')
	provides=('lib32-vk9')
	conflicts=('lib32-vk9')

	install -Dm644 "32/d3d9.dll" "$pkgdir/usr/lib32/d3d9.dll"
	install -Dm755 "setup_vk9-32" "$pkgdir/usr/bin/setup_vk9-32"
	install -Dm644 "$pkgbase-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
