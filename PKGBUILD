# Maintainer: stick <stick@stma.is>
pkgname=ida-eval
pkgver=7.4
pkgrel=1
pkgdesc="Evaluation version of the world's smartest and most feature-full disassembler"
arch=('x86_64')
url='https://www.hex-rays.com/products/ida/'
license=('custom')
makedepends=('fakechroot')
options=('!strip')
_installer='idademo74_linux.run'
source=("$_installer"
        "$pkgname.desktop")
sha256sums=('547373518e2823a94195ea5e06cacf53c101610afa0f642204e7265f4b548045'
            '5f51fea009781672998ffec1c1d63d392e87ac6eb04b637a1ee2827805b8e1db')

package() {
    install -d "$pkgdir"/opt/"$pkgname"
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/usr/share/{icons,applications,licenses/"$pkgname"}
    install -d "$pkgdir"/tmp

    # chroot is needed to prevent the installer from creating a single file outside of prefix
    # have to copy the installer due to chroot
    cp "$srcdir/$_installer" "$pkgdir"/
    chmod +x "$pkgdir"/"$_installer"
    fakechroot chroot "$pkgdir" /"$_installer" --mode unattended \
		--prefix /opt/"$pkgname" --installpassword ""
    rm "$pkgdir"/"$_installer"
    rm "$pkgdir"/tmp/bitrock_installer.log
    rmdir "$pkgdir"/tmp

    # the installer needlessly makes a lot of files executable
    find "$pkgdir"/opt/"$pkgname" -type f -exec chmod -x {} \;
    chmod +x "$pkgdir"/opt/"$pkgname"/{ida64,assistant}

    rm "$pkgdir"/opt/"$pkgname"/{uninstall*,Uninstall*}

    install "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications
    ln -s /opt/"$pkgname"/appico64.png "$pkgdir"/usr/share/icons/"$pkgname".png
    ln -s /opt/"$pkgname"/license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    ln -s /opt/"$pkgname"/ida64 "$pkgdir"/usr/bin/ida64-eval
}
