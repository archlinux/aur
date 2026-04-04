# Maintainer: peshane <social at peshane dot net>
# Co-maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: milouse <etienne at depar dot is>
pkgname=luniistore
pkgver=4.1.312
pkgrel=2
pkgdesc="Manage your Lunii's My Fabulous Storyteller content or buy new ones"
arch=('x86_64')
url="https://www.lunii.fr"
license=('unknown')
depends=('java-runtime>=8')
options=('!strip' '!emptydirs')
source=("https://storage.googleapis.com/storage.lunii.fr/public/deploy/installers/linux/64bits/lunii-${pkgver}-amd64.deb"
        reload-lunii-udev-rule.hook
        99-lunii.rules
        luniistore-x11-gdk-backend.patch)
sha512sums=('fb8cc1fe2a068157f9c62bde73e2e2d5ee391f5826b2cd6ab87201fe956155b81456d4bea4e8b9b208e4991107184623f018a50c82e7f3133dda1a435dd59ea0'
            '963374af3ddfde7b3dc9e2b3b2767f6642786ec835328397adb1f7f00f3048dbc02900d8a8da299333a41183d189c3974303464273175079929e8139d2831282'
            '454c5dde203fb89bd56600bcc8cbec2fbe390806d4a5e3f6aed55283982951d898a48d99cb621bc00274ddda90ab86fb7d6f44b78a30bd732520fff3e62971f8'
            '8492e00c549efd070f82dbf18cf6b298650afd00176cf5523b7e2c7f45e86e47348611bdf78f269bac6af6ed114d110aa8a8cc624c1d8089c2cb1cf80667e0e6')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    # The application crashes with GDK_BACKEND=wayland, falling back to x11/xwayland
    patch -d "${pkgdir}" --forward --strip=1 --input="${srcdir}/luniistore-x11-gdk-backend.patch"

    install -D -m644 "${pkgdir}/opt/Lunii/runtime/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${pkgdir}/opt/Lunii/runtime/THIRD_PARTY_README" \
            "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_README"
    install -D -m644 "${pkgdir}/opt/Lunii/runtime/ASSEMBLY_EXCEPTION" \
            "${pkgdir}/usr/share/licenses/${pkgname}/ASSEMBLY_EXCEPTION"

    install -D -m644 "${pkgdir}/opt/Lunii/Lunii.desktop" \
            "${pkgdir}/usr/share/applications/Lunii.desktop"

    install -D -m644 99-lunii.rules \
            "${pkgdir}/etc/udev/rules.d/99-lunii.rules"

    install -D -m644 reload-lunii-udev-rule.hook \
            "${pkgdir}/usr/share/libalpm/hooks/reload-lunii-udev-rule.hook"
}
