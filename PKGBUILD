# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor Lone_Wolf <lonewolf at xs4all dot nl>

pkgname=opentmpfiles
pkgver=0.3.1
pkgrel=1
pkgdesc='Utility for handling systemd-style tmpfiles.d settings for systems booting openrc'
arch=('any')
url='https://github.com/openrc/opentmpfiles'
license=('BSD')
depends=('openrc' 'sh')
optdepends=('openrc-arch-services-git: collection of services for Arch'
            'net-tools: for network service support'
            'openrc: To make use of this initscript.'
            )
backup=(etc/openrc/conf.d/opentmpfiles-dev etc/openrc/conf.d/opentmpfiles-setup )

source=($pkgname-$pkgver::https://github.com/OpenRC/$pkgname/archive/$pkgver.tar.gz)

md5sums=('6625db2353c4eec535992ee0d60f99ba')
sha512sums=('1e0985403013ac10c0fe50a7ba61a250357b1ea7ea426f9dc92d7071e97eb0e5209448550cf427734b917599defa5123254044d5352b9dcaa22e562e5ca6821f')

_SYSCONFDIR=/etc/openrc

package() {

    cd "${pkgname}-${pkgver}"
    
    # install tmpfiles.sh script
    make bindir=/usr/bin DESTDIR="${pkgdir}" install

    # put service files in correct locations
    for f in opentmpfiles-dev opentmpfiles-setup; do
        install -Dm755 openrc/$f.confd "$pkgdir"$_SYSCONFDIR/conf.d/$f
        install -Dm755 openrc/$f.initd "$pkgdir"$_SYSCONFDIR/init.d/$f
    done
    
    # activating the services should be done manually
    
    # License is BSD 2 clause type and needs to be installed
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/license" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
