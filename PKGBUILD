# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=dooble
pkgver=1.53
pkgrel=1
pkgdesc='A safe WebKit Web browser'
url='http://dooble.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('libpng' 'qt5-base' 'qt5-webkit' 'openssl' 'libspoton=2015.06.17' "dooble-common=${pkgver}")
makedepends=('libpng' 'qt5-base' 'qt5-webkit' 'openssl' 'qt5-tools' 'sed' 'coreutils')
source=("dooble-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/dooble/Version%20${pkgver}/Dooble_Source.d.tar.gz?r=")
sha256sums=('9764eba0471227fdf48121879ec6cb62073f7460f8249d776762b6394713abe3')

# Dependency (from ldd output) tree:
# libpng
# qt5-base
#   icu
#     gcc-libs
#   libjpeg-turbo
#   sqlite
#   mesa-libgl
#     mesa
#       libdrm
#       libxdamage
#       libxxf86vm
#   libxrender
# qt5-webkit
#   libxcomposite
#     libxfixes
#       libx11
#         libxcb
#           libxdmcp & libxau
#             glibc
#       libxext
#   libxslt
#     libgcrypt
#       libgpg-error
#     libxml2
#       xz
#       zlib
#   qt5-sensors & qt5-location
#     qt5-declarative
#   gstreamer0.10-base
#     gstreamer0.10
#       glib2
#         libffi
#         pcre
#     orc
# openssl



build()
{
    cd "$srcdir/dooble.d/Version 1.x/"
    sed -i 's_-Werror__g' dooble.qt5.pro
    sed -i 's_-lspoton_-lspoton -lQt5PrintSupport_g' dooble.qt5.pro
    qmake-qt5 -o Makefile dooble.qt5.pro
    make distclean
    qmake-qt5 -o Makefile dooble.qt5.pro
    sed -i '/^INCPATH/s:=:= -I/usr/include/qt/QtWidgets:' Makefile
    sed -i '/^INCPATH/s:=:= -I/usr/include/qt/QtWebKitWidgets:' Makefile
    sed -i '/^INCPATH/s:=:= -I/usr/include/qt/QtPrintSupport:' Makefile
    sed -i '/#include/s:QtGui/\([^>]*\)QAction:\1:' Include/*.h
    make
}

package()
{
    cd "$srcdir/dooble.d/Version 1.x/"
    install -Dm755  Dooble         -- "${pkgdir}/usr/lib/${pkgname}/Dooble"
    install -Dm755  dooble.sh      -- "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644  dooble.desktop -- "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    
    msg "Editing files for the file system adaption"
    
    sed -i s_"/usr/local/dooble/"_"/usr/lib/${pkgname}/"_g -- "${pkgdir}/usr/bin/${pkgname}"
    sed -i s_"/usr/local/dooble"_"/usr/share/dooble"_g     -- "${pkgdir}/usr/bin/${pkgname}"
    sed -i s_"\./Dooble"_"../../lib/${pkgname}/Dooble"_g   -- "${pkgdir}/usr/bin/${pkgname}"
    sed -i /LD_LIBRARY_PATH/d                              -- "${pkgdir}/usr/bin/${pkgname}"
    
    sed -i s_'/usr/local/dooble/Lib\x00'_'/usr/lib\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'_g  \
	-- "${pkgdir}/usr/lib/${pkgname}/Dooble" # The replacements's length must match the pattern's length
    
    sed -i s_'/usr/local/dooble/dooble.sh'_"/usr/bin/${pkgname}"_g  \
	-- "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

