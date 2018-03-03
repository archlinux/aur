# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=openvpn-xor-git
_pkgname=openvpn
pkgver=2.4.5
pkgrel=1
pkgdesc='OpenVPN with XOR patch to bypass DPI monitoring in places like China (also known as OpenVPN stealth/scramble mode)'
arch=('x86_64')
url='https://github.com/openvpn/openvpn'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa' 'pam' 'qopenvpn')
makedepends=('git' 'systemd')
conflicts=('openvpn' 'openvpn-dev' 'openvpn-git' 'openvpn-xor-patched')
provides=('openvpn=2.4.5' 'openvpn-dev')
license=('custom')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
	    # "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/02-tunnelblick-openvpn_xorpatch-a.diff"
	    # "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/03-tunnelblick-openvpn_xorpatch-b.diff"
	    # "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/04-tunnelblick-openvpn_xorpatch-c.diff"
	    # "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/05-tunnelblick-openvpn_xorpatch-d.diff"
	    # "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/06-tunnelblick-openvpn_xorpatch-e.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.4/patches/02-tunnelblick-openvpn_xorpatch-a.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.4/patches/03-tunnelblick-openvpn_xorpatch-b.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.4/patches/04-tunnelblick-openvpn_xorpatch-c.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.4/patches/05-tunnelblick-openvpn_xorpatch-d.diff"
	    "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.4/patches/06-tunnelblick-openvpn_xorpatch-e.diff"
        "openvpn-xor-watermark.diff"
        "systemd.diff")
sha256sums=('ed6390d3dbb540deb40e48d6e1bb5a0912e19314de7f129b998e7e76dff1cc58'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            '3eb01176fff1d3b450b15f280a536323fc5161f3cfa0ee5fcccadeacc7ad97c9'
            '6e1d0147076ce0221e4e22e0a10d70c17eaa3740fe21461aff931c107416564f')

prepare() {
    cd "${_pkgname}-${pkgver}"/

    # patch systemd
    git apply "${startdir}/systemd.diff"

    # apply Tunnelblick patches to the source
    git apply "${startdir}/02-tunnelblick-openvpn_xorpatch-a.diff"
    git apply "${startdir}/03-tunnelblick-openvpn_xorpatch-b.diff"
    git apply "${startdir}/04-tunnelblick-openvpn_xorpatch-c.diff"
    git apply "${startdir}/05-tunnelblick-openvpn_xorpatch-d.diff"
    git apply "${startdir}/06-tunnelblick-openvpn_xorpatch-e.diff"

    # apply XOR watermark patch to "brand" binary with XOR signature in version header
    git apply "${startdir}/openvpn-xor-watermark.diff"
}

build() {
    cd "${_pkgname}-${pkgver}"/

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
	cd "${_pkgname}-${pkgver}"/
	make check
}

package() {
    cd "${_pkgname}-${pkgver}"/

    # Install openvpn
    make DESTDIR="${pkgdir}" install

    # Create empty configuration directories
    install -d -m0750 -g 90 "${pkgdir}"/etc/${_pkgname}/{client,server}

    # Install examples
    install -d -m0755 "${pkgdir}"/usr/share/${_pkgname}
    cp -r sample/sample-config-files "${pkgdir}"/usr/share/${_pkgname}/examples

    # Install license
    install -d -m0755 "${pkgdir}"/usr/share/licenses/${_pkgname}/
    ln -sf /usr/share/doc/${_pkgname}/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/${_pkgname}/

    # Install contrib
    for FILE in $(find contrib -type f); do
    	case "$(file --brief --mime-type "${FILE}")" in
    		"text/x-shellscript") install -D -m0755 "${FILE}" "${pkgdir}/usr/share/${_pkgname}/${FILE}" ;;
    		*) install -D -m0644 "${FILE}" "${pkgdir}/usr/share/${_pkgname}/${FILE}" ;;
    	esac
    done

    # enable scheduling priority changes (nice)
    sed -i '14s/$/ CAP_SYS_NICE/' "distro/systemd/${_pkgname}-client@.service"
    sed -i '15s/$/ CAP_SYS_NICE/' "distro/systemd/${_pkgname}-server@.service"

    # Install systemd files
    install -D -m0644 distro/systemd/${_pkgname}-client@.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-client@.service
    install -D -m0644 distro/systemd/${_pkgname}-server@.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-server@.service
}
