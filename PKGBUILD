# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: ccl2of4
# Contributor: Mister.Bubbles <http://crbserver.net>
# Contributor: daemonTutorials <http://www.daemon-tuts.de>
pkgname=wii-u-gc-adapter
pkgver=0.0.43
pkgrel=1
pkgdesc="Tool for using the Wii U GameCube Adapter on Linux"
arch=('i686' 'x86_64')
url="https://github.com/ToadKing/wii-u-gc-adapter"
license=('MIT')
depends=('libusb')
makedepends=('git')
source=('git+https://github.com/ToadKing/wii-u-gc-adapter.git#commit=64d7ddc511adb12f2eb05bd97294bc51cf51bfab'
        '51-ignore-gc-controller.conf'
        'wii-u-gc-adapter.service')
sha512sums=('SKIP'
            '6e3ca9aabd8732f5ab5220e249a7d789067b8014bbc0cbbd790f6afac04957662ad844aab70680139cfb6079fc1b28cb6fe0e664f46c13401cf068a632403dac'
            '9047f2709240a485497ef33fbfe12fc7050469eae03e09ac28b8cdaa63d9595d99d19641deac4e7fece4982b0437bc899289cfb881e875c4eeb663890149ddc2')

pkgver() {
	cd "$srcdir"/wii-u-gc-adapter
	echo -n 0.0.
	git rev-list --count HEAD
}

build() {
	cd "$srcdir"/wii-u-gc-adapter
	CFLAGS="${CFLAGS//-Werror=format-security}"
	make
}

package() {
	install -Dm755 "$srcdir"/wii-u-gc-adapter/wii-u-gc-adapter "$pkgdir"/usr/bin/wii-u-gc-adapter
	install -Dm644 <(echo uinput) "$pkgdir"/usr/lib/modules-load.d/wii-u-gc-adapter.conf
	install -Dm644 "$srcdir"/wii-u-gc-adapter.service "$pkgdir"/usr/lib/systemd/system/wii-u-gc-adapter.service
	install -Dm644 "$srcdir"/51-ignore-gc-controller.conf "$pkgdir"/usr/share/X11/xorg.conf.d/51-ignore-gc-controller.conf
	install -Dm644 "$srcdir"/wii-u-gc-adapter/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
