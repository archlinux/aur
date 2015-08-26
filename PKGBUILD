# Maintainer: Lara Maia <lara@craft.net.br>
DLAGENTS=('http::/usr/bin/aria2c -j 1 -x 5 -k 2M --async-dns=false --referer="http://www.geeks3d.com/glslhacker/download/" -o %o %u')

pkgname=glslhacker
pkgdesc="A free cross-platform demotool for creating demos. (Compatible with RPi)"
url='http://www.geeks3d.com/glslhacker/'
license="custom"
pkgver=0.8.5.2
pkgrel=3

arch=('x86_64' 'armv6h' 'armv7h');

source=('glsl-loader.sh' 'glslhacker.sh')
md5sums=('847e9fce2e8fba065c13c4926bfa05ed' '62c54fd8be39472f52540825a75c00a0')
source_x86_64=('http://www.ozone3d.net/glslhacker/dl/GLSLHacker_linux64.zip')
md5sums_x86_64=('475e7cddf1cd73f09c3528e11e8781c3')
source_arm=('http://www.ozone3d.net/glslhacker/dl/GLSLHacker_rpi.tar.gz')
md5sums_arm=('e19e3aa2c7f33ceb662d857ec8ad433c')
source_armv6h=${source_arm[@]}
md5sums_armv6h=${md5sums_arm[@]}
source_armv7h=${source_arm[@]}
md5sums_armv7h=${md5sums_arm[@]}

makedepends=('aria2')
test "$CARCH" == "x86_64" && makedepends+=('unzip')


depends=('ffmpeg'
         'python2'
         'fmodex'
         'sdl2'
         'freeimage'
         'anttweakbar')
test "$CARCH" == "armv6h" -o "$CARCH" == "armv7h" && depends+=('raspberrypi-firmware-tools')

package() {
    if test "$CARCH" == "x86_64"
    then
        cd GLSLHacker_FREE_linux
    else
        cd GLSLHacker_RPi
    fi
    install -Dm644 EULA.txt "$pkgdir"/usr/share/licenses/$pkgname/EULA.txt

    install -dm777 "$pkgdir"/opt/$pkgname/
    install -dm755 "$pkgdir"/opt/$pkgname/dylibs
    cp -rf libs/ "$pkgdir"/opt/$pkgname/libs/
    chmod -R 777 "$pkgdir"/opt/$pkgname/libs/
    test "$CARCH" == "x86_64" && \
        install -Dm644 dylibs/libPhys* "$pkgdir"/opt/$pkgname/dylibs/
    install -Dm755 dylibs/libgxl* "$pkgdir"/opt/$pkgname/dylibs/
    install -Dm755 dylibs/plugin* "$pkgdir"/opt/$pkgname/dylibs/
    install -Dm644 init0.xml "$pkgdir"/opt/$pkgname/
    install -Dm644 conf.xml "$pkgdir"/opt/$pkgname/
    if test "$CARCH" == "x86_64"
    then
        install -Dm755 GLSLHacker "$pkgdir"/opt/$pkgname/
    else
        install -Dm755 GLSLHacker_RPi "$pkgdir"/opt/$pkgname/GLSLHacker
    fi
    install -dm755 "$pkgdir"/usr/bin/
    install -Dm755 "$srcdir"/glsl-loader.sh "$pkgdir"/usr/bin/glsl-loader
    install -Dm755 "$srcdir"/glslhacker.sh "$pkgdir"/usr/bin/glslhacker
    chmod 755 "$pkgdir"/usr/bin/glsl-loader
    chmod 755 "$pkgdir"/usr/bin/glslhacker
}
