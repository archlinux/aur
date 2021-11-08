# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5vpn
pkgver=7214.2021.0915.1
pkgrel=1
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM 16.0'
arch=('x86_64')
source=('LICENSE'
        'no-desktop-file-dbus.patch')
source_x86_64=("linux_${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm::https://vpn.f5.com/public/download/linux_${pkgname}.x86_64.rpm")
sha512sums=('8eb670337568d49fa38f4888826db827e6460079f35a81e30f430bfc11df43562c3a4095980266e6ed9372467e3655bd0d699d7618b4798a7f1b25a835983073'
            '51ee6ca353685de98b5e87bf44de9605006190cc56ae4612c39f9f4e8b22d89b5bfab6cba09b740bb799fa74ce3a8054c533f807473b13c2c4da3683da4fef4c')
b2sums=('7a5866d947d40a1c993795f96f87ba94cdefa572fc5524848316792b602bdfd1ad50c639f33b1e72dd97e739c7f7312a8f2efd086aab9be4b5fe4f0790ba37a5'
         '5be3f5ebd0358e022c85081b45bc23b1e847542ae9035bece95c40fa5113a1fd9159ced013950d237206c2e6be94caa38b9d6414ea29ab65cd80043a2dfbfe5a')
b2sums_x86_64=('d4f173b1fdbd9242cf0fc1d0ba8b14db82065a032b127218ef54492a3a965a1536d2af6fbef006370ad7e5912cc230703f29a5f501b688ff876a02da0ed51086')
sha512sums_x86_64=('aa6f89ddc71262e1020e660f01415bb6811ed78b2b3333a947750d808b36639c5e27be7137890e72205f1cabb86a1b3f81cf662aecec2365836e58f4531e0102')
depends=(icu openssl qt5-base qt5-webkit)
conflicts=('f5fpc<7213.2021.0526.1-2')
provides=("${pkgname}")
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
    for executable in $pkgname tunnelserver; do
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
