 # Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=openvpn-xor-git
pkgver=2.5.0
pkgrel=2
pkgdesc='OpenVPN with XOR patch to bypass DPI monitoring in places like China (also known as OpenVPN stealth/scramble mode)'
arch=('x86_64')
url='https://github.com/openvpn/openvpn'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa' 'pam' 'qopenvpn')
makedepends=('git' 'systemd')
conflicts=('openvpn' 'openvpn-dev' 'openvpn-git' 'openvpn-xor-patched' 'libressl')
provides=('openvpn=2.5.0' 'openvpn-dev')
license=('custom')
source=("https://github.com/${pkgname%-xor-git}/${pkgname%-xor-git}/archive/v${pkgver}.tar.gz"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/02-tunnelblick-openvpn_xorpatch-a.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/03-tunnelblick-openvpn_xorpatch-b.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/04-tunnelblick-openvpn_xorpatch-c.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/05-tunnelblick-openvpn_xorpatch-d.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/06-tunnelblick-openvpn_xorpatch-e.diff"
        "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/10-route-gateway-dhcp.diff"
        "systemd.diff"
        "openvpn-xor-watermark.diff")
sha256sums=('d9fbeede4b650bfd9bac12384fbae3f90c26c07248d3031df171056c17a7f3a3'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            '6e1d0147076ce0221e4e22e0a10d70c17eaa3740fe21461aff931c107416564f'
            '1232b23c6885588c05c521b3722e45b1d79558e24095a4b6d99729ba83ba481b')
prepare() {
    cd "${pkgname%-xor-git}-${pkgver}"/

    # patch systemd
    git apply "${startdir}/systemd.diff"

    # apply Tunnelblick patches to the source
    git apply "${startdir}/02-tunnelblick-openvpn_xorpatch-a.diff"
    git apply "${startdir}/03-tunnelblick-openvpn_xorpatch-b.diff"
    git apply "${startdir}/04-tunnelblick-openvpn_xorpatch-c.diff"
    git apply "${startdir}/05-tunnelblick-openvpn_xorpatch-d.diff"
    git apply "${startdir}/06-tunnelblick-openvpn_xorpatch-e.diff"
    git apply "${startdir}/10-route-gateway-dhcp.diff"

    # apply XOR watermark patch to "brand" binary with XOR signature in version header
    git apply "${startdir}/openvpn-xor-watermark.diff"
}

build() {
    cd "${pkgname%-xor-git}-${pkgver}"/

    autoreconf -vi

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --enable-iproute2 \
        --enable-pkcs11 \
        --enable-plugins \
        --enable-systemd \
        --enable-x509-alt-username

    make
}

check() {
	cd "${pkgname%-xor-git}-${pkgver}"/
	make check
}

package() {
    cd "${pkgname%-xor-git}-${pkgver}"/

    # Install openvpn
    make DESTDIR="${pkgdir}" install

    # Create empty configuration directories
    install -d -m0750 -g 90 "${pkgdir}"/etc/${pkgname%-xor-git}/{client,server}

    # Install examples
    install -d -m0755 "${pkgdir}"/usr/share/${pkgname%-xor-git}
    cp -r sample/sample-config-files "${pkgdir}"/usr/share/${pkgname%-xor-git}/examples

    # Install license
    install -d -m0755 "${pkgdir}"/usr/share/licenses/${pkgname%-xor-git}/
    ln -sf /usr/share/doc/${pkgname%-xor-git}/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/${pkgname%-xor-git}/

    # Install contrib
    for FILE in $(find contrib -type f); do
    	case "$(file --brief --mime-type "${FILE}")" in
    		"text/x-shellscript") install -D -m0755 "${FILE}" "${pkgdir}/usr/share/${pkgname%-xor-git}/${FILE}" ;;
    		*) install -D -m0644 "${FILE}" "${pkgdir}/usr/share/${pkgname%-xor-git}/${FILE}" ;;
    	esac
    done

    # enable scheduling priority changes (nice)
    sed -i '14s/$/ CAP_SYS_NICE/' "distro/systemd/${pkgname%-xor-git}-client@.service"
    sed -i '15s/$/ CAP_SYS_NICE/' "distro/systemd/${pkgname%-xor-git}-server@.service"

    # Install systemd files
    install -D -m0644 distro/systemd/${pkgname%-xor-git}-client@.service ${pkgdir}/usr/lib/systemd/system/${pkgname%-xor-git}-client@.service
    install -D -m0644 distro/systemd/${pkgname%-xor-git}-server@.service ${pkgdir}/usr/lib/systemd/system/${pkgname%-xor-git}-server@.service
}
