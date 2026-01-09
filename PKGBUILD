# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Contributer: Sebastian Sareyko <public@nooms.de>
#
# It is possible to choose the idct implementation
# Available are:
# 
# none               use ProjectX Java implementation
# idct-mjpeg         taken from MJPEGTOOLS 1.8.0
# idct-mjpeg-mmx     taken from MJPEGTOOLS 1.8.0
#
_idct=idct-mjpeg-mmx

pkgname=projectx
pkgver=0.91.0.08
pkgrel=5
license=('GPL')
arch=('i686' 'x86_64')
pkgdesc="DVB demux tool for repairing and analyzing different stream types"
makedepends=('make')
depends=('java-runtime<=11' 'java-environment' 'bash')
url="http://sourceforge.net/projects/project-x"
source=(https://downloads.sourceforge.net/project/project-x/project-x/ProjectX_0.91.0.00/ProjectX_0.91.0.zip
	https://ftp.fau.de/gentoo/distfiles/50/projectx-idctfast.tar.xz
        IDCTFast.patch
	projectx)

sha256sums=('8ea38a6a9af5b5c0cf0a17429d85618804323b328a1f922db85e5af91197ad9a'
         'd05b86b05c4924b434a6a9bb443c05d5421f6df7a2b19616a53ef1e4b4dada45'
         '1d14666ebf1200fad3e8d0bb6a5c32d0bc23dee88be8ca4d95eb87fcb736b932'
         '98bc74e72132c07b22bf774784247e8a761edb536bed772b68304adf27034010')


build() {
    cd ${srcdir}
    mv Project-X/lib/PORTABLE Project-X_0.91.0/lib
    mv Project-X/src/net/sourceforge/dvb/projectx/video/IDCTFast.java Project-X_0.91.0/src/net/sourceforge/dvb/projectx/video
    if [ ${_idct} != "none" ]; then
       patch --binary -p0 < IDCTFast.patch
    fi
    cd ${srcdir}/Project-X_0.91.0
    sh ./build.sh
    if [ ${_idct} != "none" ]; then
       cd lib/PORTABLE/
       export JAVA_HOME="/usr/lib/jvm/`archlinux-java get`/"
       make clean
       make PROJECTX_HOME=${srcdir}/Project-X_0.91.0 IDCT=${_idct} CPLAT="$CFLAGS -fPIC"
       cd ${srcdir}/Project-X_0.91.0
    fi
}

package() {
    cd ${srcdir}/Project-X_0.91.0
    install -D -m0755 $srcdir/projectx $pkgdir/usr/bin/projectx
    install -D -m0644 ProjectX.jar $pkgdir/usr/share/java/projectx/ProjectX.jar
    if [ ${_idct} != "none" ]; then
       install -D -m0644 lib/PORTABLE/libidctfast.so \
            $pkgdir/usr/lib/projectx/libidctfast.so
    fi
    install -D -m0644 lib/commons-net-1.3.0.jar \
             $pkgdir/usr/share/java/projectx/lib/commons-net-1.3.0.jar
    install -D -m0644 lib/jakarta-oro-2.0.8.jar \
             $pkgdir/usr/share/java/projectx/lib/jakarta-oro-2.0.8.jar
    sed -i -e 's#Exec=java -jar /usr/share/projectx/ProjectX.jar#Exec=/usr/bin/projectx#' projectx.desktop
    install -D -m0644 projectx.desktop $pkgdir/usr/share/applications/projectx.desktop
}
