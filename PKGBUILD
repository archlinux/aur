# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Martin Wimpress <code@flexion.org>
#
# MATE utilities without screenshot or dictionary utilities
# and with needed schema file copied from mate-desktop-schemas package
#
# notes: if mate-disk-usage-analyzer context-menu Open Folder command gives 
#        "There is no installed viewer capable of displaying the folder" error,
#        run "xdg-mime default exo-file-manager.desktop inode/directory"

pkgname=mate-utils-xfce
_pkgname=mate-utils
_ver=1.16
pkgver=${_ver}.0
pkgrel=2
pkgdesc="MATE utilities slimmed down for Xfce (GTK2 version). Includes Disk Usage Analyzer, Log File Viewer, and Search Tool."
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'libcanberra' 'libgtop' 'libsm')
makedepends=('intltool' 'itstool' 'mate-desktop-schemas')
provides=('mate-utils')
conflicts=('mate-utils' 'mate-utils-gtk3' 'mate-desktop-schemas')
replaces=('mate-utils')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgname}-${pkgver}.tar.xz"
        'mate-disk-usage-analyzer.desktop'
        'mate-search-tool.desktop'
        'mate-system-log.desktop')
sha1sums=('8435a42773bd2f5fcf27e2e6e71373fbf216eef9'
          '7ee8b6a8cd63bac617f2d3cd94479957ee553f18'
          'b37683262a64388678b319a83695f72115823729'
          '70a3a8161481e0708f7535d5a0bfd3f7a1b74db6')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=2.0 \
        --sysconfdir=/etc \
        --disable-maintainer-flags \
        --enable-gdict-applet=no --enable-ipv6=no

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

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
    # install needed MATE schema file from mate-desktop-schemas package
    install -Dm644 "/usr/share/glib-2.0/schemas/org.mate.interface.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/org.mate.interface.gschema.xml"
}
