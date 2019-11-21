# Maintainer Lone_Wolf <lonewolf at xs4all dot nl>

pkgname=opentmpfiles
pkgver=0.2
pkgrel=1
pkgdesc='Utility for handling systemd-style tmpfiles.d settings for systems booting openrc'
arch=('any')
url='https://github.com/openrc/opentmpfiles'
license=('BSD')
depends=('openrc' 'sh')

backup=(etc/openrc/conf.d/opentmpfiles-dev etc/openrc/conf.d/opentmpfiles-setup )

source=($pkgname-$pkgver::https://github.com/OpenRC/$pkgname/archive/$pkgver.tar.gz)

md5sums=('5197fcae0f2fb2ed223e92dae96497cc')
sha512sums=('bc384cc9156ba6c54d3308ddad4d26b1877f020aa8558e82df2ed49ffa65e0fed5a49eaa11b27193bfe2ad11a4d7368f7cdbc225b820b309af3b299327ddb07b')

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
