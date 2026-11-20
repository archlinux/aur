# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=oh-my-ztty-bin
pkgver=0.2.5
pkgrel=1
pkgdesc='Lean Project Z terminal workspace with zsh presets and explicit AI tools'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/oh-my-ztty'
license=('MIT')
depends=('bash' 'coreutils' 'diffutils' 'findutils' 'grep' 'zsh' 'git' 'openssh'
         'glibc' 'gcc-libs' 'libx11' 'libxft' 'libxrender' 'fontconfig'
         'freetype2' 'harfbuzz' 'libglvnd' 'wayland' 'libxkbcommon' 'hicolor-icon-theme')
optdepends=('neovim>=0.11: native Ink editor profile'
            'ripgrep: editor file and text search'
            'fzf: fuzzy finder profile'
            'bat: source preview profile'
            'tmux: multiplexer profile'
            'ttf-jetbrains-mono: preferred terminal font'
            'xdg-utils: open terminal hyperlinks'
            'rsync: ssmcp workspace synchronization'
            'nodejs: optional ssmcp browser tools')
provides=("oh-my-ztty=$pkgver")
conflicts=('oh-my-ztty')
options=('!strip' '!debug')
source=('oh-my-ztty.desktop' 'README.archlinux')
sha256sums=('775c292e77996d9e32c78963909ddce7eb836c612e88195721a1a5befcec8690' '8cdff13beef76595d6d8c740c6f6873189c0c1f5e74f116dda0305100b6af099')
source_x86_64=("$url/releases/download/v$pkgver/oh-my-ztty-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('79d58efac183069e9d50701374fc76dc9938d96d69c9a58d35252a629129a388')
source_aarch64=("$url/releases/download/v$pkgver/oh-my-ztty-$pkgver-linux-aarch64.tar.gz")
sha256sums_aarch64=('40cdf0fe1cb714d141fcab4328f98f8d73a789a485b112ed6a95cb36dcb6f3b5')

check() {
    cd "$srcdir/oh-my-ztty"
    test "$(cat VERSION)" = "$pkgver"
    sha256sum --check MANIFEST.sha256
}

package() {
    cd "$srcdir/oh-my-ztty"
    install -d "$pkgdir/usr/lib/oh-my-ztty" "$pkgdir/usr/bin"
    cp -a . "$pkgdir/usr/lib/oh-my-ztty/"
    printf 'pacman\n' > "$pkgdir/usr/lib/oh-my-ztty/PACKAGE_MANAGER"
    chmod 644 "$pkgdir/usr/lib/oh-my-ztty/PACKAGE_MANAGER"
    ln -s ../lib/oh-my-ztty/bin/omztty "$pkgdir/usr/bin/omztty"
    install -Dm644 "$srcdir/oh-my-ztty.desktop" \
        "$pkgdir/usr/share/applications/oh-my-ztty.desktop"
    install -Dm644 packaging/oh-my-ztty.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/oh-my-ztty.svg"
    install -Dm644 packaging/omztty.1 "$pkgdir/usr/share/man/man1/omztty.1"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -m644 packaging/completions/* -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/README.archlinux" "$pkgdir/usr/share/doc/$pkgname/README"
}
