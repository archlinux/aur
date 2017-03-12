# Maintainer Lone_Wolf <lonewolf at xs4all dot nl>


pkgname=opentmpfiles
pkgver=0.1.3
pkgrel=1
pkgdesc='a standalone utility for handling systemd-style tmpfiles.d settings'
arch=('any')
url='https://github.com/openrc/opentmpfiles'
license=('BSD')
depends=('openrc' 'sh')

backup=(etc/openrc/conf.d/opentmpfiles-dev etc/openrc/conf.d/opentmpfiles-setup )

source=($pkgname-$pkgver::https://github.com/OpenRC/$pkgname/archive/$pkgver.tar.gz
        replace-sbin-with-usr-bin.patch
        )
install=$pkgname.install

sha512sums=('fd0b10ebfeb621466edadede50ec6e8f415861ab3b14b833c75bd71f7296e9c091e59144d39e1f9efd342b6d97776cade5a692c941085e33e9651fd885da7121'
            '7ff8e3269668850f0d812bb6003ec5111ee89a5beab882fd09c9a2cbb30b35a0b96c083bde007845418e8747082160f907b5043562425d909a13af0beacdb1e6')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "$srcdir"/replace-sbin-with-usr-bin.patch
}

package() {

    cd "${pkgname}-${pkgver}"
    
    # install tmpfiles.sh script
    make bindir=/usr/bin DESTDIR="${pkgdir}" install

    # put service files in correct locations
    for f in opentmpfiles-dev opentmpfiles-setup; do
        install -Dm755 openrc/$f.confd "$pkgdir"/etc/openrc/conf.d/$f
	install -Dm755 openrc/$f.initd "$pkgdir"/etc/openrc/init.d/$f
    done
    
    # activating the services is done in .install file
    
    # License is BSD 2 clause type and needs to be installed
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/license" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
