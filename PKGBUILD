# Maintainer: robertfoster
# Contributor: Sebastian Jug <seb AT stianj DOT ug>

pkgname=openbazaar-bin
_name=${pkgname%-bin}
pkgver=2.3.7
pkgrel=1
pkgdesc="OpenBazaar Client, Decentralized Peer to Peer Marketplace for Bitcoin -- Static binaries"
arch=('x86_64')
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=('desktop-file-utils' 'gconf' 'glibc' 'gtk2' 'libcap' 'libgcrypt' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python' 'xdg-utils')
makedepends=('npm')
optdepends=('gnome-keyring' 'gvfs' 'libgnome-keyring' 'lsb-release')
conflicts=('openbazaar')
provides=('openbazaar')
install=$pkgname.install
source=("https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${pkgver}/openbazaar2_${pkgver}_amd64.deb"
"${_name}.desktop")

package() {
    tar -xf data.tar.xz -C $pkgdir
    
    chmod -R 755 $pkgdir/usr/
    
    install -Dm644 $pkgdir/usr/lib/openbazaar2/LICENSES.chromium.html $pkgdir/usr/share/licenses/${_name}/LICENSES.chromium.html
    
    cd $pkgdir
    rm -rf usr/share/lintian
    mv usr/lib/openbazaar2 usr/lib/openbazaar
    rm usr/bin/openbazaar2
    ln -sr /usr/lib/openbazaar/openbazaar2 $pkgdir/usr/bin/openbazaar
    cp $srcdir/${_name}.desktop usr/share/applications/
    rm usr/share/applications/openbazaar2.desktop
    mv usr/share/doc/openbazaar2 usr/share/doc/openbazaar
    
    cd $pkgdir/usr/lib/openbazaar/resources/app
    npm prune --production
    rm -rf ../openbazaar-go
    find . -name "example" -prune -exec rm -r '{}' \; \
    -or -name "examples" -prune -exec rm -r '{}' \; \
    -or -name "test" -prune -exec rm -r '{}' \; \
    -or -name "temp" -prune -exec rm -r '{}' \;
}

md5sums=('73d348eb60142d23dddb12d49648343c'
         'e547247b5aa7cd2c195286e2ec760883')
