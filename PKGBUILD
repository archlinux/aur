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
pkgrel=2
license=('GPL')
arch=('i686' 'x86_64')
pkgdesc="DVB demux tool for repairing and analyzing different stream types"
makedepends=('make')
depends=('java-runtime' 'java-environment' 'bash')
url="http://sourceforge.net/projects/project-x"
source=(http://downloads.sourceforge.net/project/project-x/project-x/ProjectX_0.91.0.00/ProjectX_0.91.0.zip
	http://gentoo.sbriesen.de/distfiles/projectx-idctfast.tar.xz 
        IDCTFast.patch
	projectx)

md5sums=('5cf7bb227abe2c16d34e8e9c84915291'
         '0f09819b08e6105ed6c1e4705794e9c1'
         '5f3ceff20dd1489309465332b821b5e9'
         'b92f5dc14576459119769c245690b8b0')


build() {
    if [ -f /etc/profile.d/openjdk6.sh ];
    then
        source /etc/profile.d/openjdk6.sh
    elif [ -f /etc/profile.d/jdk.sh ];
    then
        source /etc/profile.d/jdk.sh
    fi

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
