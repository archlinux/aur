# Maintainer: alstruit <alsturit at gmail.com>
# Contributor: mrAppleXZ <mr.applexz@gmail.com>

pkgname=ceserver
_srcfile=cheat-engine
pkgver=7.5
pkgrel=9
pkgdesc='Cheat Engine Server.'
url='https://github.com/cheat-engine/cheat-engine/tree/master/Cheat%20Engine/ceserver'
arch=('i686' 'pentium4' 'x86_64')
license=('custom')
makedepends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-zlib')
depends=('glibc' 'zlib')
install="${pkgname}".install
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/cheat-engine/cheat-engine/archive/${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.patch"
)

sha512sums=(
    'f2b8dab12f56709a47759fb027590643c560d2d0f9be4aaea8ff6c1f150b158117bfc5950d3351bb4ee33b3e74c792c17b85c5f9ce9849d69c03758e6d4e3e9f'
    'b2d5cbf7b1635324be0b6575a5dbe1e2195374e1526b5723b1959d8ab9bfe4ee9b914f5145afb74b18296aab0904c43d735bafdb4477256aef4ec2b20f30c044'
    'd9ede5b04a368a531debfb33b5243828f0cd6bf29b1ccfcff421e9495ff3972bedb3ecee1147069c20b44c3f8ed99030ae1fb411030c9a2ead9ebaef1d3b0749'
)

conflicts=('ceserver-bin')

prepare() {
    cd "$_srcfile-$pkgver"
    patch -Np1 -i ../${pkgname}.patch
}

build() {

    #Fix for Race Condition.
    MAKEFLAGS="-j1"

    cd "$_srcfile-$pkgver/Cheat Engine/ceserver"

    case "$CARCH" in
        x86_64)
            make all -C gcc -f makefile
            make all -C extension/gcc -f makefile
            ;;
        i686|pentium4)
            make all -C gcc -f makefile32
            ;;
    esac

    make all -C extension/gcc -f makefile32
}

package() {
    cd "$_srcfile-$pkgver/Cheat Engine/ceserver"

    install -d "${pkgdir}/opt/${pkgname}"
    install -Dm 755 gcc/"${pkgname}" "${pkgdir}/opt/$pkgname/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    case "$CARCH" in
        x86_64)
            install -Dm 755 "extension/gcc/libceserver-extension.so" "${pkgdir}/opt/$pkgname/libceserver-extension_x86_64.so"
            ;;
    esac

    install -Dm 755 "extension/gcc/libceserver-extension_x86.so" "${pkgdir}/opt/$pkgname/libceserver-extension_x86.so"
}
