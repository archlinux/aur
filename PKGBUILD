# Maintainer: Shervin Khastoo <me@shervin.org>

pkgname=openvpn-xor-patched
pkgver=2.4.2
pkgrel=1
pkgdesc="OpenVPN obfuscated with xor-patch which can bypass internet censoring"
arch=(i686 x86_64)
url="https://github.com/Tunnelblick/Tunnelblick/tree/master/third_party/sources/openvpn"
depends=('openssl' 'lzo' 'lz4' 'pam' 'libsystemd' 'iproute2' 'pkcs11-helper')
optdepends=('easy-rsa: for easy key management')
conflicts=('openvpn' 'openvpn-dev' 'openvpn-git' 'openvpn-xor-ssgit')
provides=("openvpn=${pkgver}" 'openvpn-dev')
license=('custom')
source=("https://github.com/Tunnelblick/Tunnelblick/raw/master/third_party/sources/openvpn/openvpn-${pkgver}/openvpn-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/02-tunnelblick-openvpn_xorpatch-a.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/03-tunnelblick-openvpn_xorpatch-b.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/04-tunnelblick-openvpn_xorpatch-c.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/05-tunnelblick-openvpn_xorpatch-d.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/06-tunnelblick-openvpn_xorpatch-e.diff"
        "systemd-patch.diff"
        "openssl-1-1-0.patch")
sha256sums=('b24740c9d44a81eaf2befc4846d51445a520104321e32aaf0c135ed2e098a624'
            '24e4d6d828f3b3296cc36d16c39d5bced62fab3db4226ad71e9f598ad4441993'
            '96f755428f3ead19d0caba0098c8f9ab70cc380e9f63e5e4b705325f404f40a4'
            'e6ee5518600fca5529dca57b4e752c0f69f98330805492f0c58869c819fd3e5a'
            'e893bf611575d3ff749a00c5b9201d534ea1691b9c0540f15728705992780098'
            '47b3100206b7164d7b4a1f2cce8646cd2ec6f1a62ec5902ad659df1f5e89752f'
            '6d341005060488af7f4961262819a9fbfe5fbe59ac0d31de4368074a506d9dec'
            'd801b1118d64c0667eae87ab1da920179f339614da22c5c8bed75d17650fad03')

prepare() {
    cd "openvpn-${pkgver}"/
    
    # Xor Patch
    patch -Np1 -i ../02-tunnelblick-openvpn_xorpatch-a.diff
    patch -Np1 -i ../03-tunnelblick-openvpn_xorpatch-b.diff
    patch -Np1 -i ../04-tunnelblick-openvpn_xorpatch-c.diff
    patch -Np1 -i ../05-tunnelblick-openvpn_xorpatch-d.diff
    patch -Np1 -i ../06-tunnelblick-openvpn_xorpatch-e.diff
    patch -Np1 -i ../systemd-patch.diff
    patch -Np1 -i ../openssl-1-1-0.patch
}

build() {
    cd "openvpn-${pkgver}"/
    
    # Configure
    autoreconf -vi

    ./configure \
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

