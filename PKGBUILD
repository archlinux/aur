# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xd-torrent
pkgver=0.3.4
pkgrel=3
pkgdesc='An I2P BitTorrent client'
arch=('x86_64')
url='https://xd-torrent.github.io/'
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=('etc/xd.conf')
source=("https://github.com/majestrate/XD/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-xd-torrent-fix-webui-target.patch'
        '020-xd-torrent-use-arch-ldflags.patch'
        '030-xd-torrent-rename-service-paths.patch'
        '040-xd-torrent-service-hardening.patch'
        'xd-torrent.sysusers'
        'xd-torrent.tmpfiles'
        'xd.conf')
sha256sums=('90a3df7a52ec30effe4a287728c1fd2d93a3a08b59cd2c6a971513d487d9d48a'
            '53c9b91bceabfbb33c42d5dee73b50c79c81e5d2ef219b8c4e7d8f40f1bd9b3f'
            '3698cf45ae01e8e1dacea1b47cf255bc807138928cad5c3789e53268dac6fa2d'
            '6b3d959b55623c3f907be0e1c53c7092e9328cb0b10c336102d012d716438a14'
            '77f50344dc028eac9ee229faf2fcda4807b5fbe4872a23513c271dd0e4964e53'
            '5f2fb392c2fec68bb3861ece85b5bbdd4929c4ccccf3caeb835060213c309761'
            'f05777857bab4d18ad23582a746959cd13e07345fa74bbb3f1263a38398ac491'
            '2817f5eb6e204dd8e37fb4963a9b60d958ae063c6f082c41f92760802ea99530')

prepare() {
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/010-xd-torrent-fix-webui-target.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/020-xd-torrent-use-arch-ldflags.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/030-xd-torrent-rename-service-paths.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/040-xd-torrent-service-hardening.patch"
}

build() {
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    make -C "XD-${pkgver}"
}

check() {
    make -C "XD-${pkgver}" test
}

package() {
    make -C "XD-${pkgver}" PREFIX="${pkgdir}/usr" install
    
    # config
    install -D -m644 xd.conf -t "${pkgdir}/etc"
    
    # sistemd
    install -D -m644 xd-torrent.sysusers "${pkgdir}/usr/lib/sysusers.d/xd-torrent.conf"
    install -D -m644 xd-torrent.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/xd-torrent.conf"
    install -D -m644 "XD-${pkgver}/contrib/systemd/xd.service" "${pkgdir}/usr/lib/systemd/system/xd-torrent.service"
    
    # docs
    install -D -m644 "XD-${pkgver}/docs/en/readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 "XD-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
