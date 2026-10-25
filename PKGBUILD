# Maintainer: Macitron <macitron3000@gmail.com>

pkgname='polyversal-patcher'
pkgver=2.3.2
pkgrel=1
pkgdesc="A utility script for installing Committee of Zero patches for Science Adventure titles"
arch=('any')
url="https://github.com/CommitteeOfZero/polyversal-coz-linux-patcher"
license=('MIT')
depends=('bash' 'curl' 'protontricks' 'zenity' 'xdg-utils')
optdepends=('flatpak: fall back on Flatpak Protontricks in case of system Protontricks failure')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
_srcdir="polyversal-coz-linux-patcher-$pkgver"
b2sums=('6d30283a8195951ab8a20c673c8dd6f0f224a37ac257b89a75583d1392c921db263c9aa764959d864fad7bac85a432276b6ff79e904bb1ad61719e9fc98e49ab')

prepare() {
    cd "$_srcdir"

    # Store data in ~/.local/share rather than the script's local directory,
    # as you might if you just download the tarball
    sed -i 's|^DATADIR=.*|DATADIR=${XDG_DATA_HOME:-$HOME/.local/share}/polyversal-patcher|' ./polyversal

    # Stamp in the version for --version. The 'aur' channel skips the update check
    sed -i -e "s/^readonly VERSION=.*/readonly VERSION=$pkgver/"    \
           -e "s/^readonly CHANNEL=.*/readonly CHANNEL=aur/"        \
           ./polyversal
}

package() {
    cd "$_srcdir"

    # Binary, license
    install -Dm755 ./polyversal "$pkgdir/usr/bin/polyversal"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    local _docdir="$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 ./README.md "$_docdir/README.md"
    cp -r ./docs "$_docdir/"
}
