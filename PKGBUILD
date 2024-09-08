# Maintainer: alstruit <alsturit at gmail.com>
# Contributor: mrAppleXZ <mr.applexz@gmail.com>

pkgname=ceserver
_srcfile=cheat-engine
pkgver=7.5
pkgrel=1
pkgdesc='Cheat Engine Server.'
url='https://github.com/cheat-engine/cheat-engine/tree/master/Cheat%20Engine/ceserver'
arch=('i686' 'x86_64')
#arch=('armv7h' 'aarch64' 'x86_64')
license=('custom')
depends=('glibc' 'zlib')
install="${pkgname}".install
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cheat-engine/cheat-engine/archive/${pkgver}.tar.gz" "${pkgname}.service")
sha512sums=('f2b8dab12f56709a47759fb027590643c560d2d0f9be4aaea8ff6c1f150b158117bfc5950d3351bb4ee33b3e74c792c17b85c5f9ce9849d69c03758e6d4e3e9f'
			'7b9b0287b1962a60f00cd9747de8b31cc217adc91adf61f7c6bb12a607b3cda0dca7e5a7b6054120384b0c59869460f80ec98649b57c47906126ff3d23e8c20d')
conflicts=('ceserver-bin')

	prepare() {
		cd "$_srcfile-$pkgver"/Cheat\ Engine/ceserver/
			sed -i 's/0x00ce0000/(void *) 0x00ce0000/g' ceservertest.c
	}

build() {
	cd "$_srcfile-$pkgver"/Cheat\ Engine/ceserver/gcc

	case "$CARCH" in
		x86_64)
			make all makefile
			;;
		i686)
			make all makefile32
			;;
		esac
}

package() {

	cd "$_srcfile-$pkgver"/"Cheat Engine"/ceserver/gcc
		install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
		install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
