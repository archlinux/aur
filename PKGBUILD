# Maintainer: Chance Chen <ufbycd@163.com>

pkgname=nueclipse
_pkgname=NuEclipse
pkgver=1.02.029
pkgrel=3
pkgdesc="Ecipse base C/C++ IDE for Nuvoton Microcontroller"
arch=('x86_64')
url="https://www.nuvoton.com/tool-and-software/ide-and-compiler/"
license=('custom')
groups=()
depends=("gtk2" "arm-none-eabi-gcc" "arm-none-eabi-newlib" "arm-none-eabi-gdb")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
source=("https://www.nuvoton.com/export/resource-files/en-us--${_pkgname}_V${pkgver}_Linux_Setup.tar.gz")
sha256sums=('3bde45cd34a3b3a204fe60019291d417c676db86d0bb01b7ff509d53e649f5b3')

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
GDK_BACKEND=x11 exec \$ECLIPSE_HOME/eclipse "\$@"
END

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<END
[Desktop Entry]
Name=NuEclipse
Comment=Embedded C/C++ IDE for Nuvoton Microcontroller
Icon=/usr/share/$pkgname/icon.xpm
Exec=$pkgname
Terminal=false
Type=Application
Categories=Development;IDE;Java;
StartupNotify=true
END
}

# makepkg --printsrcinfo > .SRCINFO
