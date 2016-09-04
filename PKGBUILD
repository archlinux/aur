# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor : Martin Wimpress <code@flexion.org>
#
# MATE utilities without screenshot or dictionary utilities
# and with needed schema file extracted from mate-desktop package
#
# notes: if mate-disk-usage-analyzer context-menu Open Folder command gives 
#        "There is no installed viewer capable of displaying the folder" error,
#        run "xdg-mime default exo-file-manager.desktop inode/directory"

pkgname=mate-utils-xfce
_pkgname=mate-utils
_ver=1.15
pkgver=${_ver}.1
pkgrel=1
pkgdesc="MATE utilities slimmed down for Xfce (GTK2 version). Includes Disk Usage Analyzer, Log File Viewer, and Search Tool."
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk2' 'libcanberra' 'libgtop' 'libsm' 'zlib')
makedepends=('mate-common>=1.15.0' 'rarian' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
provides=('mate-utils')
conflicts=('mate-utils' 'mate-utils-gtk3' 'mate-desktop')
replaces=('mate-utils')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgname}-${pkgver}.tar.xz"
        'mate-disk-usage-analyzer.desktop'
        'mate-search-tool.desktop'
        'mate-system-log.desktop'
        'org.mate.interface.gschema.xml')
sha1sums=('93f68f74aeaeb149f44150b4cce328ea55836584'
          '7ee8b6a8cd63bac617f2d3cd94479957ee553f18'
          'b37683262a64388678b319a83695f72115823729'
          '70a3a8161481e0708f7535d5a0bfd3f7a1b74db6'
          '982acc43e8590bcc214810214a36122798fbfc42')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=2.0 \
        --sysconfdir=/etc \
        --enable-deprecated \
        --disable-maintainer-flags \
        --disable-static \
        --enable-gdict-applet=no --enable-ipv6=no
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    # remove mate-dictionary and mate-screenshot files and directories as Xfce provides native utilities
    find ${pkgdir} -name '*dict*' | xargs rm -frv
    find ${pkgdir} -name '*screenshot*' | xargs rm -frv
    find ${pkgdir} -type d -empty -print -delete | xargs echo removed
    # add desktop files with StartupNotify=false and MATE specific settings removed
    rm ${pkgdir}/usr/share/applications/*.desktop
    install -Dm755 "${srcdir}/mate-disk-usage-analyzer.desktop" "${pkgdir}/usr/share/applications/mate-disk-usage-analyzer.desktop"
    install -Dm755 "${srcdir}/mate-search-tool.desktop" "${pkgdir}/usr/share/applications/mate-search-tool.desktop"
    install -Dm755 "${srcdir}/mate-system-log.desktop" "${pkgdir}/usr/share/applications/mate-system-log.desktop"
    # copy needed MATE schema file
    install -Dm644 "${srcdir}/org.mate.interface.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/org.mate.interface.gschema.xml"
}
