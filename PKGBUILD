# Maintainer: Nicolas Formichella <stigpro@outlook.fr>
# Maintainer: Joshua Ward <joshuaward@myoffice.net.au>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux @ free.fr>
# Contributor: Francesco Groccia <frgroccia gmail.com>
# Contributor: Dincer Celik <dincer@bornovali.com>

pkgname=localepurge
pkgver=0.7.3.10
pkgrel=0
pkgdesc="Script to remove disk space wasted for unneeded localizations."
arch=('any')
url="http://packages.debian.org/source/sid/localepurge"
license=('GPL')
backup=('etc/locale.nopurge')
source=("http://deb.debian.org/debian/pool/main/l/localepurge/${pkgname}_${pkgver}.tar.xz"
        "${pkgname}.diff"
        "${pkgname}.8.diff"
        "${pkgname}.config.diff"
        "locale.nopurge")

prepare()
{
    patch -uN ${srcdir}/${pkgname}-${pkgver}/usr/sbin/localepurge < ${srcdir}/localepurge.diff
    patch -uN ${srcdir}/${pkgname}-${pkgver}/debian/localepurge.8 < ${srcdir}/localepurge.8.diff
    patch -uN ${srcdir}/${pkgname}-${pkgver}/debian/localepurge.config < ${srcdir}/localepurge.config.diff
}

package()
{
    install -D -m755 ${srcdir}/${pkgname}-${pkgver}/usr/sbin/localepurge ${pkgdir}/usr/bin/localepurge
    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/debian/localepurge.8 ${pkgdir}/usr/share/man/man8/localepurge.8
    install -D -m755 ${srcdir}/${pkgname}-${pkgver}/debian/localepurge.config ${pkgdir}/usr/bin/localepurge-config
    install -D -m644 locale.nopurge ${pkgdir}/etc/locale.nopurge
    if [ ! -e /var/cache/localepurge/localelist ]; then
	find /usr/share/locale -maxdepth 1 -type d -name "*" -printf "%f\n" | grep "^[a-z]" | cut -d" " -f1 | sort -u > ${srcdir}/localelist
    else
	cp /var/cache/localepurge/localelist ${srcdir}/localelist
    fi
    install -D -m644 ${srcdir}/localelist ${pkgdir}/var/cache/localepurge/localelist
}
sha256sums=('56b08640f46d6ebf20b2d535e5ba54d062de70c8f2aadf5a5c665b6007f7f6e2'
            '7a3bff4fd339c883060c9219795e416e85d04ee46fce8dde6d5f0e0a0a51d0b5'
            '82bd40594ef0646465eed6e525368e87694322513c0d3280879fcfc5c40cb6a7'
            'b27e69a87f81ecb01ecd9fd92c174ed3c4406200eedc50ba6ebabce91e3851e8'
            'b9c28be93fa47d4f0315972159e501d9eef28bbab7ffe6e8e7c4a13c359f35e8')
