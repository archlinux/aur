# Maintainer: gbr <gbr@protonmail.com>
_pkgname=vibrantlinux
pkgname=vibrantlinux-git
pkgrel=1
pkgdesc='vibranceGUI replacement for Linux (NVIDIA only)'
arch=('x86_64' 'i686')
url='https://gitlab.com/zee220/vibrantlinux'
license=('MIT')
depends=('nvidia-settings'
         'qt5-base')
makedepends=('git'
             'imagemagick')
conflicts=()
source=("$_pkgname::git+$url.git"
        'vibrantLinux.desktop')
sha256sums=('SKIP'
            'SKIP')
pkgver=r12.8f1a430

pkgver()
{
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$_pkgname"
    qmake
    make $MAKEFLAGS
}

package()
{
    cd "$_pkgname"
    make INSTALL_ROOT="$pkgdir" install
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/vibrantLinux/bin/vibrantLinux" "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/vibrantLinux.desktop" "$pkgdir/usr/share/applications/vibrantLinux.desktop"

    convert 'assets/icon.png' -resize '512x512' 'assets/icon512.png'
    install -Dm664 'assets/icon512.png' "$pkgdir/usr/share/icons/hicolor/512x512/apps/vibrantLinux.png"

    install -Dm664 'assets/icon512.png' "$pkgdir/opt/vibrantLinux/bin/assets/icon.png"
}
