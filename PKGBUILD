# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=4.1.1.r0.g45a2a0c
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$_pkgname"
license=('GPL')
options=(!strip)
depends=(
    'bash'
    'man-pages'
    'zip'
    'gum'
    'git'
    'sed'
    'xdg-user-dirs'
    'wget'
    'figlet'
    'pacman'
    'unzip'
    'python'
    'gtk3'
    'noto-fonts-emoji'
    'ttf-joypixels'
    'curl'
    'tar'
)
optdepends=(
    'bash-completion: for Bash completion support'
    'zsh: for Zsh completion support'
    'fish: for Fish completion support'
)

source=("${pkgname}::git+https://github.com/harilvfs/$_pkgname.git")
md5sums=('SKIP')

conflicts=($_pkgname)
makedepends=(git)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git clean -fdx
}

package() {

    install -Dm 755 ${srcdir}/${pkgname}/build/${_pkgname} -t ${pkgdir}/usr/bin/
    install -Dm 755 ${srcdir}/${pkgname}/gtk/${_pkgname}-gtk.py -t ${pkgdir}/usr/bin/

    install -d "$pkgdir/usr/bin/scripts"
    install -Dm 755 ${srcdir}/${pkgname}/scripts/*.sh -t ${pkgdir}/usr/bin/scripts/

    install -Dm 644 ${srcdir}/${pkgname}/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications/

    install -Dm 644 ${srcdir}/${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/

    install -Dm 644 ${srcdir}/${pkgname}/README.md -t ${pkgdir}/usr/share/doc/${pkgname}/

    install -Dm 644 ${srcdir}/${pkgname}/man/${_pkgname}.1 -t ${pkgdir}/usr/share/man/man1/

    install -Dm 644 ${srcdir}/${pkgname}/completions/bash/${_pkgname} -t ${pkgdir}/usr/share/bash-completion/completions/

    install -Dm 644 ${srcdir}/${pkgname}/completions/zsh/_${_pkgname} -t ${pkgdir}/usr/share/zsh/functions/Completion/Unix/

    install -Dm 644 ${srcdir}/${pkgname}/completions/fish/${_pkgname}.fish -t ${pkgdir}/usr/share/fish/completions/

    for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$srcdir/$pkgname/source/logo/product_logo_${size%%x*}.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/$_pkgname.png"
    done
}
