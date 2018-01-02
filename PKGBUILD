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
depends=('desktop-file-utils' 'gconf' 'glibc' 'gtk2' 'libcap' 'libgcrypt' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python' 'xdg-utils')
optdepends=('gnome-keyring' 'gvfs' 'libgnome-keyring' 'lsb-release')
conflicts=('openbazaar')
install=$pkgname.install
source=(${_name}.desktop)
source_i686=("https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${pkgver}/openbazaar2_${pkgver}_i386.deb")
source_x86_64=("https://github.com/OpenBazaar/openbazaar-desktop/releases/download/v${pkgver}/openbazaar2_${pkgver}_amd64.deb")

case "$CARCH" in
  x86_64) export GOARCH=amd64 ;;
  i686) export GOARCH=i386 ;;
esac

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
    mv usr/share/pixmaps/openbazaar2.png usr/share/pixmaps/openbazaar.png

    cd $pkgdir/usr/lib/openbazaar/resources/app
    npm prune --production
    rm -rf ../openbazaar-go
    find . -name "example" -prune -exec rm -r '{}' \; \
      	 	-or -name "examples" -prune -exec rm -r '{}' \; \
        	-or -name "test" -prune -exec rm -r '{}' \; \
        	-or -name "temp" -prune -exec rm -r '{}' \; 
}

md5sums=('43c9c9ef1d3ca873eea6b6343ca072e8')
md5sums_i686=('c99e5279fd2d96e547c900627e0b8e92')
md5sums_x86_64=('ba5e51f6fc8cc035ab667b5e995de9fe')
