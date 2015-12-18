# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor : Martin Wimpress <code@flexion.org>
#
# MATE utilities without screenshot or dictionary utilities
# and with needed schema files pulled from mate-desktop package
#
# note: if mate-disk-usage-analyzer's context-menu "Open Folder" isn't working, make sure you have
#       "inode/directory=exo-file-manager.desktop;" in ~/.local/share/applications/mimeapps.list

pkgname=mate-utils-xfce
_pkgname=mate-utils
pkgver=1.12.0
_pkgver=1.12
pkgrel=1
_pkgverd=1.12.1
_pkgreld=1
#_repo="https://mirrors.kernel.org/archlinux/community/os/"
_repo="http://mirror.rackspace.com/archlinux/community/os/"
pkgdesc="MATE utilities slimmed down for Xfce (GTK2 version). Includes Disk Usage Analyzer, Log File Viewer, and Search Tool."
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk2' 'libcanberra' 'libgtop' 'libsm' 'zlib' 'xdg-utils')
makedepends=('mate-common' 'rarian' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
provides=($_pkgname)
conflicts=('mate-utils' 'mate-utils-gtk3' 'mate-desktop')
replaces=($_pkgname)
source=("http://pub.mate-desktop.org/releases/${_pkgver}/${_pkgname}-${pkgver}.tar.xz"
        'mate-disk-usage-analyzer.desktop'
        'mate-search-tool.desktop'
        'mate-system-log.desktop'
        '001-disk-analyzer-default-app-xdg-open.patch')
sha1sums=('577692e34fee8e79f59804bf314c5375a8482af1'
          '7ee8b6a8cd63bac617f2d3cd94479957ee553f18'
          'b37683262a64388678b319a83695f72115823729'
          '70a3a8161481e0708f7535d5a0bfd3f7a1b74db6'
          '88c2ff061898b81477a0187a3b2e847766985b17')

source_i686=("${_repo}/i686/mate-desktop-${_pkgverd}-${_pkgreld}-i686.pkg.tar.xz"{,.sig})
sha1sums_i686=('SKIP' 'SKIP')

source_x86_64=("${_repo}/x86_64/mate-desktop-${_pkgverd}-${_pkgreld}-x86_64.pkg.tar.xz"{,.sig})
sha1sums_x86_64=('SKIP' 'SKIP')

validpgpkeys=('5E7585ADFF106BFFBBA319DC654B877A0864983E') # Martin Wimpress (http://www.flexion.org) <martin@flexion.org>
install=$pkgname.install

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # add xdg-open because g_app_info_get_default_for_type can't return the right GAppInfo when it's called from Xfce
  patch -Np1 -i ../001-disk-analyzer-default-app-xdg-open.patch
}

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
    # copy needed MATE schema files
    install -Dm644 "${srcdir}/usr/share/glib-2.0/schemas/org.mate.interface.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/org.mate.interface.gschema.xml"
}
