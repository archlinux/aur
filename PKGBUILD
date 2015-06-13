# Maintainer: Brian Astrup Mikkelsen <brian@mikkelsen.com>
# Maintainer: HER0 01 <aconrad 103 at gmail.com>

pkgname=robocode
pkgver=1.9.2.3
pkgrel=1
pkgdesc="Programming game, where the goal is to develop a robot battle tank to battle against other tanks in Java or .NET. The robot battles are running in real-time and on-screen."
arch=(any)
url=('http://robocode.sourceforge.net')
depends=(java-environment)
license=EPL
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-setup.jar robocode.desktop)
md5sums=('9805c9575b36a8d81a78e2d0b057ed41'
         '8a556209b3ffb39839f28f30479a8c8d')

package(){
    # remove windows and jar specific files
    find $startdir/src -type l -exec rm {} \;
    find $startdir/src -iname "*.bat"  -exec rm {} \;
    find $startdir/src -iname "*.command" -exec rm {} \;
    rm -r $startdir/src/META-INF   

    mkdir -p $pkgdir/opt/robocode
    cp -r $startdir/src/* $pkgdir/opt/robocode

    # link volatile dirs to /var/lib
    mkdir -p $pkgdir/var/lib/robocode/config
    chmod 777 $pkgdir/var/lib/robocode/config
    ln -s /var/lib/robocode/config $pkgdir/opt/robocode/config
    
    mv $pkgdir/opt/robocode/robots $pkgdir/var/lib/robocode/robots
    find $pkgdir/var/lib/robocode/robots -type d -exec chmod 777 {} \;
    ln -s /var/lib/robocode/robots $pkgdir/opt/robocode/robots
    
    mv $pkgdir/opt/robocode/roborumble $pkgdir/var/lib/robocode/roborumble
    find $pkgdir/var/lib/robocode/roborumble -type d -exec chmod 777 {} \;
    ln -s /var/lib/robocode/roborumble $pkgdir/opt/robocode/roborumble

    # Menu item
    mkdir -p $pkgdir/usr/share/applications
    install -m 664 $startdir/robocode.desktop $pkgdir/usr/share/applications

    # fix startup scripts
    mkdir -p $pkgdir/usr/bin
    for script in  $pkgdir/opt/robocode/*.sh ; do 
        sed '/^java/!d' -i $script
        sed '1i#!/bin/bash\n\ncd /opt/robocode' -i $script
        mv $script $pkgdir/usr/bin/`basename $script .sh`
    done

    # make scripts in /usr/bin executable
    chmod +x $pkgdir/usr/bin/*
}

