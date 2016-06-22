# Maintainer: FennecTECH <FennecTECH@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Johannes <maeulen@awp-shop.de>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=bitdefender
pkgver=7.7.1
pkgrel=42
_build=3
_guiver=1.0
_guibuild=3
pkgdesc="BitDefender's Personal UNIX Workstation Antivirus"
arch=('i686' 'x86_64')
url="http://www.bitdefender.com/"
depends=('gtk2' 'libstdc++5' 'atk' 'fontconfig' 'libxext' 'libxrender' 'libxrandr' 'libxi' 'libxcursor' 'libxfixes' 'pango' 'glib2' 'libxinerama' 'libsm')
install=bitdefender.install
license=('custom')
source=(http://dl.dropboxusercontent.com/s/x02eivja50i1k20/bitdefender-scanner-7.7.1-1809.i586.rpm?dl=0
        http://dl.dropboxusercontent.com/s/a8klp4coaax7os4/bitdefender-scanner-gui-7.7.1-1809.i586.rpm?dl=0
        bitdefender.sh
        bitdefender.conf
        http://download.bitdefender.com/updates/update_av32bit/cumulative.zip)
md5sums=('SKIP'
         'SKIP'
         'f74775c74b44ceabafcc0dbab0ff2318'
         '6df89a673aec1ad103745da47c50dc46'
         'SKIP')
         
[ "$CARCH" = "x86_64" ] && source=(http://dl.dropboxusercontent.com/s/4730ybtsz2t2z1l/bitdefender-scanner-7.7.1-1809.x86_64.rpm?dl=0
                                   http://dl.dropboxusercontent.com/s/lembl9kgbqh2xir/bitdefender-scanner-gui-7.7.1-1809.x86_64.rpm?dl=0
                                   bitdefender.sh
                                   bitdefender.conf
                                   http://download.bitdefender.com/updates/update_av64bit/cumulative.zip)
         
[ "$CARCH" = "x86_64" ] && md5sums=('SKIP'
                                    'SKIP'
                                    'f74775c74b44ceabafcc0dbab0ff2318'
                                    '6df89a673aec1ad103745da47c50dc46'
                                    'SKIP')

package() {
    cd $srcdir
    cp -r $srcdir/opt $pkgdir
#    cp -r $srcdir/usr $pkgdir

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
#        rm $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so
        install -Dm644 $srcdir/bdcore.so.linux-x86_64 $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so.linux-x86_64
        ln -sf /opt/BitDefender-scanner/var/lib/scan/bdcore.so.linux-x86_64 $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so
    else
        rm $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so    
        install -Dm644 $srcdir/bdcore.so.linux-x86 $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so.linux-x86
	ln -sf /opt/BitDefender-scanner/var/lib/scan/bdcore.so.linux-x86 $pkgdir/opt/BitDefender-scanner/var/lib/scan/bdcore.so
    fi

    # latest deffinitions
        install -Dm644 $srcdir/Plugins/* $pkgdir/opt/BitDefender-scanner/var/lib/scan/Plugins
    
}
