# Maintainer: Mahor Foruzesh <mahor1221@gmail.com>

pkgname=reddish-shift-git
_pkgname="${pkgname%-git}"
pkgver=v0.1.2.r146.25dd72c
pkgrel=2
_pkgsrc="$_pkgname"
pkgdesc="Set color temperature of display according to time of day"
url="https://github.com/mahor1221/reddish-shift"
license=(GPL3)
arch=(x86_64 arm7h aarch64)
depends=(gcc-libs glibc)
makedepends=(cargo)
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgsrc"
    printf "%s.r%s.%s" \
        "$(git describe --tags | cut -d"-" -f1)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --all
}

check() {
    cd "$srcdir/$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --all
}

package() {
    cd "$srcdir/$_pkgsrc"
    install -vDm755 target/release/"$_pkgname" -t "$pkgdir/usr/bin/"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -vDm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 config.toml -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 assets/systemd/"$_pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
    cd "$srcdir/$_pkgsrc/target/release/completion"
    install -vDm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -vDm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -vDm644 "$_pkgname.fish" "$pkgdir/usr/share/fish/completions/$_pkgname.fish"
    install -vDm644 "$_pkgname.elv" "$pkgdir/usr/share/elvish/lib/$_pkgname.elv"
    cd "$srcdir/$_pkgsrc/target/release/man1"
    find -name '*.1' -exec gzip --keep --force "{}" \;
    find -name '*.1.gz' -exec install -vDm644 "{}" -t "$pkgdir/usr/share/man/man1" \;
}
