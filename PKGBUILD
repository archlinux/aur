# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=oh-my-ztty-git
pkgver=0.2.17.r2682
pkgrel=1
pkgdesc='Rolling Project Z terminal workspace with zsh presets and AI tools'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/oh-my-ztty'
license=('MIT')
depends=('coreutils' 'diffutils' 'findutils' 'grep' 'util-linux' 'zsh' 'ztty' 'git' 'openssh' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'python' 'pkgconf' 'openssl')
optdepends=('python: completion management' 'zrun: native default shell'
            'neovim: Ink editor profile' 'ripgrep: editor file and text search'
            'fzf: fuzzy finder profile' 'bat: source preview profile'
            'tmux: multiplexer profile' 'nodejs: optional SSMCP tools')
provides=('oh-my-ztty')
conflicts=('oh-my-ztty' 'oh-my-ztty-bin')
# Cargo controls Rust LTO. GCC LTO objects from ring cannot link through clang.
options=('!strip' '!debug' '!lto')
source=("oh-my-ztty::git+$url.git#branch=main"
        'ztty::git+https://github.com/LIghtJUNction/ztty.git#branch=main'
        'ssmcp::git+https://github.com/LIghtJUNction/ssmcp.git#branch=main'
        'zshard::git+https://github.com/LIghtJUNction/zshard.git#branch=main'
        'zdot::git+https://github.com/LIghtJUNction/zdot.git#branch=main'
        'zrc::git+https://github.com/LIghtJUNction/zrc.git#branch=main'
        'zfetch::git+https://github.com/LIghtJUNction/zfetch.git#branch=main'
        'zmem::git+https://github.com/LIghtJUNction/zmem.git#branch=main')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    local revisions=0 repository count
    for repository in oh-my-ztty ztty ssmcp zshard zdot zrc zfetch zmem; do
        count=$(git -C "$srcdir/$repository" rev-list --count HEAD) || return 1
        revisions=$((revisions + count))
    done
    printf '%s.r%s\n' "$(cat "$srcdir/oh-my-ztty/VERSION")" "$revisions"
}

build() {
    cd "$srcdir/oh-my-ztty"
    python scripts/rolling_sources.py --prepared-sources "$srcdir" --output "$srcdir/bundle"
}

check() (
    cd "$srcdir/oh-my-ztty"
    # Test fixtures load the real zshard scripts from the suite's components directory.
    local shell_source="$PWD/components/zshard"
    rmdir -- "$shell_source"
    ln -s -- "$srcdir/zshard" "$shell_source"
    trap 'rm -- "$shell_source"; mkdir -- "$shell_source"' EXIT
    make check
    cd "$srcdir/bundle"
    local archive="oh-my-ztty-$(cat "$srcdir/oh-my-ztty/VERSION")-linux-$CARCH.tar.gz"
    sha256sum -c "$archive.sha256"
    tar -xzf "$archive"
    cd oh-my-ztty
    sha256sum --quiet -c MANIFEST.sha256
)

package() {
    cd "$srcdir/bundle"
    local archive="oh-my-ztty-$(cat "$srcdir/oh-my-ztty/VERSION")-linux-$CARCH.tar.gz"
    tar -xzf "$archive" -C "$pkgdir"
    install -d "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    mv "$pkgdir/oh-my-ztty" "$pkgdir/usr/lib/oh-my-ztty"
    cd "$pkgdir/usr/lib/oh-my-ztty"
    printf 'pacman\n%s\n' "$pkgname" > PACKAGE_MANAGER
    ln -s ../lib/oh-my-ztty/bin/omztty "$pkgdir/usr/bin/omztty"
    install -Dm644 "$srcdir/oh-my-ztty/packaging/oh-my-ztty.desktop" \
        "$pkgdir/usr/share/applications/oh-my-ztty.desktop"
    install -Dm644 packaging/oh-my-ztty.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/oh-my-ztty.svg"
    install -Dm644 packaging/omztty.1 "$pkgdir/usr/share/man/man1/omztty.1"
    install -d "$pkgdir/usr/share/zsh/site-functions" "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 packaging/completions/* -t "$pkgdir/usr/share/zsh/site-functions"
    install -m644 LICENSE licenses/* -t "$pkgdir/usr/share/licenses/$pkgname"
}
