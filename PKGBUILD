# Maintainer: robertfoster
# Contributor: Sebastian Jug <seb AT stianj DOT ug>

pkgname=openbazaar-bin
_name=${pkgname%-bin}
pkgver=2.0.21
pkgrel=1
pkgdesc="OpenBazaar Client, Decentralized Peer to Peer Marketplace for Bitcoin -- Static binaries"
arch=('i686' 'x86_64')
url="https://github.com/OpenBazaar/OpenBazaar-Client"
license=('MIT')
depends=('desktop-file-utils' 'gconf' 'glibc' 'gtk2' 'libcap' 'libgcrypt' 'libnotify' 'libxtst' 'nodejs' 'nss' 'openbazaard' 'python' 'xdg-utils')
optdepends=('gnome-keyring' 'gvfs' 'libgnome-keyring' 'lsb-release')
conflicts=('openbazaar')
install="$pkgname.install"
source_i686=("https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${pkgver}/openbazaar2_${pkgver}_i386.deb")
source_x86_64=("https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${pkgver}/openbazaar2_${pkgver}_amd64.deb")

case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  i686) export GOARCH=i386 ;;
esac

package() {
    msg2 "Extracting the data.tar.xz..."
    tar -xf data.tar.xz -C "${pkgdir}/"

    msg2 "Fixing permissions..."
    chmod -R 755 "$pkgdir"/usr/

    msg2 "Installing licenses..."
    install -Dm644 "$pkgdir/usr/lib/openbazaar2/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/${_name}/LICENSES.chromium.html"

    msg2 "Final Clean..."
    cd $pkgdir	
    rm -rf usr/share/lintian
    mv usr/lib/openbazaar2 usr/lib/openbazaar
    rm usr/bin/openbazaar2
    ln -sr /usr/lib/openbazaar/openbazaar2 $pkgdir/usr/bin/openbazaar
    mv usr/share/applications/openbazaar2.desktop usr/share/applications/openbazaar.desktop
    mv usr/share/doc/openbazaar2 usr/share/doc/openbazaar
    mv usr/share/pixmaps/openbazaar2.png usr/share/pixmaps/openbazaar.png
    sed -i "s|openbazaar2|openbazaar|g" usr/share/applications/openbazaar.desktop

    cd $pkgdir/usr/lib/openbazaar/resources/app
    npm prune --production
    rm -rf ../openbazaar-go
    find . -name "example" -prune -exec rm -r '{}' \; \
      	 	-or -name "examples" -prune -exec rm -r '{}' \; \
        	-or -name "test" -prune -exec rm -r '{}' \; \
        	-or -name "temp" -prune -exec rm -r '{}' \; 
}



md5sums_i686=('802c072c3980458cfa0f351e9bc1d225')
md5sums_x86_64=('9b97c4571c472f5db46785049f524989')
md5sums_i686=('c99e5279fd2d96e547c900627e0b8e92')
md5sums_x86_64=('ba5e51f6fc8cc035ab667b5e995de9fe')
