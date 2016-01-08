# Maintainer: George Angelopoulos <george@usermod.net>

# Upstream collectl provides an init script for running collectl as a service.
# Since we have systemd instead, this needs to be fixed. Currently this package
# doesn't provide a systemd unit for  collectl.

pkgname=collectl
pkgver=4.0.2
pkgrel=3
pkgdesc="A tool for viewing and gethering system performance metrics."
arch=('any')
url="http://collectl.sourceforge.net/"
license=('GPL2' 'custom:artistic')
depends=('perl')
backup=('etc/collectl.conf')
source=("http://sourceforge.net/projects/collectl/files/collectl/${pkgname}-${pkgver}/${pkgname}-${pkgver}.src.tar.gz"
        "collectl.service")
md5sums=('8502fbb30539e6f9ac962b8577a863b4'
         '1a840bf752b462164d9192a5d51816d3')

package() {
	cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ./INSTALL

    # we don't have sysv init in arch
    rm -rf ${pkgdir}/etc/init.d

    # uninstall script is not needed since we're using a package manager :)
    rm -rf ${pkgdir}/usr/share/${pkgname}/UNINSTALL

    # collectl is licensed under the GPL2 and some version of the ARTISTIC
    # license. Since the version of the license from upstream doesn't
    # match with any of the common ones in Arch Linux, we'll copy the
    # artistic license here as custom.
    install -D -m644 ARTISTIC "${pkgdir}/usr/share/licenses/${pkgname}/ARTISTIC"
    install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
