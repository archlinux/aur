# Maintainer: 160R@protonmail.com
_pkgname=page
pkgname=${_pkgname}-git
pkgrel=1
pkgver=v1.8.0.r1.gb67b846
pkgdesc='pager that utilizes nvim terminal buffer'
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
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    checkout_project_root

    cargo build --release

    # Install binaries
    install -D -m755 "target/release/page" "$pkgdir/usr/bin/page"
    install -D -m755 "target/release/page-term-agent" "$pkgdir/usr/bin/page-term-agent"

    # Find last build directory where completions was generated
    completions_dir=$(find "target" -name "shell_completions" -type d -printf "%T+\t%p\n" | sort | awk 'NR==1{print $2}')

    # Install shell completions
    install -D -m644 "$completions_dir/_page" "$pkgdir/usr/share/zsh/site-functions/_page"
    install -D -m644 "$completions_dir/page.bash" "$pkgdir/usr/share/bash-completion/completions/page"
    install -D -m644 "$completions_dir/page.fish" "$pkgdir/usr/share/fish/completions/page.fish"

    # Install MIT license
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Ensures that current directory is root of repository
checkout_project_root() {
    cd "$srcdir"
    cd "$_pkgname" > /dev/null 2>&1 || cd ..
}
