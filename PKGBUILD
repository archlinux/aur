# Maintainer: 160R@protonmail.com
_pkgname=page
pkgname=${_pkgname}-git
pkgrel=1
pkgver=v4.6.0
pkgdesc='Pager powered by neovim and inspired by neovim-remote'
arch=('i686' 'x86_64')
url="https://github.com/I60R/page"
license=('MIT')
depends=('neovim' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('page')
conflicts=('page')
source=("git+https://github.com/I60R/page.git")
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
    completions_dir=$(find "target" -name "shell_completions" -type d -printf "%T+\t%p\n" | sort | awk 'NR==1{print $2}')

    # Install shell completions
    install -D -m644 "$completions_dir/_page" "$pkgdir/usr/share/zsh/site-functions/_page"
    install -D -m644 "$completions_dir/page.bash" "$pkgdir/usr/share/bash-completion/completions/page.bash"
    install -D -m644 "$completions_dir/page.fish" "$pkgdir/usr/share/fish/completions/page.fish"

    install -D -m644 "$completions_dir/_nv" "$pkgdir/usr/share/zsh/site-functions/_nv"
    install -D -m644 "$completions_dir/nv.bash" "$pkgdir/usr/share/bash-completion/completions/nv.bash"
    install -D -m644 "$completions_dir/nv.fish" "$pkgdir/usr/share/fish/completions/nv.fish"

    # Install MIT license
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Ensures that current directory is root of repository
checkout_project_root() {
    cd "$srcdir"
    cd "$_pkgname" > /dev/null 2>&1 || cd ..
}
