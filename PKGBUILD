# Contributor: Ye Shu <shuye02@outlook.com>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=21.3.26
pkgrel=1
arch=('x86_64')

pkgdesc="Send Anywhere is a multi-platform file sharing service where users can directly share digital content in real time."
url="http://send-anywhere.com"
license=('custom')
depends=('electron8')
makedepends=('asar')

source=("${pkgname}-${pkgver}.deb::https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb" "LICENSE")
sha512sums=('bf958acbbaed096db7727c7c1e58ac6de114ce25cb139d9121323e9602ba5267cf43d83ada7d932e1a4a2838c7d9b2739de2437bca17501fd1825cff0d4a39f8'
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

    # Copy Relevanat data
    cp -r resources/app  $pkgdir/usr/lib/$pkgname/
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
    sed -i "s|StartupWMClass=.*|StartupWMClass=Send Anywhere|" $pkgdir/usr/share/applications/SendAnywhere.desktop

    # Add licenses
    install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
