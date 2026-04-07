# Maintainer: Kanjurito <kanjurito@gmail.com>
pkgname=arch-achievements-rpg-git
_pkgname=arch-achievements
pkgver=1.0.0.r7.63c2e86 # Ce format sera mis à jour par pkgver()
pkgrel=1
pkgdesc="A terminal achievements engine written in Rust (Steam-like achievements for your OS)"
arch=('x86_64')
url="https://github.com/Kanjurito/arch-achievements"
license=('MIT')
depends=('gcc-libs' 'libdbus' 'zsh')
makedepends=('rust' 'cargo' 'git')
provides=('arch-achievements')
conflicts=('arch-achievements')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
    else
        printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
    cd "$_pkgname"
    
    # Install the binary
    install -Dm755 "target/release/arch_achievements" "$pkgdir/usr/bin/arch-achieve"
    
    # Install the Zsh plugin
    install -Dm644 "plugin.zsh" "$pkgdir/usr/share/zsh/plugins/arch-achievements/arch-achievements.plugin.zsh"
    
    # Install README
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
