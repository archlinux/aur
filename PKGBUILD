#Maintainer:gaelic<gaelic@luchmhor.net>

pkgname=mendeleydesktop-dev
pkgshortname=mendeleydesktop
pkgver=1.17.7 #_dev6
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
  sha256sums[0]='b1e9d853d57d4c337fea5e165e63300aba1b1573d9ba51b330ed0c53291a702d'

else
  _arch=$CARCH
  sha256sums[0]='fbbf90cc5b7cc3bc389899d4ce94fe636fef2707ae255f7e6532cf8a31c716aa'
fi

if which gconftool-2 &>/dev/null;then
  depends=(${depends[@]} gconf)
fi

#http://desktop-download.mendeley.com/download/linux/mendeleydesktop-1.14.1-dev5-linux-i486.tar.bz2
#http://desktop-download.mendeley.com/download/linux/mendeleydesktop-1.14.1-dev5-linux-x86_64.tar.bz2
source=("http://desktop-download.mendeley.com/download/linux/$pkgshortname-${pkgver//_/-}-linux-$_arch.tar.bz2"
        'mendeleydesktop.install')

package() {
    cd "$pkgshortname-${pkgver//_/-}-linux-$_arch"

    rm -f share/doc/mendeleydesktop/*.txt

    install -dm755 "$pkgdir/opt/$pkgshortname/"
    mv bin lib share "$pkgdir/opt/$pkgshortname/"
    #ln -s "../lib/mendeleydesktop/libexec/mendeleydesktop.$_arch" "$pkgdir/opt/$pkgshortname/bin/$pkgshortname"
    cd "$pkgdir"
    sed -i '1s@^#!/usr/bin/python$@&2@' opt/"$pkgshortname"/bin/mendeleydesktop
    #install -Dm755 "bin/mendeleydesktop" "$pkgdir/usr/bin/mendeleydesktop"
    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/"$pkgshortname"/bin/mendeleydesktop "$pkgdir/usr/bin/mendeleydesktop"

    cd "$srcdir/$pkgshortname-${pkgver//_/-}-linux-$_arch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgshortname/LICENSE"

    install -dm755 "$pkgdir"/usr/share/applications
    ln -s /opt/"$pkgshortname"/share/applications/mendeleydesktop.desktop "$pkgdir"/usr/share/applications/

    #Romove bundled Qt from package
    #cat << __EOF__
#Removing bundled Qt library.
#If you used "--force-bundled-qt" to start mendeley,
#make sure you remove any old versions of ".desktop" file of mendeley in #~/.local/share/applications/,
#because mendeley will automatically create one there.
#__EOF__
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
