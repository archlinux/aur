# Maintainer: Wang Ruochen <arch@ruo-chen.wang>
pkgname=dosnap-git
_pkgname=${pkgname%-git}
pkgver=r27.9614499
pkgrel=1
pkgdesc="Automatically manage Btrfs snapshots"
arch=('x86_64')
url="https://github.com/weirane/dosnap"
license=('GPL')
depends=('btrfs-progs')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=('etc/dosnap.toml')
options=()
install=
source=("$_pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --locked --target-dir=target
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --release --locked --target-dir=target
}

package() {
    cd "$srcdir/$_pkgname"
    local _bin=target/release/$_pkgname
    install -Dm755 $_bin -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 dosnap.toml "$pkgdir/etc/dosnap.toml"

    find ./systemd -name 'dosnap-*' -type f \
        -exec install -Dm644 "{}" -t "$pkgdir/usr/lib/systemd/system" \;

    install -d "$pkgdir/usr/share/zsh/site-functions" \
               "$pkgdir/usr/share/bash-completion/completions" \
               "$pkgdir/usr/share/fish/vendor_completions.d"
    $_bin completion --shell zsh >"$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    $_bin completion --shell bash >"$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    $_bin completion --shell fish >"$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
