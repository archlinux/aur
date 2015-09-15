# Maintainer: Wayne Hartmann <teodh4@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Johannes <maeulen@awp-shop.de>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=bitdefender
pkgver=7.6
pkgrel=12.1
_build=3
_guiver=1.0
_guibuild=3
pkgdesc="BitDefender's Personal UNIX Workstation Antivirus"
arch=('i686' 'x86_64')
url="http://www.bitdefender.com/"
depends=('gtk2' 'libstdc++5' 'atk' 'fontconfig' 'libxext' 'libxrender' 'libxrandr' 'libxi' 'libxcursor' 'libxfixes' 'pango' 'glib2' 'libxinerama' 'libsm')
install=bitdefender.install
license=('custom')
source=(http://download.bitdefender.com/repos/rpm/bitdefender/i586/bitdefender-scanner-$pkgver-$_build.i586.rpm
        http://download.bitdefender.com/repos/rpm/bitdefender/i586/bitdefender-scanner-gui-$_guiver-$_guibuild.i586.rpm
        bitdefender.sh
        bitdefender.conf)
md5sums=('9d90c7b4133ae6648e4371f4e92d7853'
         'd7812ffcc01137a41d738170a28be8a1'
         'f74775c74b44ceabafcc0dbab0ff2318'
         '6df89a673aec1ad103745da47c50dc46')
         
[ "$CARCH" = "x86_64" ] && source=(http://download.bitdefender.com/repos/rpm/bitdefender/x86_64/bitdefender-scanner-$pkgver-$_build.x86_64.rpm
                                   http://download.bitdefender.com/repos/rpm/bitdefender/x86_64/bitdefender-scanner-gui-$_guiver-$_guibuild.x86_64.rpm
                                   bitdefender.sh
                                   bitdefender.conf)
         
[ "$CARCH" = "x86_64" ] && md5sums=('3da9c645fc7e3f1b2b02e5906dc362b1'
                                    'a752eb979172de0f7cfa21d723b806d1'
                                    'f74775c74b44ceabafcc0dbab0ff2318'
                                    '6df89a673aec1ad103745da47c50dc46')

package() {
    cd $srcdir
    cp -r $srcdir/opt $pkgdir
    cp -r $srcdir/usr $pkgdir

    # generate configuration
    sed -i 's|\$\$DIR|/opt/BitDefender-scanner|g' $pkgdir/opt/BitDefender-scanner/etc/bdscan.conf.dist 
    mv $pkgdir/opt/BitDefender-scanner/etc/bdscan.conf.dist $pkgdir/opt/BitDefender-scanner/etc/bdscan.conf

    # use existing key if avalible
    if [ -f "/opt/BitDefender-scanner/etc/bdscan.conf" ]; then
        cat /opt/BitDefender-scanner/etc/bdscan.conf | grep "^Key =" >> "$pkgdir/opt/BitDefender-scanner/etc/bdscan.conf"
    fi

    # add "LicenseAccepted = True" to bdscan.conf
    echo "" >> "$pkgdir/opt/BitDefender-scanner/etc/bdscan.conf"
    echo "LicenseAccepted = True" >> "$pkgdir/opt/BitDefender-scanner/etc/bdscan.conf"

    # generate GUI configuration
    sed -i 's|\$\$DIR|/opt/BitDefender-scanner|g' $pkgdir/opt/BitDefender-scanner/etc/bdgui.conf.dist 
    mv $pkgdir/opt/BitDefender-scanner/etc/bdgui.conf.dist $pkgdir/opt/BitDefender-scanner/etc/bdgui.conf

    # profile
    install -Dm755 $startdir/bitdefender.sh $pkgdir/etc/profile.d/bitdefender.sh

    # create the /etc symlink
    ln -s /opt/BitDefender-scanner/etc $pkgdir/etc/BitDefender-scanner
    mkdir -p $pkgdir/usr/bin/
    ln -sf /opt/BitDefender-scanner/bin/bdgui $pkgdir/usr/bin/bdgui
    ln -sf /opt/BitDefender-scanner/bin/bdscan $pkgdir/usr/bin/bdscan

    # extract the plugins
    mkdir -p $pkgdir/opt/BitDefender-scanner/var/lib/scan/Plugins
    tar -C $pkgdir/opt/BitDefender-scanner/var/lib/scan/Plugins -xzf $pkgdir/opt/BitDefender-scanner/share/engines/Plugins.tar.gz

    # extract skins
    mkdir -p $pkgdir/opt/BitDefender-scanner/var/skins
    tar -C $pkgdir/opt/BitDefender-scanner/var/skins -xzf $pkgdir/opt/BitDefender-scanner/var/skins/Default.tar.gz

    # add /opt/BitDefender-scanner/var/lib to ld.so.conf.d
    install -Dm644 $srcdir/bitdefender.conf $pkgdir/etc/ld.so.conf.d/bitdefender.conf

    # add bash completion
    install -Dm 644 $pkgdir/opt/BitDefender-scanner/share/contrib/bash_completion/bdscan $pkgdir/etc/bash_completion.d/bdscan            
    
    # fix segfaulting
    #  - http://unices.bitdefender.com/2011/11/01/bitdefender-antivirus-scanner-for-unices/    
    if [ "$CARCH" = "x86_64" ]; then
        rm $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so    
        touch $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so.linux-x86_64
        ln -sf /opt/BitDefender-scanner/var/lib/scan/bdcore.so.linux-x86_64 $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so
    else
        rm $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so    
        touch $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so
    fi        
    
}
