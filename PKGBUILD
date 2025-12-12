#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=spw
pkgver=3.0
pkgrel=1
pkgdesc="Secure password generator with multiple algorithms and hardware RNG support"
arch=('any')
url="https://gitlab.com/Plague_Doctor/spw"
license=('GPL')
depends=('python')
optdepends=('xclip: clipboard support (X11)'
            'wl-clipboard: clipboard support (Wayland)'
            'python-qrcode: QR code display in interactive mode'
            'bash-completion: bash completion support'
            'zsh-completions: zsh completion support'
            'fish: fish completion support')
makedepends=('git')
source=("$pkgname::git+https://gitlab.com/Plague_Doctor/spw")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --abbrev=0 | sed 's/^v//'
}

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

build() {
    cd "$srcdir/$pkgname"
    # Update version and date in spw.py to match the git tag
    local tag_version=$(git describe --tags --abbrev=0 | sed 's/^v//')
    local build_date=$(date -u '+%B %Y')
    sed -i "s/^spw_version = .*/spw_version = \"$tag_version\"/" spw.py
    sed -i "s/^spw_date = .*/spw_date = \"$build_date\"/" spw.py
}

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1/"
    install -d "$pkgdir/usr/share/dict/"
    install "$srcdir/$pkgname/spw.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname/dict/spw_en" "${pkgdir}/usr/share/dict/spw_en"
    install -Dm644 "$srcdir/$pkgname/dict/spw_diceware" "${pkgdir}/usr/share/dict/spw_diceware"
    install -Dm644 "$srcdir/$pkgname/man/spw.1" "${pkgdir}/usr/share/man/man1/"

    # Install shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions/"
    install -d "$pkgdir/usr/share/zsh/site-functions/"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 "$srcdir/$pkgname/completions/spw-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/spw"
    install -Dm644 "$srcdir/$pkgname/completions/_spw" "${pkgdir}/usr/share/zsh/site-functions/_spw"
    install -Dm644 "$srcdir/$pkgname/completions/spw.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/spw.fish"

    # Install completion files to /usr/share/spw/completions for --install-completion to reference
    install -d "$pkgdir/usr/share/spw/completions/"
    install -Dm644 "$srcdir/$pkgname/completions/spw-completion.bash" "${pkgdir}/usr/share/spw/completions/"
    install -Dm644 "$srcdir/$pkgname/completions/_spw" "${pkgdir}/usr/share/spw/completions/"
    install -Dm644 "$srcdir/$pkgname/completions/spw.fish" "${pkgdir}/usr/share/spw/completions/"
}
