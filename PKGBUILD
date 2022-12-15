# Maintainer: 160R@protonmail.com
_pkgname=javelin
pkgname=${_pkgname}-git
pkgrel=1
pkgver=v0.1.0
pkgdesc='A better touchpad experience for laptops with large screens'
arch=('i686' 'x86_64')
url="https://github.com/I60R/javelin"
license=('MIT')
depends=('sway')
makedepends=('rust' 'cargo' 'git')
provides=('javelin')
conflicts=('javelin')
source=("git+https://github.com/I60R/javelin.git")
md5sums=('SKIP')


pkgver() {
    checkout_project_root
    git describe --tags --abbrev=0
}

package() {
    checkout_project_root

    cargo build --release

    # Install binaries
    install -D -m755 "target/release/javelin" "$pkgdir/usr/bin/javelin"

    # Find last build directory where completions was generated
    completions_dir=$(find "target" -name "shell_completions" -type d -printf "%T+\t%p\n" | sort | awk 'NR==1{print $2}')

    # Install shell completions
    install -D -m644 "$completions_dir/_javelin" "$pkgdir/usr/share/zsh/site-functions/_javelin"
    install -D -m644 "$completions_dir/javelin.bash" "$pkgdir/usr/share/bash-completion/completions/javelin.bash"
    install -D -m644 "$completions_dir/javelin.fish" "$pkgdir/usr/share/fish/completions/javelin.fish"

    # Install MIT license
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Ensures that current directory is root of repository
checkout_project_root() {
    cd "$srcdir"
    cd "$_pkgname" > /dev/null 2>&1 || cd ..
}
