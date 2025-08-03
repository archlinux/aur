# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname=neosu-bin
_pkgname=${pkgname%-bin}
pkgver=39.02
pkgrel=1
pkgdesc="Third-party McOsu fork, with additional features"
arch=(x86_64)
url="https://github.com/kiwec/neosu"
license=(GPL-3.0-only)
depends=(acl libmd libglvnd glu libxrender libxrandr libx11 \
        libxfixes libxext libxi libxdmcp libxau libxcb util-linux-libs)
options=(!strip)
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/kiwec/neosu/releases/download/v$pkgver/neosu-linux-x64.tar.gz"
  "$_pkgname.png"
  "$_pkgname.desktop"
  "$_pkgname-soloud.desktop"
  "$_pkgname.sh"
)

sha256sums=('feac5c5b937bb6a0c2bf567c39c126d9afcb36b63528bb8955644a66d444f4cc'
            'f74e0a47c46aa33c708211acef3f0140c63c904c09b7eb97410276eec403803c'
            'f545fb2ea01de0e0fd9acbdaea1a125bbc769b3eeda11e1dffa6ae5c03568bf2'
            '80b16b47231dd1c0ba47e53842178b8bd0165d376500223ca3a1c9ee19cdcf08'
            '8dda2b45ea02d6f259ff452b4e45ba91b35a15a31976131e1da558ec962980c2')

package() {
    cd "$srcdir"

    # neosu currently creates its configuration files in the same folder
    # as the executable, hence it's better to install it in one's $HOME/.local/share. 
    XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

    # Installing binaries
    install -dm755 "$pkgdir/$XDG_DATA_HOME/neosu"
    cp -a "$srcdir/neosu"/* "$pkgdir/$XDG_DATA_HOME/neosu/"
    chmod 755 "$pkgdir/$XDG_DATA_HOME/neosu/neosu"

    # Resetting neosu folder ownership to user
    chown -R $USER:$USER "$pkgdir/$XDG_DATA_HOME/neosu"

    # Installing script
    install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/neosu"

    # Install pixmap and desktop files
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/neosu.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/neosu.desktop"
    install -Dm644 "$_pkgname-soloud.desktop" "$pkgdir/usr/share/applications/neosu-soloud.desktop"
}
