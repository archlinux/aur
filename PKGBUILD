# Maintainer: FennecTECH <FennecTECH@gmail.com>
# Contributor: Wayne Hartmann <wayne@bitstorm.pw>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Johannes <maeulen@awp-shop.de>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=bitdefender
pkgver=7.7.1
dist_build='7.7-1' # Build number for upstream .run package.
pkgrel=44
rpm_rel=1809
pkgdesc="BitDefender's Personal UNIX Workstation Antivirus"
arch=('i686' 'x86_64')
url="http://www.bitdefender.com/"
depends=('gtk2' 'libstdc++5' 'atk' 'fontconfig' 'libxext' 'libxrender' 'libxrandr' 'libxi' 'libxcursor' 'libxfixes' 'pango' 'glib2' 'libxinerama' 'libsm')
install=bitdefender.install
license=('custom')
source=('http://download.bitdefender.com/SMB/Workstation_Security_and_Management/BitDefender_Antivirus_Scanner_for_Unices/Unix/Current/EN_FR_BR_RO/Linux/BitDefender-Antivirus-Scanner-'$dist_build'-linux-i586.rpm.run'
        'bitdefender.sh'
        'bitdefender.conf'
        'unpack.sh'
        'http://download.bitdefender.com/updates/update_av32bit/cumulative.zip')
md5sums=('6b20f789d057a37491eee3e429d351d3'
         'f74775c74b44ceabafcc0dbab0ff2318'
         '6df89a673aec1ad103745da47c50dc46'
         '25e860fbd392db85da993ffeb9a0133c'
         'SKIP')

[ "$CARCH" = "x86_64" ] && source=('http://download.bitdefender.com/SMB/Workstation_Security_and_Management/BitDefender_Antivirus_Scanner_for_Unices/Unix/Current/EN_FR_BR_RO/Linux/BitDefender-Antivirus-Scanner-'$dist_build'-linux-amd64.rpm.run'
                                   'bitdefender.sh'
                                   'bitdefender.conf'
                                   'unpack.sh'
                                   'http://download.bitdefender.com/updates/update_av64bit/cumulative.zip')

[ "$CARCH" = "x86_64" ] && md5sums=('1aebcf5798499b8b8c22eb86045a4a7f'
                                    'f74775c74b44ceabafcc0dbab0ff2318'
                                    '6df89a673aec1ad103745da47c50dc46'
                                    '25e860fbd392db85da993ffeb9a0133c'
                                    'SKIP')

package() {
    rpm_base='./bitdefender-scanner-'$pkgver'-'$rpm_rel'.i586.rpm'
    rpm_gui='./bitdefender-scanner-gui-'$pkgver'-'$rpm_rel'.i586.rpm'
    rpm_pkg='BitDefender-Antivirus-Scanner-'$dist_build'-linux-i586.rpm.run'

    if [ "$CARCH" == "x86_64" ]; then
      rpm_base='./bitdefender-scanner-'$pkgver'-'$rpm_rel'.x86_64.rpm'
      rpm_gui='./bitdefender-scanner-gui-'$pkgver'-'$rpm_rel'.x86_64.rpm'
      rpm_pkg='BitDefender-Antivirus-Scanner-'$dist_build'-linux-amd64.rpm.run'
    fi

    cd $srcdir
    bash -c './unpack.sh '$rpm_pkg
    bsdtar -x -f $rpm_base
    bsdtar -x -f $rpm_gui
    cp -r $srcdir/opt $pkgdir
    mkdir -p $pkgdir/usr/share/applications
    ln -s /opt/BitDefender-scanner/share/applications/bdgui.desktop $pkgdir/usr/share/applications/bdgui.desktop

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
