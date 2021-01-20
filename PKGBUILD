#Maintainer:gaelic<gaelic@luchmhor.net>

pkgname=mendeleydesktop-dev
pkgshortname=mendeleydesktop
pkgver=1.19.8_dev3 #1.19.4_dev2
pkgrel=1
pkgdesc="Academic software for managing and sharing research papers (desktop client)"
url=https://www.mendeley.com/release-notes/development/
arch=(x86_64)
depends=(qt5-svg qt5-webkit)
conflicts=(mendeleydesktop)
license=(custom:mendeley_eula)
install=mendeleydesktop.install
sha256sums=('123d242a24683c7cbb022b566199bde2a00a2e4298b926574c9696d1c5c4f878' '4603511767b23ba44820b1742e82043a667822146bcd3ebc8e9bdcfdb87ed050')

if which gconftool-2 &>/dev/null;then
  depends=(${depends[@]} gconf)
fi
source=("http://desktop-download.mendeley.com/download/linux/$pkgshortname-${pkgver//_/-}-linux-${arch}.tar.bz2"
        'mendeleydesktop.install')

package() {
    cd "$pkgshortname-${pkgver//_/-}-linux-$arch"

    rm -f share/doc/mendeleydesktop/*.txt

    install -dm755 "$pkgdir/opt/$pkgshortname/"
    mv bin lib share "$pkgdir/opt/$pkgshortname/"
    #ln -s "../lib/mendeleydesktop/libexec/mendeleydesktop.$arch" "$pkgdir/opt/$pkgshortname/bin/$pkgshortname"
    cd "$pkgdir"
    sed -i '1s@^#!/usr/bin/python$@&2@' opt/"$pkgshortname"/bin/mendeleydesktop
    #install -Dm755 "bin/mendeleydesktop" "$pkgdir/usr/bin/mendeleydesktop"
    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/"$pkgshortname"/bin/mendeleydesktop "$pkgdir/usr/bin/mendeleydesktop"

    cd "$srcdir/$pkgshortname-${pkgver//_/-}-linux-$arch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgshortname/LICENSE"

    install -dm755 "$pkgdir"/usr/share/applications
    ln -s /opt/"$pkgshortname"/share/applications/mendeleydesktop.desktop "$pkgdir"/usr/share/applications/

    #Romove bundled Qt from package
    cat << __EOF__
			Removing bundled Qt library.
			If you have troubles with mendeleydesktop (e.g. HiDPI) please comment the following line in the PKGBUILD:
	#		rm -rf "$pkgdir"/opt/"$pkgshortname"/lib/qt
__EOF__

    #Remove unneeded lines if gconf is not installed.
    if ! which gconftool-2 &>/dev/null;then
    sed -i '6d;74d;75d' \
        "$pkgdir"/opt/"$pkgshortname"/bin/install-mendeley-link-handler.sh
    fi
    #force mendeley to use bundled qt because which under qt 4.8 crashes at start point
    #make sure you remove any old versions of ".desktop" file of mendeley in ~/.local/share/applications/
    sed -i 's/^Exec.*$/& --force-bundled-qt/' "$pkgdir"/opt/"$pkgshortname"/share/applications/mendeleydesktop.desktop
    for size in 16 22 32 48 64 128;do
        install -dm755 "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
        ln -s /opt/"$pkgshortname"/share/icons/hicolor/${size}x${size}/apps/"${pkgshortname}".png \
          "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
    done
}
