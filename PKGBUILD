#Maintainer:gaelic<gaelic@luchmhor.net>

pkgname=mendeleydesktop-dev
pkgshortname=mendeleydesktop
pkgver=1.18.0_dev3
_pkgver=1.18-dev3
pkgrel=1
pkgdesc="Academic software for managing and sharing research papers (desktop client)"
url=https://www.mendeley.com/release-notes/development/
arch=(i686 x86_64)
depends=(qt5-webengine qt5-svg qt5-webkit)
conflicts=(mendeleydesktop)
license=(custom:mendeley_eula)
install=mendeleydesktop.install
sha256sums=('' '4603511767b23ba44820b1742e82043a667822146bcd3ebc8e9bdcfdb87ed050')

if [[ $CARCH = i686 ]];then
  _arch=i486
  sha256sums[0]='b3ebbee2ef2a79d6d1aedda9be9262a713889c180908f6ba9f7b14e8920363a2'

else
  _arch=$CARCH
  sha256sums[0]='dd5bff6ca8d5dfa734aa92cc4b4eae83bfac8622733096e135f382b4a40bab5a'
fi

if which gconftool-2 &>/dev/null;then
  depends=(${depends[@]} gconf)
fi

source=("http://desktop-download.mendeley.com/download/linux/$pkgshortname-$_pkgver-linux-$_arch.tar.bz2"
        'mendeleydesktop.install')

package() {
    cd "$pkgshortname-$_pkgver-linux-$_arch"

    rm -f share/doc/mendeleydesktop/*.txt

    install -dm755 "$pkgdir/opt/$pkgshortname/"
    mv bin lib share "$pkgdir/opt/$pkgshortname/"
    #ln -s "../lib/mendeleydesktop/libexec/mendeleydesktop.$_arch" "$pkgdir/opt/$pkgshortname/bin/$pkgshortname"
    cd "$pkgdir"
    sed -i '1s@^#!/usr/bin/python$@&2@' opt/"$pkgshortname"/bin/mendeleydesktop
    #install -Dm755 "bin/mendeleydesktop" "$pkgdir/usr/bin/mendeleydesktop"
    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/"$pkgshortname"/bin/mendeleydesktop "$pkgdir/usr/bin/mendeleydesktop"

    cd "$srcdir/$pkgshortname-$_pkgver-linux-$_arch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgshortname/LICENSE"

    install -dm755 "$pkgdir"/usr/share/applications
    ln -s /opt/"$pkgshortname"/share/applications/mendeleydesktop.desktop "$pkgdir"/usr/share/applications/

    #Romove bundled Qt from package
    cat << __EOF__
			Removing bundled Qt library.
			If you have troubles with mendeleydesktop (e.g. HiDPI) please comment the following line in the PKGBUILD:
			rm -rf "$pkgdir"/opt/"$pkgshortname"/lib/qt
__EOF__
		
    #rm -rf "$pkgdir"/opt/"$pkgshortname"/lib/qt

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
