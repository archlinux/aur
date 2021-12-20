# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xd-torrent
pkgver=0.4.2
pkgrel=1
pkgdesc='An I2P BitTorrent client'
arch=('x86_64')
url='https://xd-torrent.github.io/'
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=('etc/xd.conf')
source=("https://github.com/majestrate/XD/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-xd-torrent-use-arch-ldflags.patch'
        '020-xd-torrent-rename-service-paths.patch'
        '030-xd-torrent-service-hardening.patch'
        'xd-torrent.sysusers'
        'xd-torrent.tmpfiles'
        'xd.conf')
sha256sums=('77490f37ea979d559490611f874acbb618072e3685f15d7b6254bedfe31a0b03'
            '0eb00a6df35028549286fce92cb158d3c84ec49fad72e1e437de5b5e309719d2'
            '6b3d959b55623c3f907be0e1c53c7092e9328cb0b10c336102d012d716438a14'
            '77f50344dc028eac9ee229faf2fcda4807b5fbe4872a23513c271dd0e4964e53'
            '5f2fb392c2fec68bb3861ece85b5bbdd4929c4ccccf3caeb835060213c309761'
            'f05777857bab4d18ad23582a746959cd13e07345fa74bbb3f1263a38398ac491'
            '27b6900da96e5280ff8a172b094531e08cb06a653cc97ec15eb6061d3779924b')

prepare() {
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/010-xd-torrent-use-arch-ldflags.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/020-xd-torrent-rename-service-paths.patch"
    patch -d "XD-${pkgver}" -Np1 -i "${srcdir}/030-xd-torrent-service-hardening.patch"
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
