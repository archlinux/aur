# Maintainer: yangzhe <2217332562@qq.com>
_appname='vpnclient'
_pkgname='qianxin-vpn-bin'
pkgname="${_pkgname}"
pkgver=1.2.1
pkgrel=1
pkgdesc="奇安信VPN客户端"
arch=('x86_64')
url="https://www.qianxin.com/"
license=('proprietary')
conflicts=("${pkgname}" "${_pkgname}")
depends=(
    'qt5-base'
    'qt5-svg'
    'qt5-multimedia'
    'krb5'
    'openssl'
    'libcurl-compat'
    'libglvnd'
    'glibc'
    'net-tools'
)
backup=('etc/vpn_client/Info.plist')
source=(
    "https://appstore.qianxin.com/file/download/1276"
)
sha256sums=('96c591154e555afaef0f37d227b3a333b5a6181c9b010ed2142ac369ec815609')

prepare() {
    # Downloaded file is a self-extracting archive containing the deb
    # First extract the inner deb from the archive
    if [ -f "${srcdir}/1276" ]; then
        bsdtar -xf "${srcdir}/1276" -C "${srcdir}"
        mv "${srcdir}/vpn-client-amd64-463/vpn-client-amd64-463.deb" "${srcdir}/"
    fi

    # Extract deb package data
    bsdtar -xf "${srcdir}/"*.deb
    bsdtar -xf "${srcdir}/data.tar.xz"
}

package() {
    _libdir="${pkgdir}/usr/lib/${pkgname}"
    _bindir="${_libdir}/sbin"

    # Install library files
    install -Dm755 -d "${_libdir}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/"* "${_libdir}/"

    # Install binary files to /usr/lib/vpn-client/sbin (avoid /usr/sbin conflict)
    install -Dm755 -d "${_bindir}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/sbin/"* "${_bindir}/"

    # Install vpnclient files
    install -Dm755 -d "${_libdir}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/${_appname}/"* "${_libdir}/"

    # Create symlinks for binaries in /usr/bin
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/sbin/vpnservice" "${pkgdir}/usr/bin/vpnservice"
    ln -s "/usr/lib/${pkgname}/sbin/vpncore" "${pkgdir}/usr/bin/vpncore"
    ln -s "/usr/lib/${pkgname}/sbin/sts" "${pkgdir}/usr/bin/sts"
    ln -s "/usr/lib/${pkgname}/sbin/vpn_gui/QianxinVPN" "${pkgdir}/usr/bin/QianxinVPN"

    # Install config file
    install -Dm644 "${srcdir}/etc/vpn_client/Info.plist" "${pkgdir}/etc/vpn_client/Info.plist"

    # Install systemd service
    install -Dm644 <(cat << 'EOF'
[Unit]
Description=Qianxin VPN Client Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/vpnservice
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
    ) "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # Install desktop entry
    install -Dm644 "${_libdir}/vpnclient.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s|Exec=sh /usr/vpnclient/gui_start.sh|Exec=/usr/bin/QianxinVPN|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s|Icon=/usr/vpnclient/vpnclient.png|Icon=/usr/lib/${pkgname}/vpnclient.png|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install ld.so.conf config
    install -Dm644 "${_libdir}/vpn_gui_lib.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}

post_install() {
    ldconfig
    systemctl enable "${pkgname}.service" 2>/dev/null || true
    systemctl start "${pkgname}.service" 2>/dev/null || true
}

post_upgrade() {
    post_install
}

pre_remove() {
    systemctl stop "${pkgname}.service" 2>/dev/null || true
    systemctl disable "${pkgname}.service" 2>/dev/null || true
}

post_remove() {
    rm -f "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
    ldconfig
}
