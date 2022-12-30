# Maintainer: 160R@protonmail.com
_pkgname=page
pkgname=${_pkgname}-git
pkgrel=1
pkgver=v4.6.3
pkgdesc='Pager powered by neovim and inspired by neovim-remote'
arch=('i686' 'x86_64')
url="https://github.com/I60R/page"
license=('MIT')
depends=('neovim' 'gcc-libs' 'file' 'bat')
makedepends=('rust' 'cargo' 'git')
provides=('page')
conflicts=('page')
source=("git+https://github.com/I60R/page.git#branch=main")
md5sums=('SKIP')


pkgver() {
    checkout_project_root
    git describe --tags --abbrev=0
}

package() {
    checkout_project_root

    cargo build --release

    # Install binaries
    install -D -m755 "target/release/page" "$pkgdir/usr/bin/page"
    install -D -m755 "target/release/nv" "$pkgdir/usr/bin/nv"

    # Find last build directory where completions was generated
    out_dir=$(find "target" -name "assets" -type d -printf "%T+\t%p\n" | sort | awk 'NR==1{print $2}')

    # Install shell completions
    install -D -m644 "$out_dir/_page" "$pkgdir/usr/share/zsh/site-functions/_page"
    install -D -m644 "$out_dir/page.bash" "$pkgdir/usr/share/bash-completion/completions/page.bash"
    install -D -m644 "$out_dir/page.fish" "$pkgdir/usr/share/fish/completions/page.fish"

    install -D -m644 "$out_dir/_nv" "$pkgdir/usr/share/zsh/site-functions/_nv"
    install -D -m644 "$out_dir/nv.bash" "$pkgdir/usr/share/bash-completion/completions/nv.bash"
    install -D -m644 "$out_dir/nv.fish" "$pkgdir/usr/share/fish/completions/nv.fish"

    # Install man pages
    install -D -m644 "$out_dir/page.1" "$pkgdir/usr/share/man/man1/page.1"
    install -D -m644 "$out_dir/nv.1" "$pkgdir/usr/share/man/man1/nv.1"

    # Install MIT license
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Ensures that current directory is root of repository
checkout_project_root() {
    cd "$srcdir"
    cd "$_pkgname" > /dev/null 2>&1 || cd ..
}
