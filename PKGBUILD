# Maintainer: Shervin Khastoo <me@shervin.org>

pkgname=openvpn-xor-patched
pkgver=2.4.0
pkgrel=1
pkgdesc="OpenVPN obfuscated with xor-patch which can bypass internet censoring"
arch=(i686 x86_64)
url="https://github.com/Tunnelblick/Tunnelblick/tree/master/third_party/sources/openvpn"
depends=('openssl' 'lzo' 'lz4' 'pam' 'libsystemd' 'iproute2' 'pkcs11-helper')
optdepends=('easy-rsa: for easy key management')
conflicts=('openvpn' 'openvpn-dev' 'openvpn-git' 'openvpn-xor-ssgit')
provides=('openvpn=2.4.0' 'openvpn-dev')
license=('custom')
source=("https://github.com/Tunnelblick/Tunnelblick/raw/master/third_party/sources/openvpn/openvpn-${pkgver}/openvpn-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/02-tunnelblick-openvpn_xorpatch-a.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/03-tunnelblick-openvpn_xorpatch-b.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/04-tunnelblick-openvpn_xorpatch-c.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/05-tunnelblick-openvpn_xorpatch-d.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/06-tunnelblick-openvpn_xorpatch-e.diff")
sha256sums=('f21db525b3c03a9bbd0a7ab6d0e4fbaf8902f238bf53b8bc4e04f834e4e7caa4'
            '03c19a5753fac87b79c4cb60d0921ec35ccad717002ba9f868d50e43b1a208c3'
            '9bd2c62cfaab9a3764215c9967674a373fdd74ad9e2105e5d1d3ec5f8f5168ea'
            'd3ab6fd2d1cb16a61919645b170ea2332f5672636d99db4fe08f6f2b71e240d5'
            'f6313600dda91a4df1ed3f6830fbd4c64ca6b36c1121dd44045a8d74ab3acaa6'
            '32e1384dbbefd557dbb11e61518ca1900777dc3ca6642addd70acec96d0a6351')

prepare() {
    cd "openvpn-${pkgver}"/
    
    # Xor Patch
    patch -Np1 -i ../../02-tunnelblick-openvpn_xorpatch-a.diff
    patch -Np1 -i ../../03-tunnelblick-openvpn_xorpatch-b.diff
    patch -Np1 -i ../../04-tunnelblick-openvpn_xorpatch-c.diff
    patch -Np1 -i ../../05-tunnelblick-openvpn_xorpatch-d.diff
    patch -Np1 -i ../../06-tunnelblick-openvpn_xorpatch-e.diff
}

build() {
    cd "openvpn-${pkgver}"/
    
    # Configure
    autoreconf -vi

    CFLAGS="${CFLAGS} -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
        --prefix=/usr \
        --enable-pkcs11 \
        --enable-crypto \
        --enable-ssl \
        --enable-plugins \
        --enable-iproute2 \
        --enable-password-save \
        --enable-systemd \
        --mandir=/usr/share/man \
        --sbindir=/usr/bin
    make
}

package() {
    cd "openvpn-${pkgver}"/

    # Install openvpn
    make DESTDIR=${pkgdir} install
    install -d -m0755 ${pkgdir}/etc/openvpn
    
    # Create empty configuration directories
    install -d -m0750 -g 90 ${pkgdir}/etc/openvpn/{client,server}

    # Install examples
    install -d -m0755 ${pkgdir}/usr/share/openvpn
    cp -r sample/sample-config-files ${pkgdir}/usr/share/openvpn/examples
    find ${pkgdir}/usr/share/openvpn -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr/share/openvpn -type d -exec chmod 755 {} \;

    # Install license
    install -d -m0755 ${pkgdir}/usr/share/licenses/${pkgname}
    ln -sf /usr/share/doc/openvpn/{COPYING,COPYRIGHT.GPL} ${pkgdir}/usr/share/licenses/${pkgname}/

    # Install contrib
    install -d -m0755 ${pkgdir}/usr/share/openvpn/contrib
    cp -r contrib ${pkgdir}/usr/share/openvpn

    # Install systemd unit files
    install -D -m0644 distro/systemd/openvpn-client@.service ${pkgdir}/usr/lib/systemd/system/openvpn-client@.service
    install -D -m0644 distro/systemd/openvpn-server@.service ${pkgdir}/usr/lib/systemd/system/openvpn-server@.service
}

