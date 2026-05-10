# Maintainer: Dan Fuhry <dan@fuhry.com>
# Contributor: Daniel Tobias <https://aur.archlinux.org/account/dantob>
pkgname=megalogviewer
pkgver=4.5.22
# EFI Analytics has a tendency to push minor updates bare jar files, zip files
# with field mappings and properties files, and # let the distribution tarball
# lag behind.
_dist_version=4.5.05
_fieldmaps_version=4.5.10
_properties_version=4.5.18
pkgrel=1
pkgdesc="Viewer for TunerStudio/MegaSquirt logs"
arch=(any)
depends=(java-runtime)
makedepends=('imagemagick>=7')
license=(proprietary)
source=(https://www.tunerstudio.com/downloads2/MegaLogViewerHD_v${_dist_version}.tar.gz
        https://www.tunerstudio.com/appupdates/MegaLogViewer/MegaLogViewer_v${pkgver}.jar
        https://www.tunerstudio.com/appupdates/MegaLogViewer/FieldMaps_v${_fieldmaps_version}_HD.zip
        https://www.tunerstudio.com/appupdates/MegaLogViewer/MegaLogViewer_v${_properties_version}.jar
        megalogviewer.sh
        megalogviewer.desktop
        )
sha256sums=('99e8e8df9465d1ed89d8593d518955e72eff9f1c3ee5fae62ef9ef9abd89d034'
            '08628cd58008b7abbad4f28cb7bc51aabfcf41bc582d9901b45a6873403c701c'
            '0f55ac67458cf0a2f3eaaea24a28467ed12008b3aa6f9d92ccd81cf25a3ab95b'
            'fde12a0669c4297ba22d1809a522b6c6f2d5906072d702a226ef95b6875420e4'
            'eff5b0c79e345d1b77b80908deba8805959a878e990601e91ac69a01b8582a5c'
            '6c6238646f60a076ebe0549228b59d7d9f20bc7019a0e7d8b5df2089ba50a396')
noextract=("MegaLogViewer_v${pkgver}.jar"
           "FieldMaps_v${_fieldmaps_version}_HD.zip")

build()
{
    # extract all sizes of the windows .ico file as PNGs
    magick "${srcdir}/MegaLogViewerHD/MegaLogViewer.ico" -alpha set "${srcdir}/MegaLogViewerHD/megalogviewer.png"

    # Distribution tarballs have all files as 0700. Reset permissions
    # to something more sensible.
    # Note that capital "X" doesn't unset the executable bit on regular
    # files, even with "=".
    find "${srcdir}/MegaLogViewerHD" -type f -print0 | xargs -0 chmod a-x
    chmod -R u=rwX,go=rX "${srcdir}/MegaLogViewerHD"
    chmod a+x "${srcdir}/MegaLogViewerHD/MegaLogViewer.sh"
}

package()
{
    for icon in ${srcdir}/MegaLogViewerHD/megalogviewer-*.png; do
        size=$(identify -format '%wx%h' "${icon}")
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
        dest="${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
        test -f "$dest" || install -m644 "$icon" "$dest"
        rm -f "$icon"
    done

    mkdir -p "${pkgdir}/usr/lib"
    cp -a "${srcdir}/MegaLogViewerHD" "${pkgdir}/usr/lib/megalogviewer"
    chmod 0755 "${pkgdir}/usr/lib/megalogviewer"

    # The filename "HogLogViewer.jar" is correct.
    install -m0644 "${srcdir}/MegaLogViewer_v${pkgver}.jar" "${pkgdir}/usr/lib/megalogviewer/HogLogViewer.jar"

    unzip -d "${pkgdir}/usr/lib/megalogviewer" "${srcdir}/FieldMaps_v${_fieldmaps_version}_HD.zip"

    mkdir -p "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/megalogviewer.sh" "${pkgdir}/usr/bin/megalogviewer"

    mkdir -p "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/megalogviewer.desktop" "${pkgdir}/usr/share/applications/megalogviewer.desktop"
}

# vim: set sts=4 sw=4 et:
