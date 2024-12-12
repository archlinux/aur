# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Zuf <kontakt.zuf(at)gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=macrofusion
pkgver=0.7.6
pkgrel=1
pkgdesc="GUI to combine photos to get deeper DOF or HDR"
url="https://github.com/da-phil/macrofusion"
depends=(python-cairo python-gobject python-pillow perl-image-exiftool enblend-enfuse hugin libgexiv2)
arch=(any)
source=(https://github.com/da-phil/macrofusion/archive/refs/tags/${pkgver}.tar.gz
        0001-Fix-GUI-bugs.patch
        0002-Gracefully-handle-unsupported-TIFF-in-format-float-o.patch
        0003-Adjust-helper-info.patch
        0004-Make-more-settings-avialable-in-the-GUI-and-fix-some.patch
        0005-Split-Expert-tab-into-2-to-save-display-space.patch
        0006-Forgot-to-provide-some-of-the-tooltips.patch
        0007-Only-apply-contrast-edge-scale-if-checked.patch
        0008-move-x-y-z-postion-to-align-expert-tab.patch
        0009-Remove-usage-of-enfuse-mp-binary.patch
        0010-Remove-commented-code.patch
        0011-Keep-200-pyramidelevel-defaults.patch)
license=(GPL-3.0-only)
sha256sums=('ed84914c682bf9c2243c0c2d55beabade14a4ea7fbf04df5d7e4ad8a518d6077'
            '70a710281a834040a3b5e5b41e108b0408e76296d1c5bb7b7813278c92618c82'
            'e466fce41b53122508359e7f44f28f31e5923f2631e8b40e6502891e689f8d52'
            'a5acb907557231e7f6998219d2a06097e200ec9e6eebe4c9bd798d0bc3387516'
            'e6a19200ef64be2798f72d377d5a816deb98dfec128a1fa66c79cfe74a2a999d'
            'afc6af97959a24514d40243bb11a4b291213742b80cd9092ff48b16129367d70'
            'aa143f68c9d34507a1a5865ff9ccc51f2631553c64c239b5a44936c75ee52434'
            '0a550c1dfcd490e24a83b7f7adaf178ff230dcdc867db541b5b74fc81461cdfb'
            '5624655c6a4daff11cbf689dcad60148ec2a521b406a4aa7d43d24bf8e928cff'
            '163dff4c74a42c2a43a47a5dd97e56b6436d8161eaf7ea2fdb3431b4cd561694'
            '061ba68fd2d16a22cec22dd0c232e536c2b304064931849512bb54f8c43389e3'
            '0de918c008914053586ed461f539eac2361ac34b68034c84bd6e9652766b9ee5')

prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    # Apply patches from git as the latest release is already several years old.
    patch -p1 < "${srcdir}"/0001-Fix-GUI-bugs.patch
    patch -p1 < "${srcdir}"/0002-Gracefully-handle-unsupported-TIFF-in-format-float-o.patch
    patch -p1 < "${srcdir}"/0003-Adjust-helper-info.patch
    patch -p1 < "${srcdir}"/0004-Make-more-settings-avialable-in-the-GUI-and-fix-some.patch
    patch -p1 < "${srcdir}"/0005-Split-Expert-tab-into-2-to-save-display-space.patch
    patch -p1 < "${srcdir}"/0006-Forgot-to-provide-some-of-the-tooltips.patch
    patch -p1 < "${srcdir}"/0007-Only-apply-contrast-edge-scale-if-checked.patch
    patch -p1 < "${srcdir}"/0008-move-x-y-z-postion-to-align-expert-tab.patch
    patch -p1 < "${srcdir}"/0009-Remove-usage-of-enfuse-mp-binary.patch
    patch -p1 < "${srcdir}"/0010-Remove-commented-code.patch
    patch -p1 < "${srcdir}"/0011-Keep-200-pyramidelevel-defaults.patch
}

package() {
    # Installation is a bit tricky. See README and parts of the python script to see
    # where everything should go to. A makefile would have been nice.

    cd "${srcdir}"/${pkgname}-${pkgver}

    # install ui descriptions
    install -dm755 "${pkgdir}"/usr/share/mfusion/ui
    install -Dm644 ui/* "${pkgdir}"/usr/share/mfusion/ui/

    # images have to be split up manually. Irghs...
    install -Dm644 images/logoSplash.png "${pkgdir}"/usr/share/mfusion/images/logoSplash.png
    install -Dm644 images/$pkgname.png   "${pkgdir}"/usr/share/pixmaps/${pkgname}.png

    # actual python script and desktop file
    install -Dm755 ${pkgname}.py "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    # for some languages there is localization available
    for locale in locale/*; do
        install -dm755 "${pkgdir}"/usr/share/${locale}/LC_MESSAGES
        install -Dm644 ${locale}/LC_MESSAGES/* "${pkgdir}"/usr/share/${locale}/LC_MESSAGES/
    done
}
