# Maintainer: Zach Hoffman <zrhoffman@apache.org>
pkgname=f5vpn
pkgver=7243.2023.0720.1
pkgrel=4
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM'
arch=('x86_64')
mirror=connect.healthsystem.virginia.edu
source=('LICENSE'
        'no-desktop-file-dbus.patch')
source_x86_64=("linux_${pkgname}-${pkgver}-${pkgrel}.${CARCH}.rpm::https://${mirror}/public/download/linux_${pkgname}.${CARCH}.rpm")
b2sums_x86_64=('ac4c8f0538773d8e9e363eba8c226078af6cb92cc546748cdb81a3e9bd38c50cc4fc65b7e2bdb9c742eef0d61d36e4a65077751b65eadf6abb0f8d822447893a')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c'
'5be3f5ebd0358e022c85081b45bc23b1e847542ae9035bece95c40fa5113a1fd9159ced013950d237206c2e6be94caa38b9d6414ea29ab65cd80043a2dfbfe5a')
sha512sums_x86_64=('ce3b65b12e9721c5acd6b97ff271b58e3769a31df1d9c9dc0c846c29a390a19f901792660595b4898d39f5d00f477dc2e3dc2d92a9dff0211999a3f5f5d4aa48')
sha512sums=('f2ca5fd5052b307c147ac315eb0cda45a6eaf071de30eef6841c74dac239c2d3bc5a0e1513e4bbd5b3057384676b346428609cb366c3d1086acda982acde7a61'
'51ee6ca353685de98b5e87bf44de9605006190cc56ae4612c39f9f4e8b22d89b5bfab6cba09b740bb799fa74ce3a8054c533f807473b13c2c4da3683da4fef4c')
depends=('icu>=73.2-2' openssl qt5-base 'qt5-webkit>=5.212.0alpha4-20')
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
