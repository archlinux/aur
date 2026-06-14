# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname=neomod-bin
_pkgname=${pkgname%-bin}
pkgver=43.10
pkgrel=1
pkgdesc="Third-party McOsu fork, with additional features"
arch=(x86_64)
url="https://github.com/neomodnet/neomod"
license=(GPL-3.0-only)
depends=(acl libmd libglvnd glu libxrender libxrandr libx11 \
        libxfixes libxext libxi libxdmcp libxau libxcb util-linux-libs)
options=(!strip)
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/neomodnet/neomod/releases/download/v$pkgver/neomod-linux-x64.tar.gz"
  "$_pkgname.png"
  "$_pkgname.desktop"
  "$_pkgname-bass.desktop"
  "$_pkgname.sh"
)

sha256sums=('d0cae4d5223ed1acb6fa06930cf1bce881b41b799246c92d81bad42645683921'
            'f74e0a47c46aa33c708211acef3f0140c63c904c09b7eb97410276eec403803c'
            '5b4e71eecf4129c6acb1c0ef885b039e203e0cf517dc30ac8f2e9c33bca23544'
            '8ad58373f8f6298136c454c3b1af6819debfa5f94a9148829c3d5db67b6874d3'
            '58124a496ae707b645612452b6e7419462e01a90501e4b5ed14d08b9a0df204d')

package() {
    cd "$srcdir"

    # neomod currently creates its configuration files in the same folder
    # as the executable, hence it's better to install it in one's $HOME/.local/share. 
    XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

    # Installing binaries
    install -dm755 "$pkgdir/$XDG_DATA_HOME/neomod"
    cp -a "$srcdir/neomod"/* "$pkgdir/$XDG_DATA_HOME/neomod/"
    chmod 755 "$pkgdir/$XDG_DATA_HOME/neomod/neomod"

    # Resetting neomod folder ownership to user
    chown -R $USER:$USER "$pkgdir/$XDG_DATA_HOME/neomod"

    # Installing script
    install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/neomod"

    # Install pixmap and desktop files
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/neomod.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/neomod.desktop"
    install -Dm644 "$_pkgname-bass.desktop" "$pkgdir/usr/share/applications/neomod-bass.desktop"
}
