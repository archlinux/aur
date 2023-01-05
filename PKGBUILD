# Maintainer: AnDee

_upkgname=asgardex
_pkgname=ASGARDEX
pkgname=asgardex-appimage
pkgver=1.18.6
msgver=(${pkgver//./})
pkgrel=1
pkgdesc="Thorchain wallet desktop app"
arch=('x86_64')
url="https://github.com/thorchain/asgardex-electron/releases"
license=('MIT')
makedepends=('p7zip')
depends=('fuse')
validpgpkeys=('0F1342110E1A10DCAFA7194DABB32D7C24F80F1D' '9A6461A8CAAAA0AEB8EFDDA8C5334FE4FD04D709')
source=("$url/download/v$pkgver/$_pkgname-$pkgver-linux.AppImage" "$url/download/v$pkgver/msg-v$msgver"{,.asc} )
noextract=("$_pkgname-$pkgver.AppImage")
options=('!strip')

shasumappimage=$(curl -sL $url/download/v$pkgver/msg-v$msgver | grep $_pkgname-$pkgver-linux.AppImage | cut -c1-64)
sha256sums=($shasumappimage 'SKIP' 'SKIP')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname-$pkgver-linux.AppImage" $_upkgname.desktop usr/share/icons/hicolor/512x512/apps/$_upkgname.png LICENSE.electron.txt LICENSES.chromium.html
    sed -i "s/Exec=AppRun/Exec=\/usr\/bin\/$_upkgname/" $_upkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname-${pkgver}-linux.AppImage"                   "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"                                         "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/512x512/apps/$_upkgname.png"            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "${pkgdir}/usr/bin/$_upkgname"
    install -Dm644 LICENSE.electron.txt                                         "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html                                       "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
