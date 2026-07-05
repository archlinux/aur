# Maintainer: Yile Wang <git-wyl@wyls.top>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Marcus Kida <aur@kimar.mozmail.com>

pkgname=connectiq-sdk-manager
pkgver=9.2.0
pkgrel=1
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('custom')
depends=('libsoup3' 'webkit2gtk-4.1')
makedepends=('patchelf')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('481ea86078ce2e8c7010475e4e2aa2d35446ba6671090443bf222396993c0efc')
package() {
    cd "$srcdir"

    install -Dm644 "share/sdkmanager/acknowledgements.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    # Patch replacing deprecated webkit2gtk-4.0 with webkit2gtk-4.1
    patchelf --replace-needed libwebkit2gtk-4.0.so.37 libwebkit2gtk-4.1.so.0 $pkgdir/usr/bin/$pkgname
    patchelf --replace-needed libjavascriptcoregtk-4.0.so.18 libjavascriptcoregtk-4.1.so.0 $pkgdir/usr/bin/$pkgname
    patchelf --replace-needed libsoup-2.4.so.1 libsoup-3.0.so.0 $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
