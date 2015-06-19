# Contributor: Reventlov <contact@volcanis.me>
# Your system will break if you install this. For breaking purposes only

pkgname=libressl
pkgver=2.2.0
pkgrel=1
pkgdesc="FREE version of the SSL/TLS protocol forked from OpenSSL - HIGHLY EXPRIMENTAL ONLY"
url="http://www.libressl.org/"
arch=('i686' 'x86_64')
license=('custom:Openssl')
# Uncomment this if you know what you are doing - libressl is not yet a replacement of openssl
#provides=('openssl=2.0.1')
#conflicts=('openssl')
source=(http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/${pkgname}-${pkgver}.tar.gz
        libressl-dummy-rand-egd.patch)
sha512sums=('aee06cf98dfeda9ff68c0db5c36c4f00ae0d436fadccaf811ff6c5ba26ef9e0ff73afb9034b1e3bf2715938a420ed297beee5102442b3bf5d344647d33c04e02'
            '73ca8a924a23f874287503453d939ecffa40f05760cd539b4773f3f28687ee1f2fa463ca3f2cad4ac5f57a49f3b6a918c015c8829112c61cb3ea7b798c0d110b')

build() {
    cd ${pkgname}-${pkgver}
    # Dummy RAND_egd() function - Can help to compile some stuff - See https://blog.hboeck.de/archives/851-LibreSSL-on-Gentoo.html
    patch -p1 < ../libressl-dummy-rand-egd.patch
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    # Ugly renaming of the libressl manual pages using the scheme of openssl because libressl doesn't provide the MANSUFFIX var yet - Look at the openssl PKGBUILD
    rename ".1" ".1ssl" "${pkgdir}"/usr/share/man/man1/*
    rename ".3" ".3ssl" "${pkgdir}"/usr/share/man/man3/*
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
