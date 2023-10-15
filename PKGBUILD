# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=lightdm-arctica-greeter
pkgver=0.99.3.0
pkgrel=1
pkgdesc="The greeter (login screen) application for Arctica. It is implemented as a LightDM greeter."
arch=(i686 x86_64)
url="https://github.com/ArcticaProject/arctica-greeter/"
license=(GPL3 LGPL3)
groups=(unity)
depends=(cantarell-fonts ayatana-ido libayatana-indicator lightdm
         libcanberra libxext python python-gobject)
makedepends=(mate-common mate-settings-daemon marco imagemagick
             intltool librsvg vala libpam-x2go libpam-freerdp2)
optdepends=("mate-themes: mate themes")
source=("https://github.com/ArcticaProject/arctica-greeter/archive/"$pkgver".tar.gz"
        50-arctica-greeter.rules)
sha512sums=('85b39ae155de1e17c5f000be46161e469ba7825542bba77e06200fc78bd294a01f737eedf0269718cb04df775cdeccd7adfaca492493d105c127d13f6e436cf8'
            '5d0f1b8221dfe02670df3ba88011dc0ce744bfd4205a9900dd8096de222358a740a384a47f13ed4e5b94e24d4a8ff5639117464c61a689dd7bd9025a0900f529')

build() {
    cd "arctica-greeter-${pkgver}"

    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/lightdm

    make
}

package() {
    cd "arctica-greeter-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Install PolicyKit file for allowing the lightdm user to use NetworkManager
    # Note: PolicyKit no longer reads pkla files after version 0.107, so Ubuntu's
    # policy file won't work.
    install -dm750 "${pkgdir}/usr/share/polkit-1/rules.d/"
    install -m644 "${srcdir}/50-arctica-greeter.rules" \
        "${pkgdir}/usr/share/polkit-1/rules.d/"

    # Install LightDM configuration file to set the Unity greeter as the default
    install -dm755 "${pkgdir}/usr/share/lightdm/lightdm.conf.d/"
    install -m644 debian/90-arctica-greeter.conf \
                  "${pkgdir}/usr/share/lightdm/lightdm.conf.d/"

    # Use language packs
    rm -r "${pkgdir}/usr/share/locale/"
}
