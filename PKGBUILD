# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: robertfoster
# Contributor: kurych
# Contributor: redfish
# Contributor: DDoSolitary <DDoSolitary@gmail.com>

pkgname=i2pd-git
pkgver=2.55.0.r3.g18707dd8
pkgrel=1
pkgdesc='A full-featured C++ implementation of the I2P router (git version)'
arch=('x86_64')
url='https://i2pd.website/'
license=('BSD-3-Clause')
depends=('boost-libs' 'libminiupnpc.so' 'openssl' 'zlib')
makedepends=('git' 'cmake' 'boost' 'check')
provides=('i2pd' 'i2p-router')
conflicts=('i2pd')
backup=('etc/i2pd/i2pd.conf'
        'etc/i2pd/tunnels.conf'
        'etc/logrotate.d/i2pd')
source=('git+https://github.com/PurpleI2P/i2pd.git#branch=openssl'
        '005-i2pd-tests-use-arch-flags.conf'
        '010-i2pd-config.patch'
        '020-i2pd-do-not-override-config.patch'
        '030-i2pd-systemd-service-hardening.patch'
        '040-i2pd-tunnels-d-readme.patch'
        'i2pd.sysusers'
        'i2pd.tmpfiles')
sha256sums=('SKIP'
            '2ddf15f1c1cdf5d747a0af667145238023fd126ab00c65f2897cacae935015b1'
            'ed1bde650139731921bf3c8091b3332620404e7700fb9c486a4a806fe34e2d3b'
            '805a82f23c244afbdfae0a4f30d1707301bc0e23437f83d1c84f13c33f62ea28'
            '2b84d85d4234eb3b640925d0dd244c8abe3b48bc69c8456629af923de17acf10'
            'cfcb6b07b67aff3e3af12767f4649d88b9320dc71907b6c01b465e5c138cdaa3'
            '2f91fd455ea801df9a9bcc5f3f83def231d9149eec8b206588c8be21654e5b7c'
            'fe8cc2ec83cb5b5c2b2ec8cce9a989e0cb6fd347e00b84e03a17b12efd152fac')

prepare() {
    patch -d i2pd -Np1 -i "${srcdir}/005-i2pd-tests-use-arch-flags.conf"
    patch -d i2pd -Np1 -i "${srcdir}/010-i2pd-config.patch"
    patch -d i2pd -Np1 -i "${srcdir}/020-i2pd-do-not-override-config.patch"
    patch -d i2pd -Np1 -i "${srcdir}/030-i2pd-systemd-service-hardening.patch"
    patch -d i2pd -Np1 -i "${srcdir}/040-i2pd-tunnels-d-readme.patch"
}

pkgver() {
    git -C i2pd describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake \
        -B build \
        -S i2pd/build \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DWITH_UPNP:BOOL='ON' \
        -DBUILD_TESTING:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    
    # config
    install -D -m644 i2pd/contrib/{i2pd,tunnels}.conf -t "${pkgdir}/etc/i2pd"
    install -d -m755 "${pkgdir}/etc/i2pd/tunnels.d"
    
    # certificates
    install -d -m755 "${pkgdir}/usr/share/i2pd"
    cp -dr --no-preserve='ownership' i2pd/contrib/certificates "${pkgdir}/usr/share/i2pd"
    
    # systemd
    install -D -m644 i2pd/contrib/i2pd.service -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m644 i2pd.sysusers "${pkgdir}/usr/lib/sysusers.d/i2pd.conf"
    install -D -m644 i2pd.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/i2pd.conf"
    
    # logrotate
    install -D -m644 i2pd/contrib/i2pd.logrotate "${pkgdir}/etc/logrotate.d/i2pd"
    
    # tunnels.d examples
    install -D -m644 i2pd/contrib/tunnels.d/{*.conf,README} -t "${pkgdir}/usr/share/doc/i2pd/tunnels.d"
    
    # headers
    install -D -m644 i2pd/{i18n,libi2pd{,_client}}/*.h -t "${pkgdir}/usr/include/i2pd"
    
    # man page
    install -D -m644 i2pd/debian/i2pd.1 -t "${pkgdir}/usr/share/man/man1"
    
    # license
    install -D -m644 i2pd/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
