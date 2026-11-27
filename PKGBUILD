# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=oh-my-ztty-bin
pkgver=0.2.17
pkgrel=1
pkgdesc='Lean Project Z terminal workspace with zsh presets and explicit AI tools'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/oh-my-ztty'
license=('MIT')
depends=('bash' 'coreutils' 'diffutils' 'findutils' 'grep' 'zsh' 'git' 'openssh'
         'glibc' 'gcc-libs' 'ztty' 'hicolor-icon-theme')
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
sha256sums=('775c292e77996d9e32c78963909ddce7eb836c612e88195721a1a5befcec8690' 'edc4d7941882692b9f828ac57a15a3213658ab2ba810dce30985baed9f9a3cdb')
source_x86_64=("$url/releases/download/v$pkgver/oh-my-ztty-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('a09c1bfbf662c9fbc9df5afc3f8bb7577e5fbb6384a078294664ffa0234080c0')
source_aarch64=("$url/releases/download/v$pkgver/oh-my-ztty-$pkgver-linux-aarch64.tar.gz")
sha256sums_aarch64=('db8bc038a691138b1e0309c9c9fa7d546158bb56f31e6d6e665b0616323936be')

check() {
    cd "$srcdir/oh-my-ztty"
    test "$(cat VERSION)" = "$pkgver"
    sha256sum --check MANIFEST.sha256
}

package() {
    cd "$srcdir/oh-my-ztty"
    install -d "$pkgdir/usr/lib/oh-my-ztty" "$pkgdir/usr/bin"
    cp -a . "$pkgdir/usr/lib/oh-my-ztty/"
    local runtime="$pkgdir/usr/lib/oh-my-ztty"
    rm "$runtime/bin/ztty"
    ln -s /usr/bin/ztty "$runtime/bin/ztty"
    sed -i '\|  \./bin/ztty$|d; \|  bin/ztty$|d' "$runtime/MANIFEST.sha256"
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
