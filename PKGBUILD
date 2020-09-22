# Maintainer: Westly Ward <sonicrues1234 at gmail dot com>
pkgname=xmrig-raspi4-donateless
pkgver=6.3.3
pkgrel=2
epoch=
pkgdesc="High performance, open source, cross platform RandomX, KawPow, CryptoNight and AstroBWT unified CPU/GPU miner. This package is meant only for the Raspberry Pi 4."
arch=('aarch64')
url=""
license=('GPL3')
groups=()
depends=("hwloc" "libuv" "curl" "openssl")
makedepends=('cmake' 'jansson' 'gmp' 'libmicrohttpd' 'gcc81-raspi4-xmrig')
checkdepends=()
optdepends=()
provides=()
conflicts=('xmrig-bin' 'xmrig' 'xmrig-donateless')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/xmrig/xmrig/archive/v6.3.3.tar.gz"
		"donateless.patch")
noextract=()
md5sums=('79217eaec40dc91378b92043f2c34e48'
         '0b557af84f7866f4a12c29c0413b4b5a')
validpgpkeys=()

prepare() {
	cd "xmrig-6.3.3"
	patch --strip=1 --input="../donateless.patch"
	mkdir -p build
}

build() {
	cd "xmrig-6.3.3/build"
        cmake .. -DCMAKE_C_COMPILER=/usr/local/gcc-8.1.0/bin/aarch64-unknown-linux-gnu-gcc -DCMAKE_CXX_COMPILER=/usr/local/gcc-8.1.0/bin/aarch64-unknown-linux-gnu-g++ -DCMAKE_C_FLAGS="-mcpu=cortex-a72 -mtune=cortex-a72" -DCMAKE_CXX_FLAGS="-mcpu=cortex-a72 -mtune=cortex-a72"
	make -j4
}

package() {
	cd "xmrig-6.3.3"
	install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/xmrig"
	install -Dm644 "src/config.json" "${pkgdir}/etc/xmrig/xmrig.conf"
}
