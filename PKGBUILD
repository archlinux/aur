# Maintainer xgdgsc<xgdgsc@gmail.com>

pkgname=mendeleydesktop
pkgver=1.18
pkgrel=3
pkgdesc="Academic software for managing and sharing research papers (desktop client)"
url=http://www.mendeley.com/release-notes/
arch=(i686 x86_64)
depends=(qt5-webengine)
license=(custom:mendeley_eula)
sha512sums_i686=('63a82863a824e5ce180a31453e68c900ba4bcebf0c228f515db87fe523a3cef8a284dd8c81729741fe7c9795b918d7a25503024aa63692014ce5e4a87a7cad11')
sha512sums_x86_64=('9e72ca02beae2412fb427cfc22da3495ae0bcdcc23b188e5f09e4e29a942a276635be54bf22bbcf08c63cdee102c257c145cce00a361c4b8b48e0f538a81b108')

if [[ $CARCH = i686 ]];then
  _arch=i486
else
  _arch=$CARCH
fi

source_i686=("https://desktop-download.mendeley.com/download/linux/$pkgname-$pkgver-linux-i486.tar.bz2")
source_x86_64=("https://desktop-download.mendeley.com/download/linux/$pkgname-$pkgver-linux-x86_64.tar.bz2")

package() {
    cd "$pkgname-$pkgver-linux-$_arch"

    rm -f share/doc/mendeleydesktop/*.txt
    # Using shared libraries so remove bundled ones
    rm -rf lib/cpp lib/qt lib/ssl lib/libpng12.so.0 lib/mendeleydesktop/plugins
    rm -rf lib/mendeleydesktop/libexec/resources
    rm -rf lib/mendeleydesktop/libexec/translations/qtwebengine_locales
    # Link resources from system Qt
    ln -s /usr/share/qt/resources lib/mendeleydesktop/libexec/
    ln -s /usr/share/qt/translations/qtwebengine_locales lib/mendeleydesktop/libexec/translations/

    install -dm755 "$pkgdir/opt/$pkgname/"
    mv bin lib share "$pkgdir/opt/$pkgname/"

    # Replace default python laucher with custom sh
cat <<'EOF' > "$pkgdir/opt/$pkgname/bin/mendeleydesktop"
#!/bin/bash
export LD_LIBRARY_PATH=/usr/lib/:/opt/mendeleydesktop/lib/:/usr/lib/qt/
export MENDELEY_BUNDLED_QT_PLUGIN_PATH=/lib/qt/plugins/
/opt/mendeleydesktop/lib/mendeleydesktop/libexec/mendeleydesktop.x86_64 "$@"
EOF

    install -dm755 "$pkgdir"/usr/bin
    ln -s "/opt/$pkgname/bin/mendeleydesktop" "$pkgdir/usr/bin/mendeleydesktop"

    cd "$srcdir/$pkgname-$pkgver-linux-$_arch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir"/usr/share/applications
    ln -s /opt/"$pkgname"/share/applications/mendeleydesktop.desktop "$pkgdir"/usr/share/applications/

    # Remove unneeded lines if gconf is not installed.
    if ! which gconftool-2 &>/dev/null;then
    sed -i  '/GCONF/d' \
        "$pkgdir"/opt/"$pkgname"/bin/install-mendeley-link-handler.sh
    fi
    for size in 16 22 32 48 64 128;do
        install -dm755 "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
        ln -s /opt/"$pkgname"/share/icons/hicolor/${size}x${size}/apps/"${pkgname}".png \
          "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
    done
}
