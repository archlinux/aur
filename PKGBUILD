# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5vpn
pkgver=7198.2021.0120.1
pkgrel=1
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM 16.0'
arch=('x86_64')
source=('LICENSE'
        'no-desktop-file-dbus.patch')
# Hashes match linux_f5vpn.x86_64.rpm from APM Clients version 7.2.1 (apmclients-7210.2020.827.422-5307.0.iso) from downloads.f5.com
source_x86_64=("linux_${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm::https://dept-huskyonnet-ns.uw.edu/public/download/linux_${pkgname}.x86_64.rpm")
sha256sums=('a8f4b5d965dc0279dd5173109892251ce5d107d9912836e6d83a9b6896eb19a1'
            '3ecd8a10941a7d81b9d16aecdf6ac9caa1f957e32a2d2c65bde5181abd1fcb73')
sha256sums_x86_64=('d83dd7dc06f9bf1136b03987a2d525cf20c66f13465b6adad66bcd4f1a3e8eed')
b2sums=('7a5866d947d40a1c993795f96f87ba94cdefa572fc5524848316792b602bdfd1ad50c639f33b1e72dd97e739c7f7312a8f2efd086aab9be4b5fe4f0790ba37a5'
         '5be3f5ebd0358e022c85081b45bc23b1e847542ae9035bece95c40fa5113a1fd9159ced013950d237206c2e6be94caa38b9d6414ea29ab65cd80043a2dfbfe5a')
b2sums_x86_64=('15b686433f9e33b74062e68062cf4ed6d0296e673a5421ff1e8968232e3ddfd8c5464edc3b685a8ed212e28c5d26d06987344aa9208b47c15256d88ed314194a')
depends=(icu openssl qt5-base qt5-webkit)
url='https://support.f5.com/csp/article/K32311645#link_04_05'
license=('commercial')

package() {
    (
    cd "${srcdir}/opt/f5/vpn"

    patch -i "${srcdir}/no-desktop-file-dbus.patch" # Desktop file does not work with Dbus enabled

    chmod u+s svpn # f5vpn should not be run as root, but it calls svpn which must be run as root
    install -Dm644 "com.f5.${pkgname}.desktop" "${pkgdir}/usr/share/applications/com.f5.${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid
    for executable in $pkgname svpn tunnelserver; do
        ln -s "/opt/f5/vpn/${executable}" "${pkgdir}"/usr/bin/${executable}
    done

    # Use system Qt libraries
    for library in lib/*.so.*; do
        ln -sf "/usr/${library%%.so.*}.so" "$library"
    done

    # Use system Qt libraries
    for plugin in platforms/*.so; do
        ln -sf "/usr/lib/qt/plugins/${plugin}" "$plugin"
    done

    for resolution in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "logos/${resolution}x${resolution}.png" \
                        "${pkgdir}/usr/share/icons/hicolor/${resolution}x${resolution}/apps/${pkgname}.png"
    done
    )
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a opt "${pkgdir}"

}
