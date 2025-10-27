# Maintainer: Fidel Ramos
# Maintainer: AnDee

pkgname=asgardex-appimage
pkgver=1.41.3
pkgrel=1
pkgdesc="Professional Multi-Chain Trading Platform"
arch=('x86_64')
url="https://github.com/asgardex/asgardex-desktop/releases"
license=('MIT')
provides=('asgardex')
validpgpkeys=('9A6461A8CAAAA0AEB8EFDDA8C5334FE4FD04D709')
_appimage="ASGARDEX-${pkgver}-linux.AppImage"
_pkgbin=asgardex
source=("$url/download/v$pkgver/$_appimage")
noextract=("$_appimage")
options=('!strip')

_msgurl="$url/download/v$pkgver/msg${pkgver//./}.asc"
sha256sums=('SKIP')

verify() {
    curl -L -o signedmsg.txt $_msgurl
    gpg --verify signedmsg.txt
    # Check the exit status of gpg --verify
    if [[ $? -ne 0 ]]; then
        echo "Error: GPG verification failed."
        return 1
    fi

    grep "$_appimage" signedmsg.txt | sha256sum --check
    # Check the exit status of sha256sum
    if [[ $? -ne 0 ]]; then
        echo "Error: SHA256 verification failed."
        return 1
    fi

    echo "GPG and SHA256 verification successful."
    return 0
}

prepare() {
    cd "$srcdir"
    chmod +x "$srcdir/$_appimage"
    "$srcdir/$_appimage" --appimage-extract

    # Clean old build dir files
    rm -rf "$srcdir/$_pkgbin"
    mv -f "$srcdir/squashfs-root" "$srcdir/$_pkgbin"

    # find asgardex through $PATH
    # will be in /usr/bin/ but could also be /usr/local/bin if using firejail
    sed -i "s/Exec=AppRun/Exec=\$_pkgbin/" "$srcdir/$_pkgbin/$_pkgbin.desktop"
}

package() {
    cd "$srcdir"

    install -d "$pkgdir/opt/$_pkgbin"
    cp -a "$srcdir/$_pkgbin/." "$pkgdir/opt/$_pkgbin/"
    chmod -R +rx "$pkgdir/opt/$_pkgbin"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgbin/AppRun" "$pkgdir/usr/bin/$_pkgbin"

    install -Dm644 "$srcdir/$_pkgbin/$_pkgbin.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgbin.png"
    install -Dm644 "$srcdir/$_pkgbin/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
    install -Dm644 "$srcdir/$_pkgbin/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$srcdir/$_pkgbin/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
