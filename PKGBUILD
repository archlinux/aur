
# Maintainer: chenss <ufbycd@163.com>

pkgname=nueclipse
_pkgname=NuEclipse
pkgver=1.01.017
pkgrel=1
pkgdesc="Ecipse base C/C++ IDE for Nuvoton Microcontroller"
arch=('x86_64')
url="www.nuvoton.com"
license=('custom')
groups=()
depends=("java-runtime" "arm-none-eabi-gcc" "arm-none-eabi-newlib" "arm-none-eabi-gdb")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://www.nuvoton.com.cn/export/resource-files/${_pkgname}_V${pkgver}_Linux_Setup.tar.gz")
#https://www.nuvoton.com.cn/export/resource-files/NuEclipse_V1.01.017_Linux_Setup.tar.gz
md5sums=('34746445962d68f6e622099b61772268')
#GCC_VERSION=gcc-arm-none-eabi-6-2017-q1-update

prepare() {
    cd "$srcdir/${_pkgname}_V${pkgver}_Linux_Setup"
    sed -i -e '2c /usr/bin' eclipse/eclipse.ini
    rm -rf eclipse/java-*
}

package() {
    cd "$srcdir/${_pkgname}_V${pkgver}_Linux_Setup"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -afr eclipse/* "$pkgdir/usr/share/$pkgname"
    #tar -xf "Others/${GCC_VERSION}-linux.tar.bz2" -C "$pkgdir/usr/share/$pkgname"
    install -Dm644 Others/10-openocd-nulink.rules "$pkgdir/etc/udev/rules.d/10-openocd-nulink.rules"
    install -Dm644 UserManual/UM_NuEclipse_EN.pdf "$pkgdir/usr/share/doc/$pkgname/UM_NuEclipse_EN.pdf"
    install -Dm644 UserManual/UM_NuEclipse_SC.pdf "$pkgdir/usr/share/doc/$pkgname/UM_NuEclipse_SC.pdf"

    install -D /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/bash
export ECLIPSE_HOME=/usr/share/$pkgname
exec \$ECLIPSE_HOME/eclipse "\$@"
END

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<END
[Desktop Entry]
Name=NuEclipse
Comment=Embedded C/C++ IDE for Nuvoton Microcontroller
Icon=/usr/share/$pkgname/icon.xpm
Exec=/usr/share/$pkgname/eclipse
Terminal=false
Type=Application
Categories=Development;IDE;Java;
StartupNotify=true
END
}
