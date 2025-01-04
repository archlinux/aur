# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=v4.1.1.r69.g10741d0
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
    'tree-sitter'
    'tree-sitter-bash'
    'gcc-libs'
)
optdepends=(
    'bash-completion: for Bash completion support'
    'zsh: for Zsh completion support'
    'fish: for Fish completion support'
    'ttf-nerd-fonts-symbols: symbols and icons'
)

source=("${_pkgname}::git+https://github.com/harilvfs/$_pkgname.git")
md5sums=('SKIP')

conflicts=($_pkgname)
provides=($_pkgname)
makedepends=('git' 'cargo')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    echo "Version=$pkgver" >> "$_pkgname.desktop"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C link-arg=/usr/lib/libtree-sitter.so -C link-arg=/usr/lib/libtree-sitter-bash.so"
    cd "$_pkgname"
    cargo build --frozen --release --all-features
}

package() {

    install -Dm 755 ${srcdir}/${_pkgname}/build/${_pkgname} -t ${pkgdir}/usr/bin/

    install -Dm 755 ${srcdir}/${_pkgname}/target/release/${_pkgname}-tui -t ${pkgdir}/usr/bin/

    install -d "$pkgdir/usr/bin/scripts"
    install -Dm 755 ${srcdir}/${_pkgname}/scripts/*.sh -t ${pkgdir}/usr/bin/scripts/

    install -Dm 644 ${srcdir}/${_pkgname}/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications/

    install -Dm 644 ${srcdir}/${_pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${_pkgname}/

    install -Dm 644 ${srcdir}/${_pkgname}/README.md -t ${pkgdir}/usr/share/doc/${_pkgname}/

    install -Dm 644 ${srcdir}/${_pkgname}/man/${_pkgname}.1 -t ${pkgdir}/usr/share/man/man1/

    install -Dm 644 ${srcdir}/${_pkgname}/completions/bash/${_pkgname} -t ${pkgdir}/usr/share/bash-completion/completions/

    install -Dm 644 ${srcdir}/${_pkgname}/completions/zsh/_${_pkgname} -t ${pkgdir}/usr/share/zsh/functions/Completion/Unix/

    install -Dm 644 ${srcdir}/${_pkgname}/completions/fish/${_pkgname}.fish -t ${pkgdir}/usr/share/fish/completions/

    for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$srcdir/$_pkgname/source/logo/product_logo_${size%%x*}.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/$_pkgname.png"
    done
}
