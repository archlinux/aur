# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=xd-torrent
pkgver=0.3.3
pkgrel=1
pkgdesc='An I2P BitTorrent client'
arch=('x86_64')
url='https://xd-torrent.github.io/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
backup=('etc/xd.conf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/majestrate/XD/archive/v${pkgver}.tar.gz"
        '010-xd-torrent-fix-webui-target.patch'
        '020-xd-torrent-use-trimpath-and-ldflags.patch'
        '030-xd-torrent-build-pie-binaries.patch'
        '040-xd-torrent-rename-service-paths.patch'
        '050-xd-torrent-fix-announcing-error.patch'::'https://github.com/majestrate/XD/commit/4a7084e35a709fd38166167742cf0a72d88f358d.patch'
        '060-xd-torrent-fix-tests-01.patch'
        '070-xd-torrent-fix-tests-02.patch'
        '080-xd-torrent-fix-tests-03.patch'::'https://github.com/majestrate/XD/commit/baa497aea9146af703cc56434c2bc02077a19814.patch'
        '090-xd-torrent-update-lokinet-tracker.patch'::'https://github.com/majestrate/XD/commit/d79ff87780d95e6ce1684d5fedd55f9f4ac4e40b.patch'
        'xd-torrent.sysusers'
        'xd-torrent.tmpfiles'
        'xd.conf')
sha256sums=('90ad43883f9eb792e17054e8563a6260238c4ab513fa5a637be2d520d9b24b2a'
            '53c9b91bceabfbb33c42d5dee73b50c79c81e5d2ef219b8c4e7d8f40f1bd9b3f'
            '77e71f4c5a825bc8144d733fbdc1d3e092321098930d84c215f916d7a9f68213'
            '14b09ec95dcf87f5a56674344cfca3826a435eefdac73ca17ddf6593a18b8a5c'
            'e9dcf92897f2ece84ae8ee6aa8212bcd1ba945c942a01bfabe82a85867034b25'
            'f89eecd3f8663ff0f8d90d95f7ac4f00d97685fa479edde76034baa7a39bd895'
            '0e28c3314b583f6e5a19f950e3254f3a8e0acc65b20c2d1831ec92d3a5defdb7'
            '0deb4e4665e00886b27e4eb1b4fae4184542e2a64422f5d466fca6500dd10b51'
            'e1ef031e4d3e9bbbf6ce995b3f6666e3266f2594019fb87a819595aa3d4d66da'
            '7e8665e4395ba0ea12813a28ee153c16b469f892b2d1253101222b27712b4165'
            '5f2fb392c2fec68bb3861ece85b5bbdd4929c4ccccf3caeb835060213c309761'
            '2688bb1f6a9812d0c926a105fd14815a285392514d639383f27e51615ff082fa'
            '2817f5eb6e204dd8e37fb4963a9b60d958ae063c6f082c41f92760802ea99530')

prepare() {
    # fix the 'webui' target to not compile a second time at 'make install'
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/010-xd-torrent-fix-webui-target.patch"
    
    # use -trimpath and Arch Linux LDFLAGS
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/020-xd-torrent-use-trimpath-and-ldflags.patch"
    
    # build PIE binaries
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/030-xd-torrent-build-pie-binaries.patch"
    
    # rename working directory and config file on systemd service
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/040-xd-torrent-rename-service-paths.patch"
    
    # fix announcing error
    # https://github.com/majestrate/XD/issues/71
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/050-xd-torrent-fix-announcing-error.patch"
    
    # fix tests
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/060-xd-torrent-fix-tests-01.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/070-xd-torrent-fix-tests-02.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/080-xd-torrent-fix-tests-03.patch"
    
    # update lokinet tracker
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/090-xd-torrent-update-lokinet-tracker.patch"
}

build() {
    make -C "XD-${pkgver}"
}

check() {
    make -C "XD-${pkgver}" test
}

package() {
    make -C "XD-${pkgver}" PREFIX="${pkgdir}/usr" install
    
    # config
    install -D -m644 xd.conf -t "${pkgdir}/etc"
    
    # sistemd service
    install -D -m644 "XD-${pkgver}/contrib/systemd/xd.service" "${pkgdir}/usr/lib/systemd/system/xd-torrent.service"
    
    # systemd sysusers and tmpfiles
    install -D -m644 xd-torrent.sysusers "${pkgdir}/usr/lib/sysusers.d/xd-torrent.conf"
    install -D -m644 xd-torrent.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/xd-torrent.conf"
    
    # docs
    install -D -m644 "XD-${pkgver}/docs/en/readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 "XD-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
