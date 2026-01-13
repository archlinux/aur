# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname="spritz-wine-bin"
_pkgname=${pkgname%-bin}-tkg
pkgver=11.0
pkgrel=3
buildrel=3
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
sha256sums=('c895e8a269fbe7bb4df543846c96e812c49ce3bfbd64d8be2f5f6a80ee50db5a'
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
