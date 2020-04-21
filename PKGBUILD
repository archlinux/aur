# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=lightdm-arctica-greeter
pkgver=0.99.1.4
pkgrel=1
pkgdesc="The greeter (login screen) application for Arctica. It is implemented as a LightDM greeter."
arch=(i686 x86_64)
url="https://github.com/ArcticaProject/arctica-greeter/"
license=(GPL3 LGPL3)
groups=(unity)
depends=(cantarell-fonts ayatana-ido libayatana-indicator-gtk3 lightdm
         libcanberra libxext python)
makedepends=(mate-common mate-settings-daemon marco imagemagick
             intltool librsvg vala libpam-x2go libpam-freerdp2)
optdepends=("mate-themes: mate themes")
source=("https://github.com/ArcticaProject/arctica-greeter/archive/"$pkgver".tar.gz"
        50-arctica-greeter.rules)
sha512sums=('a79a13a7ef68c827f4ca5a3af4085e3c5185c15654d1c319e8d54bc2a91ba031d84022e37872c468e4b9122a87ea9c979e0f6ba3eec9da06f80b77c844108e77'
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
