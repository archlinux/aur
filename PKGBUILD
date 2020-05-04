# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xd-torrent
pkgver=0.3.4
pkgrel=1
pkgdesc='An I2P BitTorrent client'
arch=('x86_64')
url='https://xd-torrent.github.io/'
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=('etc/xd.conf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/majestrate/XD/archive/v${pkgver}.tar.gz"
        '010-xd-torrent-fix-webui-target.patch'
        '020-xd-torrent-use-trimpath-and-ldflags.patch'
        '030-xd-torrent-build-pie-binaries.patch'
        '040-xd-torrent-rename-service-paths.patch'
        'xd-torrent.sysusers'
        'xd-torrent.tmpfiles'
        'xd.conf')
sha256sums=('90a3df7a52ec30effe4a287728c1fd2d93a3a08b59cd2c6a971513d487d9d48a'
            '53c9b91bceabfbb33c42d5dee73b50c79c81e5d2ef219b8c4e7d8f40f1bd9b3f'
            '929cfcd461debe96ea5efaa0497e38203186004dd86eb0b5ceecd183e339bfdc'
            '6e8ddb41d5f51e77a714baa08c225917eb9229c4847e449b73e7a26522d31805'
            'e9dcf92897f2ece84ae8ee6aa8212bcd1ba945c942a01bfabe82a85867034b25'
            '5f2fb392c2fec68bb3861ece85b5bbdd4929c4ccccf3caeb835060213c309761'
            '2688bb1f6a9812d0c926a105fd14815a285392514d639383f27e51615ff082fa'
            '2817f5eb6e204dd8e37fb4963a9b60d958ae063c6f082c41f92760802ea99530')

prepare() {
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/010-xd-torrent-fix-webui-target.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/020-xd-torrent-use-trimpath-and-ldflags.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/030-xd-torrent-build-pie-binaries.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/040-xd-torrent-rename-service-paths.patch"
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
