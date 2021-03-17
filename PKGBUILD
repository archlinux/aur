# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xd-torrent
pkgver=0.3.4
pkgrel=4
pkgdesc='An I2P BitTorrent client'
arch=('x86_64')
url='https://xd-torrent.github.io/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
backup=('etc/xd.conf')
source=("git+https://github.com/majestrate/XD.git#tag=v${pkgver}"
        '010-xd-torrent-fix-build-part1.patch'::'https://github.com/majestrate/XD/commit/5c864223210f2848150485a6b40d837e8778575f.patch'
        '020-xd-torrent-fix-build-part2.patch'::'https://github.com/majestrate/XD/commit/e1f4ce28363f4dd3f3902d79aacfbd273d7c8bfd.patch'
        '030-xd-torrent-fix-build-part3.patch'::'https://github.com/majestrate/XD/commit/9152c3fef309558eb041a90a860be45e9186c9b4.patch'
        '040-xd-torrent-fix-webui-target.patch'::'https://github.com/majestrate/XD/commit/6b4204e162cef15afcf3e53634c132c78a50f3e5.patch'
        '050-xd-torrent-fix-tests.patch'::'https://github.com/majestrate/XD/commit/151d5b6a13f948b4b3f8728dbb15eecc9e7fc53f.patch'
        '060-xd-torrent-use-arch-ldflags.patch'
        '070-xd-torrent-rename-service-paths.patch'
        '080-xd-torrent-service-hardening.patch'
        'xd-torrent.sysusers'
        'xd-torrent.tmpfiles'
        'xd.conf')
sha256sums=('SKIP'
            'b273a994d08db9a471bd778b216fc8f921bf8fdfdae451c2a5d86b4c004f7cb1'
            'd20098827a6a774c79a4c9259585b8b5fa01cae5730d2afa0ce995ebcb1b5cba'
            '6933d6f619d0c4411dad3ee00297d751675607e3f9cc7f74b6a2388bfbfaad9f'
            'b404e26612c41809d88adb7654d4ebb142dbf7997a4e1e4a4900245e44da2c91'
            '1cbd2b4bba8df173a68a45dddbf8db8166b2c5a68b10562a947d59f624fa7a66'
            '501872a2ceca5de0999448e5373920fb9d0c016274107f9279df67a9c7ec16b5'
            '6b3d959b55623c3f907be0e1c53c7092e9328cb0b10c336102d012d716438a14'
            '77f50344dc028eac9ee229faf2fcda4807b5fbe4872a23513c271dd0e4964e53'
            '5f2fb392c2fec68bb3861ece85b5bbdd4929c4ccccf3caeb835060213c309761'
            'f05777857bab4d18ad23582a746959cd13e07345fa74bbb3f1263a38398ac491'
            '27b6900da96e5280ff8a172b094531e08cb06a653cc97ec15eb6061d3779924b')

prepare() {
    patch -d XD -Np1 -i "${srcdir}/010-xd-torrent-fix-build-part1.patch"
    git -C XD apply "${srcdir}/020-xd-torrent-fix-build-part2.patch"
    patch -d XD -Np1 -i "${srcdir}/030-xd-torrent-fix-build-part3.patch"
    patch -d XD -Np1 -i "${srcdir}/040-xd-torrent-fix-webui-target.patch"
    patch -d XD -Np1 -i "${srcdir}/050-xd-torrent-fix-tests.patch"
    patch -d XD -Np1 -i "${srcdir}/060-xd-torrent-use-arch-ldflags.patch"
    patch -d XD -Np1 -i "${srcdir}/070-xd-torrent-rename-service-paths.patch"
    patch -d XD -Np1 -i "${srcdir}/080-xd-torrent-service-hardening.patch"
}

build() {
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    make -C XD
}

check() {
    make -C XD test
}

package() {
    make -C XD PREFIX="${pkgdir}/usr" install
    
    # config
    install -D -m644 xd.conf -t "${pkgdir}/etc"
    
    # sistemd
    install -D -m644 xd-torrent.sysusers "${pkgdir}/usr/lib/sysusers.d/xd-torrent.conf"
    install -D -m644 xd-torrent.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/xd-torrent.conf"
    install -D -m644 XD/contrib/systemd/xd.service "${pkgdir}/usr/lib/systemd/system/xd-torrent.service"
    
    # docs
    install -D -m644 XD/docs/en/readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 XD/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
