# Maintainer: alstruit <alsturit at gmail.com>
# Contributor: mrAppleXZ <mr.applexz@gmail.com>

pkgname=ceserver
_srcfile=cheat-engine
pkgver=7.5
pkgrel=2
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
			'b2d5cbf7b1635324be0b6575a5dbe1e2195374e1526b5723b1959d8ab9bfe4ee9b914f5145afb74b18296aab0904c43d735bafdb4477256aef4ec2b20f30c044')
conflicts=('ceserver-bin')

	prepare() {
		cd "$_srcfile-$pkgver"/Cheat\ Engine/ceserver/
			sed -i 's/0x00ce0000/\(void \*\) 0x00ce0000/g' ceservertest.c
            sed -i '338s/char \*modulepath/char modulepath/' extension/server.c
	}

build() {
	cd "$_srcfile-$pkgver"/Cheat\ Engine/ceserver

	case "$CARCH" in
		x86_64)
			make all -C gcc -f makefile
            make all -C extension/gcc -f makefile
			;;
		i686)
            make all -C gcc -f makefile32
			make all -C extension/gcc -f makefile32
			;;
		esac
}

package() {
    cd "$_srcfile-$pkgver/Cheat Engine/ceserver/"

    install -d "${pkgdir}/opt/${pkgname}"
    install -Dm 755 gcc/"${pkgname}" "${pkgdir}/opt/$pkgname/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    case "$CARCH" in
        i686) _pkgarch="x86"
            install -Dm 755 "extension/gcc/libceserver-extension.so" "${pkgdir}/opt/$pkgname/libceserver-extension_${_pkgarch}.so"
            ;;
        x86_64) _pkgarch="x86_64"
            install -Dm 755 "extension/gcc/libceserver-extension.so" "${pkgdir}/opt/$pkgname/libceserver-extension_${_pkgarch}.so"
            ;;
    esac
}
