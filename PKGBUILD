# Maintainer: Zach Hoffman <zrhoffman@apache.org>
pkgname=f5vpn
pkgver=7242.2023.0427.1
pkgrel=2
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM'
arch=('x86_64')
mirror=huskyonnet-ns.uw.edu
source=('LICENSE'
        'no-desktop-file-dbus.patch')
source_x86_64=("linux_${pkgname}-${pkgver}-${pkgrel}.${CARCH}.rpm::https://${mirror}/public/download/linux_${pkgname}.${CARCH}.rpm")
b2sums_x86_64=('9978e7c94d9c22d8183589a31a701cbb7b48e7802ed3b23cb1ee39abfe28282c1767579e5eff5f561e30efc39d80b1a95e1e970d849874253b84c4838891dadd')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c'
'5be3f5ebd0358e022c85081b45bc23b1e847542ae9035bece95c40fa5113a1fd9159ced013950d237206c2e6be94caa38b9d6414ea29ab65cd80043a2dfbfe5a')
sha512sums_x86_64=('3dbd254cd603f86f81e6ae9ceec205caf75dba2132725b4139bc9215161a65dae2e5130df2f6029698aa1eaa4c6734c66c3207a827da58a212e90194c6b948ae')
sha512sums=('f2ca5fd5052b307c147ac315eb0cda45a6eaf071de30eef6841c74dac239c2d3bc5a0e1513e4bbd5b3057384676b346428609cb366c3d1086acda982acde7a61'
'51ee6ca353685de98b5e87bf44de9605006190cc56ae4612c39f9f4e8b22d89b5bfab6cba09b740bb799fa74ce3a8054c533f807473b13c2c4da3683da4fef4c')
depends=(icu openssl qt5-base qt5-webkit)
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
