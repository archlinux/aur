# Maintainer: Jeremy MountainJohnson <jskier@gmail.com>
# Contributor: Jeremy MountainJohnson <jskier@gmail.com>

pkgname=xfce-evolution-themes
pkgver=4.21.0
pkgrel=1
pkgdesc="The Xfce Evolution theme attempts to rid the Xfce desktop of visual distractions by providing a more consistent look (buttons, scrollbars, menus, etc) across older and newer applications."
arch=('any')
url="http://itgroup.ro/xfce-evolution"
license=(GPLv2)
depends=(gtk-engine-murrine)
optdepends=(lib32-gtk-engine-murrine qt5-styleplugins noto-fonts elementary-xfce-icons nemo)
source=(https://downloads.sourceforge.net/project/xfce-evolution/xfce-evolution-${pkgver}.zip)
sha512sums=('ff03fd07cd68750f250cf6b0db8be8b2feac1636cf8b92022c074c5e5dd01d1c1a6426a5375d7f13323f593fa27d9997ab1a5246d6401f7dc8b372570c636ffc')

package() {
    # Set correct mode on files from zip source extraction
    find $srcdir -type f -exec chmod 644 {} +
    find $srcdir -type d -exec chmod 755 {} +

    # Prepare all theme directories for package
    for i in $srcdir/Xfce\ Evolution*; do
	    if [ -d "$i" ]; then
		    install -dm 755 "$pkgdir/usr/share/themes/${i##*/}"
    		    cp -rp "${i##*/}" "$pkgdir/usr/share/themes/"
	    fi
    done

    # Copy QT font fix over to global font conf
    install -dm 755 "$pkgdir/etc/fonts/conf.avail/" "$pkgdir/etc/fonts/conf.d"
    install -Dm 644 "$srcdir/Xfce Evolution/90-xfce-evolution_qt5fontfix.conf" "$pkgdir/etc/fonts/conf.avail/91-qt5-xfce-evolution-fix.conf"
    ln -s "../conf.avail/91-qt5-xfce-evolution-fix.conf" "$pkgdir/etc/fonts/conf.d/91-qt5-xfce-evolution-fix.conf"
    # Remove unnecessary TOOLS folder
    rm -rf "$pkgdir/usr/share/themes/Xfce Evolution/TOOLS"
}
