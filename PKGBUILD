# Maintainer: Luca Canavese <l.canavese@protonmail.com>
# Contributor: Nicolas Formichella <stigpro@outlook.fr>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux @ free.fr>
# Contributor: Francesco Groccia <frgroccia gmail.com>
# Contributor: Dincer Celik <dincer@bornovali.com>

pkgname=localepurge
pkgver=0.7.3.11
pkgrel=1
pkgdesc="Script to remove disk space wasted for unneeded localizations."
arch=('any')
url="http://packages.debian.org/source/sid/localepurge"
license=('GPL')
backup=('etc/locale.nopurge')
source=("http://deb.debian.org/debian/pool/main/l/localepurge/${pkgname}_${pkgver}.tar.xz"
        "${pkgname}.diff"
        "${pkgname}_fgrep.diff"
        "${pkgname}.8.diff"
        "${pkgname}.config.diff"
        "locale.nopurge")
sha256sums=('f7301e0951f9f10f659a8fded728003d7411a60d67fb7f1280612d8c9d7f180e'
            '996a5b3f4e00255ec39f3a0d1cc8d17024d5a2b780df4a6464fdb7f37322c57b'
            '35ea9626835d4fbf6feffcfaf61054f1e2c18f03015b04e285af07552507549a'
            'ff00441572e98e38d5fb5c753b78dac5fe9dc1b20094e3b9050b91b203b9206f'
            '5155a67cd27e17f8232f1fdedf7d7be6f70d5505602a8ca2fd99dc21ef3bbd60'
            'b9c28be93fa47d4f0315972159e501d9eef28bbab7ffe6e8e7c4a13c359f35e8')

prepare()
{
    patch -uN ${srcdir}/${pkgname}-${pkgver}/usr/sbin/localepurge < ${srcdir}/localepurge.diff
    patch -uN ${srcdir}/${pkgname}-${pkgver}/usr/sbin/localepurge < ${srcdir}/localepurge_fgrep.diff
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

