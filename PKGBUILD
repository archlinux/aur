# Maintainer: Rémy Marquis <https://github.com/rmarquis>
_pkgname=aurodle
pkgbase=$_pkgname-git
pkgname=('aurodle-git' 'pacsaur-git')
pkgver=r414.deafaaf
pkgrel=1
arch=('x86_64')
url="https://github.com/rmarquis/aurodle"
license=('MIT')
makedepends=('git' 'pacman' 'zig' 'scdoc')
source=("$_pkgname::git+https://github.com/rmarquis/aurodle.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    zig build -Doptimize=ReleaseSafe
    scdoc < man/aurodle.1.scd > aurodle.1
    scdoc < man/pacsaur.1.scd > pacsaur.1
}

# Install program $1: binary, man page, completions and license.
_install_program() {
    install -Dm755 "zig-out/bin/$1" "$pkgdir/usr/bin/$1"

    install -Dm644 "$1.1" "$pkgdir/usr/share/man/man1/$1.1"

    install -Dm644 "completions/$1.bash" \
        "$pkgdir/usr/share/bash-completion/completions/$1"

    install -Dm644 "completions/$1.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/$1.fish"

    install -Dm644 "completions/$1.zsh" \
        "$pkgdir/usr/share/zsh/site-functions/_$1"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_aurodle-git() {
    pkgdesc="An AUR helper that builds packages into a local repository"
    depends=('git' 'pacman')
    provides=('aurodle')
    conflicts=('aurodle')

    cd "$_pkgname"
    _install_program aurodle
}

package_pacsaur-git() {
    pkgdesc="pacman's command line for official and AUR packages, built on aurodle"
    # pacsaur does not run aurodle, but its man page and setup rely on it.
    depends=('aurodle' 'git' 'pacman')
    provides=('pacsaur')
    conflicts=('pacsaur')

    cd "$_pkgname"
    _install_program pacsaur
}
