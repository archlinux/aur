# Maintainer: Yizheng Hu <huyizheng@hotmail.com>
# Contributor: Ye Shu <shuye02@outlook.com>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=20.3.13
pkgrel=1
arch=('x86_64')

pkgdesc="Send Anywhere is a multi-platform file sharing service where users can directly share digital content in real time."
url="http://send-anywhere.com"
license=('custom')
depends=('electron8')
makedepends=('asar')

source=("${pkgname}-${pkgver}.deb::https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb" "LICENSE")
sha512sums=('2ad10e770ea84150845b3033177da4125a5c93651a14969566a43a305a8cc6c2c338c10d04ea10b3b48a225cc331170732589b5805d67486cc02b0e84ab5eb56'
            'aeb97a12f246d78cbf202354148b429a037997d68087bceed5d5ce5036443d779c2535138b54347579ddf05994a61b9333913f9261733f367d02e0e9cf7d0b5e')
# If validity check fails, please leave a comment to remind me to update the package version

package(){
    # Extract the data package
    tar -xf data.tar.xz
    cd $srcdir/opt/SendAnywhere

    mkdir -p $pkgdir/usr/lib/$pkgname

    # HACKS FOR SYSTEM ELECTRON
    asar e resources/app.asar resources/app
    sed -i "s|,\"paprika.node\"|,\"/usr/lib/$pkgname/paprika.node\"|" resources/app/src/main/main.prod.js
    export electronVersion=$(tail -1 /usr/lib/electron8/version | cut -d '.' -f 1,2)
    ln -s electron-v8.0-linux-x64 resources/app/node_modules/sqlite3/lib/binding/electron-v$electronVersion-linux-x64  

    # Copy Relevanat data
    cp -r resources/*  $pkgdir/usr/lib/$pkgname/
    rm $pkgdir/usr/lib/$pkgname/app.asar
    cp paprika.node $pkgdir/usr/lib/$pkgname/

    cd $srcdir

    # Create starter script
    echo "#!/bin/sh" >> $pkgname
    echo "exec electron8 /usr/lib/$pkgname/app \$@" >> $pkgname
    mkdir -p $pkgdir/usr/bin
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname

    # Install .desktop and icon
    cp -r usr/share $pkgdir/usr/
    sed -i "s|Exec=.*|Exec=/usr/bin/$pkgname|" $pkgdir/usr/share/applications/SendAnywhere.desktop

    # Add licenses
    install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
