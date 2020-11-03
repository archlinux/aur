# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: robertfoster
# Contributor: kurych
# Contributor: redfish
# Contributor: DDoSolitary <DDoSolitary@gmail.com>

pkgname=i2pd-git
pkgver=2.34.0.r19.g3907c17c
pkgrel=1
pkgdesc='A full-featured C++ implementation of the I2P router (git version)'
arch=('x86_64')
url='https://i2pd.website/'
license=('BSD')
depends=('boost-libs' 'libminiupnpc.so' 'openssl' 'zlib')
makedepends=('git' 'cmake' 'boost')
provides=('i2pd' 'i2p-router')
conflicts=('i2pd')
backup=('etc/i2pd/i2pd.conf'
        'etc/i2pd/tunnels.conf')
source=('git+https://github.com/PurpleI2P/i2pd.git#branch=openssl'
        '010-i2pd-use-arch-flags-on-tests.patch'
        '020-i2pd-config.patch'
        '030-i2pd-do-not-override-config.patch'
        '040-i2pd-tunnels-d-readme.patch'
        'i2pd.sysusers'
        'i2pd.tmpfiles')
sha256sums=('SKIP'
            '0064503a9124b764d01db862ba3c2ff97bc5961d41359970df2d6ce9842a5ab5'
            '452550678ea5702a6492eb58e8d0452b91dc5d0aaa112cf04542df74a3dc0dfc'
            '45cfc3035c5b5cfc92cfffec1fe7d7efc4fed3229195cdb640ec4a6c405af149'
            'cfcb6b07b67aff3e3af12767f4649d88b9320dc71907b6c01b465e5c138cdaa3'
            '88b2e709228049ba11f37863f87de75ab6cde295104852871384337cfdc906a3'
            'fe8cc2ec83cb5b5c2b2ec8cce9a989e0cb6fd347e00b84e03a17b12efd152fac')

prepare() {
    patch -d i2pd -Np1 -i "${srcdir}/010-i2pd-use-arch-flags-on-tests.patch"
    patch -d i2pd -Np1 -i "${srcdir}/020-i2pd-config.patch"
    patch -d i2pd -Np1 -i "${srcdir}/030-i2pd-do-not-override-config.patch"
    patch -d i2pd -Np1 -i "${srcdir}/040-i2pd-tunnels-d-readme.patch"
}

pkgver() {
    git -C i2pd describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake \
        -B i2pd/build \
        -S i2pd/build \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DWITH_UPNP:BOOL='ON' \
        -DWITH_AESNI:BOOL='OFF' \
        -DWITH_AVX:BOOL='OFF' \
        -Wno-dev
    make -C i2pd/build
}

check() {
    make -C i2pd/tests
}

package() {
    cd i2pd
    
    make -C build DESTDIR="$pkgdir" install
    
    # config
    install -D -m644 contrib/i2pd.conf    -t "${pkgdir}/etc/i2pd"
    install -D -m644 contrib/tunnels.conf -t "${pkgdir}/etc/i2pd"
    install -d -m755 "${pkgdir}/etc/i2pd/tunnels.d"
    
    # certificates
    local _file
    while read -r -d '' _file
    do
        install -D -m644 "$_file" "${pkgdir}/usr/share/i2pd/certificates/${_file#contrib/certificates/}"
    done < <(find contrib/certificates -type f -print0)
    
    # systemd
    install -D -m644 contrib/i2pd.service   -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m644 "${srcdir}/i2pd.sysusers" "${pkgdir}/usr/lib/sysusers.d/i2pd.conf"
    install -D -m644 "${srcdir}/i2pd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/i2pd.conf"
    
    # tunnels.d examples
    install -D -m644 contrib/tunnels.d/README         -t "${pkgdir}/usr/share/doc/i2pd/tunnels.d"
    install -D -m644 contrib/tunnels.d/IRC-Ilita.conf -t "${pkgdir}/usr/share/doc/i2pd/tunnels.d"
    install -D -m644 contrib/tunnels.d/IRC-Irc2P.conf -t "${pkgdir}/usr/share/doc/i2pd/tunnels.d"
    
    # headers
    install -D -m644 libi2pd{,_client}/*.h -t "${pkgdir}/usr/include/i2pd"
    
    # man page
    install -D -m644 debian/i2pd.1 -t "${pkgdir}/usr/share/man/man1"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
