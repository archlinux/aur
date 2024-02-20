# Maintainer: Zach Hoffman <zrhoffman@apache.org>
pkgname=f5vpn
pkgver=7246.2024.0201.1
pkgrel=1
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM'
arch=('x86_64')
mirror=vpn.univie.ac.at
source=('LICENSE'
        'no-desktop-file-dbus.patch')
source_x86_64=("linux_${pkgname}-${pkgver}-${pkgrel}.${CARCH}.rpm::https://${mirror}/public/download/linux_${pkgname}.${CARCH}.rpm")
b2sums_x86_64=('af50a692b28fba6fbfb47c69d7de418b876b6ae96736ceaa7c7b794034e9676d900c4d3d89c44c8baee9a51687b21f7052c6818f7a7eae9622fe7cd1c0b5e921')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c'
'5be3f5ebd0358e022c85081b45bc23b1e847542ae9035bece95c40fa5113a1fd9159ced013950d237206c2e6be94caa38b9d6414ea29ab65cd80043a2dfbfe5a')
sha512sums_x86_64=('e12a05c888aa26757fa06d7c6a42dc0a5ebb0b40f75a1c28cc5120a60707e94856f1fc08e46320c187e23168a38a84ba6a1556aed2267c3e3238135cefde9ed0')
sha512sums=('f2ca5fd5052b307c147ac315eb0cda45a6eaf071de30eef6841c74dac239c2d3bc5a0e1513e4bbd5b3057384676b346428609cb366c3d1086acda982acde7a61'
'51ee6ca353685de98b5e87bf44de9605006190cc56ae4612c39f9f4e8b22d89b5bfab6cba09b740bb799fa74ce3a8054c533f807473b13c2c4da3683da4fef4c')
depends=('icu>=73.2-2' openssl qt5-base 'qt5-webkit>=5.212.0alpha4-22')
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
