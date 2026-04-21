# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname="spritz-wine-bin"
_pkgname=${pkgname%-bin}-tkg
pkgver=11.7
pkgrel=1
buildrel=1
pkgdesc="A compatibility layer for running Windows programs, with experimental custom patches for games (doesn't conflict with other Wine installations)"
url="https://github.com/NelloKudo/spritz-wine-aur"
license=(LGPL)
arch=('x86_64')
depends=(
    'attr'                  'desktop-file-utils'
    'fontconfig'            'freetype2'
    'gcc-libs'              'gettext'
    'glib2'                 'glibc'
    'libpcap'               'libunwind'
    'libx11'                'libxcursor'
    'libxext'               'libxi'
    'libxkbcommon'          'libxrandr'
    'systemd-libs'          'wayland'
    'base-devel'
)
source=("https://github.com/NelloKudo/spritz-wine-aur/releases/download/${_pkgname}-${pkgver}-${buildrel}/${_pkgname}-staging-wow64-${pkgver}-${buildrel}-x86_64.tar.xz"
        "winestart.c")
sha256sums=('55243996cf100094ed716b0d0644a94f35bb5ae01a74c8d73c5820c01b56369e'
            'ebe0fd2eb64c01c561fd9cba40f3488f2c8df3fbf60c819915491a7cad0bd237')

package() {
    msg2 "Building launch wrapper..."
    env cc "${srcdir}"/winestart.c -Wl,-s -Oz -march=x86-64 -o "${srcdir}"/winestart

    # Install to /opt
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/$_pkgname-staging-wow64-$pkgver-$buildrel" "$pkgdir/opt/$_pkgname"

    ## Add simple wrapper and link it to /usr/bin/
    cp "${srcdir}"/winestart "$pkgdir/opt/$_pkgname/bin"
    chmod +x "$pkgdir/opt/$_pkgname/bin/winestart"

    # Symlink to /usr/bin as 'spritz-wine'
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/bin/winestart" "$pkgdir/usr/bin/spritz-wine"
}
